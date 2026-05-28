#!/usr/bin/env bash

set -euo pipefail

UPSTREAM_REPO="${UPSTREAM_REPO:-akaffenberger/firebase-ios-sdk-xcframeworks}"
TARGET_REPO="${TARGET_REPO:-${GITHUB_REPOSITORY:-Entertech/firebase-ios-sdk-xcframeworks}}"
FROM_VERSION="${FROM_VERSION:-12.7.0}"
TO_VERSION="${TO_VERSION:-}"
DRY_RUN="${DRY_RUN:-false}"

upstream_base_url="https://github.com/${UPSTREAM_REPO}/releases/download/"
target_base_url="https://github.com/${TARGET_REPO}/releases/download/"

version_ge() {
  local candidate="$1"
  local minimum="$2"
  [[ "$(printf '%s\n%s\n' "$candidate" "$minimum" | sort -V | head -n 1)" == "$minimum" ]]
}

version_le() {
  local candidate="$1"
  local maximum="$2"
  [[ "$(printf '%s\n%s\n' "$candidate" "$maximum" | sort -V | tail -n 1)" == "$maximum" ]]
}

require_semver() {
  local value="$1"
  local name="$2"
  if ! [[ "$value" =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
    echo "${name} must be a semantic version like 12.7.0, got: ${value}" >&2
    exit 1
  fi
}

release_versions() {
  gh api "repos/${UPSTREAM_REPO}/releases?per_page=100" --paginate --jq '.[].tag_name' |
    grep -E '^[0-9]+\.[0-9]+\.[0-9]+$' |
    sort -V
}

selected_versions() {
  local version
  while IFS= read -r version; do
    if version_ge "$version" "$FROM_VERSION" && version_le "$version" "$TO_VERSION"; then
      printf '%s\n' "$version"
    fi
  done
}

rewrite_package_urls() {
  perl -0pi -e "s#${upstream_base_url}#${target_base_url}#g" Package.swift
  if grep -q "$upstream_base_url" Package.swift; then
    echo "Package.swift still contains upstream release URLs after rewrite." >&2
    exit 1
  fi
}

download_upstream_assets() {
  local version="$1"
  local destination="$2"
  local expected_count="$3"

  gh release download "$version" -R "$UPSTREAM_REPO" -D "$destination"

  local actual_count
  actual_count=$(find "$destination" -type f -name '*.zip' | wc -l | tr -d ' ')
  if [[ "$actual_count" != "$expected_count" ]]; then
    echo "Expected ${expected_count} assets for ${version}, downloaded ${actual_count}." >&2
    exit 1
  fi
}

ensure_target_release() {
  local version="$1"

  if gh release view "$version" -R "$TARGET_REPO" >/dev/null 2>&1; then
    gh release edit "$version" -R "$TARGET_REPO" \
      --title "Firebase iOS SDK ${version}" \
      --notes "Entertech mirror of ${UPSTREAM_REPO} ${version}. Package.swift binary URLs point to Entertech releases."
  else
    gh release create "$version" -R "$TARGET_REPO" \
      --target "release/${version}" \
      --title "Firebase iOS SDK ${version}" \
      --notes "Entertech mirror of ${UPSTREAM_REPO} ${version}. Package.swift binary URLs point to Entertech releases."
  fi
}

upload_target_assets() {
  local version="$1"
  local source_dir="$2"
  local expected_count="$3"
  local assets=()

  mapfile -t assets < <(find "$source_dir" -type f -name '*.zip' | sort)
  if [[ "${#assets[@]}" != "$expected_count" ]]; then
    echo "Expected ${expected_count} local assets for ${version}, found ${#assets[@]}." >&2
    exit 1
  fi

  gh release upload "$version" -R "$TARGET_REPO" "${assets[@]}" --clobber

  local target_count
  target_count=$(gh release view "$version" -R "$TARGET_REPO" --json assets --jq '.assets | length')
  if [[ "$target_count" != "$expected_count" ]]; then
    echo "Expected ${expected_count} target assets for ${version}, found ${target_count}." >&2
    exit 1
  fi
}

mirror_version() {
  local version="$1"
  local base_ref=""
  local expected_count
  local scratch

  echo "::group::Mirror ${version}"

  git fetch origin \
    "+refs/heads/release/${version}:refs/remotes/origin/release/${version}" \
    "+refs/tags/${version}:refs/tags/${version}" || true

  if git show-ref --verify --quiet "refs/remotes/origin/release/${version}"; then
    base_ref="origin/release/${version}"
  elif git show-ref --verify --quiet "refs/tags/${version}"; then
    base_ref="${version}"
  else
    echo "No release branch or tag found for ${version} in ${TARGET_REPO}." >&2
    exit 1
  fi

  git switch --detach "$base_ref"
  rewrite_package_urls

  if ! git diff --quiet -- Package.swift; then
    git add Package.swift
    git commit -m "chore: use Entertech release URLs for ${version}"
  fi

  expected_count=$(gh release view "$version" -R "$UPSTREAM_REPO" --json assets --jq '.assets | length')
  if [[ "$expected_count" == "0" ]]; then
    echo "Upstream release ${version} has no assets." >&2
    exit 1
  fi

  if [[ "$DRY_RUN" == "true" ]]; then
    echo "Dry run: would force-push release/${version}, retag ${version}, and mirror ${expected_count} assets."
    echo "::endgroup::"
    return
  fi

  git push origin "HEAD:refs/heads/release/${version}" --force-with-lease
  git tag -f "$version" HEAD
  git push origin "refs/tags/${version}" --force

  ensure_target_release "$version"

  scratch=$(mktemp -d)
  download_upstream_assets "$version" "$scratch" "$expected_count"
  upload_target_assets "$version" "$scratch" "$expected_count"
  rm -rf "$scratch"

  echo "::endgroup::"
}

require_semver "$FROM_VERSION" "FROM_VERSION"

mapfile -t all_versions < <(release_versions)
if [[ "${#all_versions[@]}" == "0" ]]; then
  echo "No upstream releases found for ${UPSTREAM_REPO}." >&2
  exit 1
fi

if [[ -z "$TO_VERSION" ]]; then
  TO_VERSION="${all_versions[-1]}"
else
  require_semver "$TO_VERSION" "TO_VERSION"
fi

mapfile -t versions < <(printf '%s\n' "${all_versions[@]}" | selected_versions)
if [[ "${#versions[@]}" == "0" ]]; then
  echo "No upstream release versions selected from ${FROM_VERSION} to ${TO_VERSION}." >&2
  exit 1
fi

echo "Upstream repo: ${UPSTREAM_REPO}"
echo "Target repo: ${TARGET_REPO}"
echo "Selected versions: ${versions[*]}"
echo "Dry run: ${DRY_RUN}"

for version in "${versions[@]}"; do
  mirror_version "$version"
done

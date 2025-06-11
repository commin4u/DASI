#!/bin/bash

# Build Flutter app and push to GitHub if build succeeds

set -e  # Exit on any error

REPO_URL="https://github.com/commin4u/DASI.git"
BRANCH="develop"
BASE_DIR="/c/AAnother/PycharmProjects/DASI/DASI"
FLUTTER_DIR="$BASE_DIR/app"
BUILD_OUTPUT_DIR="$FLUTTER_DIR/build/app/outputs/flutter-apk"
APK_FILE="$BUILD_OUTPUT_DIR/app-development-debug.apk"
DEST_APK_FILE="$BASE_DIR/app-development-debug.apk" # NEW: Define target APK path in root
COMMIT_MESSAGE="Pushed new APK version"

echo "[+] Starting Flutter app build and GitHub update..."

# Validate Flutter environment
if ! command -v flutter &> /dev/null; then
  echo "[!] Flutter SDK not found. Please install Flutter or set PATH."
  exit 1
fi

# Navigate to Flutter app directory
cd "$FLUTTER_DIR"

# Ensure correct Git branch
echo "[+] Checking out branch $BRANCH..."
git checkout "$BRANCH" || {
  echo "[!] Failed to checkout branch $BRANCH. Creating if it doesn't exist..."
  git checkout -b "$BRANCH"
}
git pull origin "$BRANCH" || {
  echo "[+] No upstream branch $BRANCH; will push new branch."
}

# Build Flutter app (debug APK for development flavor)
echo "[+] Building Flutter app (debug APK, development flavor)..."
flutter clean
flutter pub get
flutter build apk --flavor development --target lib/main_development.dart --debug
if [ $? -ne 0 ]; then
  echo "[!] Flutter build failed."
  exit 1
fi

# Verify APK exists
if [ ! -f "$APK_FILE" ]; then
  echo "[!] APK not found at $APK_FILE."
  exit 1
fi

# NEW: Copy APK to the root directory
echo "[+] Copying APK to root directory: $DEST_APK_FILE"
cp "$APK_FILE" "$DEST_APK_FILE" || {
  echo "[!] Failed to copy APK to root directory."
  exit 1
}


# Stage build artifacts (now staging from the new location)
echo "[+] Staging build artifacts..."
git add "$DEST_APK_FILE" || { # UPDATED: Use DEST_APK_FILE
  echo "[!] Failed to stage APK."
  exit 1
}

# Commit changes
echo "[+] Committing changes..."
git commit -m "$COMMIT_MESSAGE" || {
  echo "[+] Nothing to commit."
}

# Push to GitHub
echo "[+] Pushing to GitHub ($REPO_URL, branch: $BRANCH)..."
git push origin "$BRANCH" || {
  echo "[!] Failed to push to GitHub. Trying to set upstream..."
  git push --set-upstream origin "$BRANCH"
}
if [ $? -ne 0 ]; then
  echo "[!] Push failed. Check credentials or network."
  exit 1
fi

echo "[✓] Flutter app built and pushed to GitHub successfully!"
echo "[+] APK available at: $DEST_APK_FILE" # UPDATED: Use DEST_APK_FILE in message


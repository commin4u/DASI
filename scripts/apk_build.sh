on:
  push:
    branches: [main]  # Trigger on pushes to main branch
  pull_request:       # Trigger on pull requests
    branches: [main]

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout code
        uses: actions/checkout@v4

      - name: Set up Java
        uses: actions/setup-java@v4
        with:
          distribution: 'zulu'   # Flutter-compatible JDK
          java-version: '17'

      - name: Set up Flutter
        uses: subosito/flutter-action@v2
        with:
          channel: 'stable'     # Flutter SDK channel

      - name: Install dependencies
        run: flutter pub get

      - name: Build Debug APK
        run: flutter build apk --debug

      - name: Upload APK artifact
        uses: actions/upload-artifact@v4
        with:
          name: debug-apk
          path: build/app/outputs/apk/debug/app-debug.apk
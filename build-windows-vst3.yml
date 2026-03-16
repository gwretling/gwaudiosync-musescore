name: build-windows-vst3
on:
  workflow_dispatch:
  push:
    branches: [ main, master ]

jobs:
  build:
    runs-on: windows-latest
    steps:
      - uses: actions/checkout@v4
      - name: Configure
        run: cmake -S . -B build -G "Visual Studio 17 2022" -A x64
      - name: Build
        run: cmake --build build --config Release
      - name: Archive VST3 bundle
        uses: actions/upload-artifact@v4
        with:
          name: GWAudioSyncWin-vst3
          path: build/GWAudioSyncWin.vst3

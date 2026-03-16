# GWAudioSyncWin (Windows-VST3)

Detta är en Windows-inriktad VST3-källkodsbundle för MuseScore 4.

## Bygg lokalt på Windows

1. Installera Visual Studio 2022 med Desktop development with C++.
2. Öppna en Developer Command Prompt.
3. Kör:

```bat
build_windows.bat
```

Den färdiga bundlen hamnar i:

```text
build\GWAudioSyncWin.vst3
```

Kopiera sedan `GWAudioSyncWin.vst3` till:

```text
C:\Program Files\Common Files\VST3
```

eller till användarens VST3-mapp.

## Ljudfil

Lägg en WAV-fil som `audio.wav` i:

```text
GWAudioSyncWin.vst3\Contents\Resources\
```

eller skriv en absolut sökväg i `audio_path.txt` i samma mapp.

## GitHub Actions-omväg

Om du inte vill bygga lokalt:

1. Lägg hela mappen i ett GitHub-repo.
2. Öppna fliken **Actions**.
3. Kör workflow: **build-windows-vst3**.
4. Ladda ner artifacten `GWAudioSyncWin-vst3`.

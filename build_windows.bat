cmake_minimum_required(VERSION 3.20)
project(GWAudioSyncWin C)
set(CMAKE_C_STANDARD 11)

if(NOT WIN32)
  message(FATAL_ERROR "This project is intended to build a Windows VST3 bundle.")
endif()

add_library(GWAudioSyncWinBin SHARED gwaudiosync_win.c)
target_include_directories(GWAudioSyncWinBin PRIVATE ${CMAKE_CURRENT_SOURCE_DIR})
target_compile_definitions(GWAudioSyncWinBin PRIVATE _CRT_SECURE_NO_WARNINGS WIN32_LEAN_AND_MEAN)
set_target_properties(GWAudioSyncWinBin PROPERTIES
  PREFIX ""
  OUTPUT_NAME "GWAudioSyncWin"
  SUFFIX ".vst3"
)

set(BUNDLE_DIR "${CMAKE_BINARY_DIR}/GWAudioSyncWin.vst3")
set(ARCH_DIR "${BUNDLE_DIR}/Contents/x86_64-win")
set(RES_DIR "${BUNDLE_DIR}/Contents/Resources")

add_custom_command(TARGET GWAudioSyncWinBin POST_BUILD
  COMMAND ${CMAKE_COMMAND} -E make_directory "${ARCH_DIR}"
  COMMAND ${CMAKE_COMMAND} -E make_directory "${RES_DIR}"
  COMMAND ${CMAKE_COMMAND} -E copy "$<TARGET_FILE:GWAudioSyncWinBin>" "${ARCH_DIR}/GWAudioSyncWin.vst3"
  COMMAND ${CMAKE_COMMAND} -E copy_if_different "${CMAKE_CURRENT_SOURCE_DIR}/moduleinfo.json" "${RES_DIR}/moduleinfo.json"
  COMMAND ${CMAKE_COMMAND} -E copy_if_different "${CMAKE_CURRENT_SOURCE_DIR}/audio_path.txt" "${RES_DIR}/audio_path.txt"
  COMMENT "Packaging GWAudioSyncWin.vst3 bundle"
)

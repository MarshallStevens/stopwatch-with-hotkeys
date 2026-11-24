# Stopwatch with Hotkeys

A lightweight, always-on-top stopwatch for Windows that you control with global hotkeys from any window.

Windows' built-in Clock app has a stopwatch, but there are no hotkeys for it. You have to click into the app every time. I built this so I can start, pause, and reset a timer without leaving whatever I'm working in (or playing).

<img width="800" height="450" alt="timer gif" src="https://github.com/user-attachments/assets/c62c688b-40d5-403f-8b05-38a6a11c83a3" />


## Features

- **Global hotkeys** that work from any app, including fullscreen games
- **Always on top** with a borderless window that stays out of the taskbar
- **Color-coded** so you can see elapsed time at a glance
- **Drag anywhere** with a left-click to reposition
- **Single file**, no install beyond AutoHotkey

## Hotkeys

| Action           | Key                    |
|------------------|------------------------|
| Start / Resume   | `0` or `Numpad 0`      |
| Pause            | `+` or `Numpad +`      |
| Reset            | `-` or `Numpad -`      |

The stopwatch window appears the first time you press Start.

## Color Thresholds

| Elapsed time | Color          |
|--------------|----------------|
| 0–30s        | 🔵 Royal Blue  |
| 31–60s       | 🟡 Gold        |
| 60s+         | 🔴 Red         |

## Requirements

- Windows 10/11
- [AutoHotkey v2.0](https://www.autohotkey.com/)

## Usage

1. Install AutoHotkey v2.
2. Download `stopwatch.ahk`.
3. Double-click it to run. A green **H** icon appears in your system tray.
4. Press `0` to start.

To exit, right-click the tray icon and choose **Exit**.

**Run on startup (optional):** press `Win + R`, type `shell:startup`, and put a shortcut to `stopwatch.ahk` in that folder.

## Customization

Settings are at the top of the script:

- **Colors:** edit `ColorBlue`, `ColorYellow`, `ColorRed` (hex values)
- **Thresholds:** change the `30` / `60` values in `UpdateColors()`
- **Hide on reset:** add `MyGui.Hide()` at the end of the Reset hotkey block

## Known Behavior

Hotkeys use AutoHotkey's `~` prefix, so the key press still goes through to the active window. That means typing `0`, `+`, or `-` anywhere (in a chat box, for example) also triggers the stopwatch. This is intentional, so the keys keep working normally in games, but keep it in mind.

## License

[MIT](LICENSE)

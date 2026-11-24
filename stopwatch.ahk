#Requires AutoHotkey v2.0
#SingleInstance Force

; --- SETTINGS ---
Global Elapsed := 0
Global IsRunning := false

; Color Constants
Global ColorBlue   := "4169E1" ; Royal Blue (0-30s)
Global ColorYellow := "FFD700" ; Gold/Yellow (30-60s)
Global ColorRed    := "FF0000" ; Red (60s+)

; Formats time as MM:SS
FormatTime(s) => Format("{1:02}:{2:02}", Floor(s / 60), Mod(s, 60))

; --- GUI SETUP ---
MyGui := Gui("+AlwaysOnTop -Caption +ToolWindow")
MyGui.BackColor := ColorBlue
MyGui.SetFont("s24 cWhite w700", "Segoe UI")
TimerText := MyGui.Add("Text", "Center w150 y15", "00:00")

; Left-click and drag anywhere to move it
OnMessage(0x0201, (*) => PostMessage(0xA1, 2,,, "A"))

; --- HOTKEYS ---

; Press 0 to Start / Resume
~0::
~Numpad0:: {
    Global IsRunning
    if (!IsRunning) {
        IsRunning := true
        MyGui.Show("NoActivate") 
        SetTimer(UpdateStopwatch, 1000)
    }
}

; Press + to Pause
~+::
~NumpadAdd:: {
    Global IsRunning := false
    SetTimer(UpdateStopwatch, 0)
}

; Press - to Reset
~-::
~NumpadSub:: {
    Global Elapsed := 0
    Global IsRunning := false
    SetTimer(UpdateStopwatch, 0)
    TimerText.Value := "00:00"
    MyGui.BackColor := ColorBlue
    ; If you want the window to stay visible after reset, leave this as is.
    ; If you want it to disappear, add MyGui.Hide() here.
}

; --- FUNCTIONS ---

UpdateStopwatch() {
    Global Elapsed
    if (IsRunning) {
        Elapsed++
        UpdateColors()
        TimerText.Value := FormatTime(Elapsed)
    }
}

UpdateColors() {
    Global Elapsed
    if (Elapsed <= 30) {
        MyGui.BackColor := ColorBlue
    } else if (Elapsed > 30 && Elapsed <= 60) {
        MyGui.BackColor := ColorYellow
    } else if (Elapsed > 60) {
        MyGui.BackColor := ColorRed
    }
}
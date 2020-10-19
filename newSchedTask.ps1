$TaskActionSplat = @{
    Execute = 'PowerShell.exe'
    Argument = '-file C:\scripts\GitCronSync.ps1 -WindowStyle Hidden'
}
$TaskAction = New-ScheduledTaskAction @TaskActionSplat

$TaskTriggerSplat = @{
    At = '1am'
    RepetitionInterval = New-TimeSpan -Minutes 60
    RepetitionDuration = New-TimeSpan -Minutes 60
}
$TaskTrigger =  New-ScheduledTaskTrigger -Once @TaskTriggerSplat

$TaskSettingsSplat = @{
    RestartCount = 3
    RestartInterval = New-TimeSpan -Minutes 5
    ExecutionTimeLimit = New-TimeSpan -Minutes 60
}
$TaskSettings = New-ScheduledTaskSettingsSet @TaskSettingsSplat

$RegisterTaskSplat = @{
    Action = $TaskAction
    Trigger = $TaskTrigger
    Settings = $TaskSettings
    TaskName = 'GitCronSync'
    Description = 'Commits files from C:\GitCronSync to GitHub repo'
    User = 'GitCronSync'
    Password = 'P@ssw0rd'
}
Register-ScheduledTask @RegisterTaskSplat
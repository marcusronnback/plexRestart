$time = Get-Date
"Time is: $time"
"Stopping Plex Media Server, because it is unresponsive"
Get-Process "Plex Media Server" -ea 0 | foreach {
    Stop-Process $_ -Force
}
$Path = "C:\Program Files (x86)\Plex\Plex Media Server\Plex Media Server.exe"
Start-Process $Path

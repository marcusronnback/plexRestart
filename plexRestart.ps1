"Monitor Started"
$time = Get-Date
"Time is: $time"
while ($true) {
    Get-Process "Plex Media Server" -ea 0 | where { $_.PM -ge 130MB } | foreach { #Check if process "Plex Media Player" memory usage is above 130MB
        $Path = "C:\Program Files (x86)\Plex\Plex Media Server\Plex Media Server.exe" # Path to compare process path with
        if ($Path) {
			$time = Get-Date
			"Stopping Plex Media Server, RAM usage above 130MB at $time"
            Stop-Process $_ -Force
            Start-Process $Path
        }
    }
    sleep -s 30 #delay in seconds between checks
}
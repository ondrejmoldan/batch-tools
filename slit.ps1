<#
#
# SLIL V. 1.0
#

╔════════════════════════════════════════════════╗
║                                                ║
║             SOMEONE LIKES IT LOUD              ║
║                                                ║
╚════════════════════════════════════════════════╝

#>

# Lets start with administrator mode
If (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))

{
    $arguments = "& '" + $myinvocation.mycommand.definition + "'"
    Start-Process powershell -Verb runAs -ArgumentList $arguments
    Break
}

# Set default output to speakers
C:\nircmd\nircmd.exe setdefaultsounddevice "Speakers" 1

# Unmute system volume
C:\nircmd\nircmd.exe mutesysvolume 0

# Set volume to the highest value (from 0 to 65535)
C:\nircmd\nircmd.exe setsysvolume 65535

# Start video playback with fullscreen and loop parameter
& 'C:\Program Files (x86)\VideoLAN\VLC\vlc.exe' 'C:\PATH\TO\VIDEO.mp4' --fullscreen --loop

# Disable user input methods for 15 seconds
$code = @"
    [DllImport("user32.dll")]
    public static extern bool BlockInput(bool fBlockIt);
"@

$userInput = Add-Type -MemberDefinition $code -Name UserInput -Namespace UserInput -PassThru

function Disable-UserInput($seconds) {
    $userInput::BlockInput($true)
    Start-Sleep $seconds
    $userInput::BlockInput($false)
}

Disable-UserInput -seconds 15 | Out-Null

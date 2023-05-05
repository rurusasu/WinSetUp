Set-Location -Path C:\

# 作業ディレクトリを保持しつつ管理者としてPowershellスクリプトを実行する
# REF: https://www.delftstack.com/ja/howto/powershell/powershell-run-as-administrator/
if (-Not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    if ([int](Get-CimInstance -Class Win32_OperatingSystem | Select-Object -ExpandProperty BuildNumber) -ge 6000) {
        Start-Process PowerShell -Verb RunAs -ArgumentList "-NoProfile -ExecutionPolicy Bypass -Command `"cd '$pwd'; & '$PSCommandPath';`"";
        Exit;
    }
}

# 「privacy & security の項目を変更する」と表示
Write-Host "Changing privacy & security settings..." -ForegroundColor Yellow

# Windows アプリがバックグラウンドで実行中にユーザーの移動にアクセスできるようにする
$regPath = "HKLM:\Software\Policies\Microsoft\Windows\AppPrivacy"
$regName = "LetAppsAccessBackgroundSpatialPerception"
$Value = 0
if (!(Test-Path -Path $regPath)) {
    New-Item -Path $regPath -Force
    New-ItemProperty -Path $regPath -Name $regName -Value $Value -Type DWord -Force
} else {
    if (!(Get-ItemProperty -Path $regPath -Name $regName -ErrorAction SilentlyContinue)) {
        New-ItemProperty -Path $regPath -Name $regName -Value $Value -Type DWord -Force
    } else {
        Set-ItemProperty -Path $regPath -Name $regName -Value $Value -Type DWord -Force
    }
}

# Windows アプリがペアリングされていないデバイスと通信できるようにする
$regPath = "HKLM:\Software\Policies\Microsoft\Windows\AppPrivacy"
$regName = "LetAppsSyncWithDevices"
$Value = 2
if (!(Test-Path -Path $regPath)) {
    New-Item -Path $regPath -Force
    New-ItemProperty -Path $regPath -Name $regName -Value $Value -Type DWord -Force
} else {
    if (!(Get-ItemProperty -Path $regPath -Name $regName -ErrorAction SilentlyContinue)) {
        New-ItemProperty -Path $regPath -Name $regName -Value $Value -Type DWord -Force
    } else {
        Set-ItemProperty -Path $regPath -Name $regName -Value $Value -Type DWord -Force
    }
}

# Windows アプリが電話をかけることを許可
$regPath = "HKLM:\Software\Policies\Microsoft\Windows\AppPrivacy"
$regName = "LetAppsAccessPhone"
$Value = 2
if (!(Test-Path -Path $regPath)) {
    New-Item -Path $regPath -Force
    New-ItemProperty -Path $regPath -Name $regName -Value $Value -Type DWord -Force
} else {
    if (!(Get-ItemProperty -Path $regPath -Name $regName -ErrorAction SilentlyContinue)) {
        New-ItemProperty -Path $regPath -Name $regName -Value $Value -Type DWord -Force
    } else {
        Set-ItemProperty -Path $regPath -Name $regName -Value $Value -Type DWord -Force
    }
}

# Windows アプリでアカウント情報にアクセスする
$regPath = "HKLM:\Software\Policies\Microsoft\Windows\AppPrivacy"
$regName = "LetAppsAccessAccountInfo"
$Value = 2
if (!(Test-Path -Path $regPath)) {
    New-Item -Path $regPath -Force
    New-ItemProperty -Path $regPath -Name $regName -Value $Value -Type DWord -Force
} else {
    if (!(Get-ItemProperty -Path $regPath -Name $regName -ErrorAction SilentlyContinue)) {
        New-ItemProperty -Path $regPath -Name $regName -Value $Value -Type DWord -Force
    } else {
        Set-ItemProperty -Path $regPath -Name $regName -Value $Value -Type DWord -Force
    }
}

# アプリでカメラにアクセスする
$regPath = "HKLM:\Software\Policies\Microsoft\Windows\AppPrivacy"
$regName = "LetAppsAccessCamera"
$Value = 2
if (!(Test-Path -Path $regPath)) {
    New-Item -Path $regPath -Force
    New-ItemProperty -Path $regPath -Name $regName -Value $Value -Type DWord -Force
} else {
    if (!(Get-ItemProperty -Path $regPath -Name $regName -ErrorAction SilentlyContinue)) {
        New-ItemProperty -Path $regPath -Name $regName -Value $Value -Type DWord -Force
    } else {
        Set-ItemProperty -Path $regPath -Name $regName -Value $Value -Type DWord -Force
    }
}

# アプリでカレンダーにアクセスする
$regPath = "HKLM:\Software\Policies\Microsoft\Windows\AppPrivacy"
$regName = "LetAppsAccessCalendar"
$Value = 2
if (!(Test-Path -Path $regPath)) {
    New-Item -Path $regPath -Force
    New-ItemProperty -Path $regPath -Name $regName -Value $Value -Type DWord -Force
} else {
    if (!(Get-ItemProperty -Path $regPath -Name $regName -ErrorAction SilentlyContinue)) {
        New-ItemProperty -Path $regPath -Name $regName -Value $Value -Type DWord -Force
    } else {
        Set-ItemProperty -Path $regPath -Name $regName -Value $Value -Type DWord -Force
    }
}

# アプリでマイクにアクセスする
$regPath = "HKLM:\Software\Policies\Microsoft\Windows\AppPrivacy"
$regName = "LetAppsAccessMicrophone"
$Value = 2
if (!(Test-Path -Path $regPath)) {
    New-Item -Path $regPath -Force
    New-ItemProperty -Path $regPath -Name $regName -Value $Value -Type DWord -Force
} else {
    if (!(Get-ItemProperty -Path $regPath -Name $regName -ErrorAction SilentlyContinue)) {
        New-ItemProperty -Path $regPath -Name $regName -Value $Value -Type DWord -Force
    } else {
        Set-ItemProperty -Path $regPath -Name $regName -Value $Value -Type DWord -Force
    }
}

# アプリで位置情報にアクセスする
$regPath = "HKLM:\Software\Policies\Microsoft\Windows\AppPrivacy"
$regName = "LetAppsAccessLocation"
$Value = 2
if (!(Test-Path -Path $regPath)) {
    New-Item -Path $regPath -Force
    New-ItemProperty -Path $regPath -Name $regName -Value $Value -Type DWord -Force
} else {
    if (!(Get-ItemProperty -Path $regPath -Name $regName -ErrorAction SilentlyContinue)) {
        New-ItemProperty -Path $regPath -Name $regName -Value $Value -Type DWord -Force
    } else {
        Set-ItemProperty -Path $regPath -Name $regName -Value $Value -Type DWord -Force
    }
}

# 音声でアクティブ化
$regPath = "HKLM:\Software\Policies\Microsoft\Windows\AppPrivacy"
$regName = "LetAppsActivateWithVoice"
$Value = 2
if (!(Test-Path -Path $regPath)) {
    New-Item -Path $regPath -Force
    New-ItemProperty -Path $regPath -Name $regName -Value $Value -Type DWord -Force
} else {
    if (!(Get-ItemProperty -Path $regPath -Name $regName -ErrorAction SilentlyContinue)) {
        New-ItemProperty -Path $regPath -Name $regName -Value $Value -Type DWord -Force
    } else {
        Set-ItemProperty -Path $regPath -Name $regName -Value $Value -Type DWord -Force
    }
}

# システムがロックされているときに音声で Windows アプリをアクティブ化できるようにする
$regPath = "HKLM:\Software\Policies\Microsoft\Windows\AppPrivacy"
$regName = "LetAppsActivateWithVoiceAboveLock"
$Value = 2
if (!(Test-Path -Path $regPath)) {
    New-Item -Path $regPath -Force
    New-ItemProperty -Path $regPath -Name $regName -Value $Value -Type DWord -Force
} else {
    if (!(Get-ItemProperty -Path $regPath -Name $regName -ErrorAction SilentlyContinue)) {
        New-ItemProperty -Path $regPath -Name $regName -Value $Value -Type DWord -Force
    } else {
        Set-ItemProperty -Path $regPath -Name $regName -Value $Value -Type DWord -Force
    }
}

# スクリーンがロックされているときに音声で Windows アプリをアクティブ化できるようにする
$regPath = "HKLM:\Software\Policies\Microsoft\Windows\AppPrivacy"
$regName = "LetAppsActivateWithVoiceAboveLockScreen"
$Value = 2
if (!(Test-Path -Path $regPath)) {
    New-Item -Path $regPath -Force
    New-ItemProperty -Path $regPath -Name $regName -Value $Value -Type DWord -Force
} else {
    if (!(Get-ItemProperty -Path $regPath -Name $regName -ErrorAction SilentlyContinue)) {
        New-ItemProperty -Path $regPath -Name $regName -Value $Value -Type DWord -Force
    } else {
        Set-ItemProperty -Path $regPath -Name $regName -Value $Value -Type DWord -Force
    }
}


pause
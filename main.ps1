function Get-SystemInfo {
    $osName = (Get-WmiObject Win32_OperatingSystem).Caption
    $hostName = $env:COMPUTERNAME
    $userName = $env:USERNAME
    $cpuInfo = (Get-WmiObject Win32_Processor).Name
    $ramInfo = (Get-WmiObject Win32_PhysicalMemory).Capacity[0].ToString().SubString(0,1)

    $gpuInfo = (Get-WmiObject Win32_VideoController).Name

    $ipAddresses = (Test-Connection -ComputerName $env:COMPUTERNAME -Count 1).IPV4Address

    $output = "__________  __________  ___  ___  ___         OS: $osName        `n" +
              "\   ____  \ \   ____  \ \  \ \  \ \  \      Host: $hostName      `n" +
              " \  \___\  \ \  \   \  \ \  \ \  \ \  \     User: $userName      `n" +
              "  \   ______\ \  \   \  \ \  \_\  \_\  \     CPU: $cpuInfo       `n" +
              "   \  \        \  \___\  \ \            \    RAM: $ramInfo GB    `n" +
              "    \__\        \_________\ \____________\   GPU: $gpuInfo       `n" +
              "                                              IP: $ipAddresses   `n" +
              "                                                                   "
    Write-Host $output
}

Get-SystemInfo
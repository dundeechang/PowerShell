<#
$version = @{378389 = ".NET Framework 4.5"; 
    378675 = ".NET Framework 4.5.1"; 
    378758 = ".NET Framework 4.5.1";
    379893 = ".NET Framework 4.5.2";
    393295 = ".NET Framework 4.6";
    393297 = ".NET Framework 4.6";
    394254 = ".NET Framework 4.6.1";
    394271 = ".NET Framework 4.6.1";
    394802 = ".NET Framework 4.6.2";
    394806 = ".NET Framework 4.6.2";
    460798 = ".NET Framework 4.7";
    461310 = ".NET Framework 4.7.1";
    461808 = ".NET Framework 4.7.2";
    528040 = ".NET Framework 4.8";
}
$localvalue=(Get-ItemProperty  "hklm:\SOFTWARE\Microsoft\NET Framework Setup\NDP\v4\FUll").release
$version.Item($localvalue)
#>

# ref: https://www.windowscentral.com/how-quickly-check-net-framework-version-windows-10
"===== Check .NET Framework versions ====="
Get-ChildItem 'HKLM:\SOFTWARE\Microsoft\NET Framework Setup\NDP' -Recurse | Get-ItemProperty -Name version -EA 0 | Where { $_.PSChildName -Match '^(?!S)\p{L}'} | Select PSChildName, version

"===== Check .NET SDK versions ====="
dotnet --list-sdks

"===== Check .NET runtime versions ====="
dotnet --list-runtimes
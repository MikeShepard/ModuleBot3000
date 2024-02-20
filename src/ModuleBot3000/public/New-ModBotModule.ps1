function New-ModBotModule {
[CmdletBinding()]
Param([string]$Name,
      [string]$Path='C:\Program Files\WindowsPowerShell\Modules',
      [string]$author=$env:USERNAME,
      [version]$version=[version]"1.0.0")

    Copy-item $script:TemplatePath\*  $path -Recurse -force
    Update-FileContent -path $path\ModuleName\1.0.0\ModuleName.psd1 -Replacements @{'<MODULENAME>'=$Name
                                                                                    '<GUID>'=[guid]::NewGuid().ToString()
                                                                                    '<VERSION>'=$version.ToString()
                                                                                    '<AUTHOR>'=$author}
    Rename-Item $path\ModuleName\1.0.0\ModuleName.psd1 $path\ModuleName\1.0.0\$Name.psd1
    Rename-Item $path\ModuleName\1.0.0\ModuleName.psm1 $path\ModuleName\1.0.0\$Name.psm1
    if($version.ToString() -ne "1.0.0"){
       Rename-Item $path\ModuleName\1.0.0 "$path\ModuleName\$($version.ToString())"
    }
    Rename-Item $path\ModuleName "$path\$Name"
    
}

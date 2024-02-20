function Update-FileContent{
    [CmdletBinding()]
    Param([string]$path,
          [hashtable]$Replacements)

    $fileContents=Get-Content $path -Raw
    foreach($key in $Replacements.Keys){
        $fileContents=$fileContents.Replace($key,$Replacements[$key])
    }
    Set-Content -path $path -Value $fileContents
}
function Hello {

  param(
    [Parameter(Mandatory=$true)]
    [String]$name
  )

  Write-Host Hello $name
}


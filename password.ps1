function PrintOK {
	[CmdletBinding()]
	param(
		[Parameter()]
		[string] $Message
	)
    Write-Host -ForegroundColor Green "password is strong"
    exit(0)
}

function PrintNotOK {
	[CmdletBinding()]
	param(
		[Parameter()]
		[string] $Message
	)
    Write-Host  -ForegroundColor Red "password is weak"
    exit(1)
}




$pass=$args[0]

if($pass -Match "[a-z][A-Z]" -and $pass -Match "[0-9]")
 {
}else {
   
   Write-Output("pass is not contains numbers and digits")
   PrintNotOK($pass)
}

if($pass -cmatch '[A-Z]')
 {
 }else {
   
   write-Output("pass is not contains capital letters")
   PrintNotOK($pass)
}

if($pass.ToString().Length -le 9 )

 {
   Write-Output("pass is to short - should be at least 10 chars ")
   PrintNotOK($pass)
}else {
   
   PrintOK($pass)
}





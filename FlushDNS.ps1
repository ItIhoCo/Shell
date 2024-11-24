$computers=Get-ADComputer -filter * -SearchBase "OU=Domain Object,DC=IHO,DC=co"
foreach ($comp in $Computers) 
{

Write-Host $comp.name

Invoke-Command -ComputerName $comp.Name -AsJob {

    ipconfig /flushdns
    #ipconfig /registerdns
    #ipconfig /renew
    #gpupdate /force    

}

}
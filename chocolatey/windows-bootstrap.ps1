$ChocoInstalled = $false
if (Get-Command choco.exe -ErrorAction SilentlyContinue) {
    Write-Output "Chocolatey is installed" 
} else{ 
    Write-Output "Need to instasll Chocolatey" 
    Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}

chocolatey feature enable -n allowGlobalConfirmation
refreshenv
$chocoPackages = @(
    #"chocolatey",
    #"chocolatey-core.extension",
    #"DotNet4.5.2",
    "git.install",
    "git-credential-manager-for-windows",
    "notepadplusplus.install",
    "vscode",
    #"vscode.install",
    "GoogleChrome"
    "drawio",
    #"gimp",
    #"keepass.install",
    "virtualbox",
    "postman",
    "microsoft-windows-terminal",
    #"onedrive",
    "rufus"
    #"amd-ryzen-chipset", # Hardware Specific
    #"nvidia-display-driver" # Hardware Specific
    #"samsung-magician" # Hardware Specific
)
$localPackages = choco list --localonly --idonly --limitoutput
$localPackages = $localPackages.split(" ")
#Write-Output "$localprograms1" 


ForEach ($wantedPackage in $chocoPackages) {
    if ($localPackages -NotContains $wantedPackage){
        Write-Output "Need to INSTALL $wantedPackage"     
        choco install $wantedPackage --yes --confirm --limitoutput
        } 
    }

ForEach ($installedPackage in $localPackages) {
    if ($chocoPackages -NotContains $installedPackage){
        Write-Output "Need to REMOVE $wantedPackage"     
        #choco uninstall $installedPackage --yes --confirm --limitoutput
        } 
    }

choco update all --yes --confirm --limitoutput



wsl --install -d Ubuntu

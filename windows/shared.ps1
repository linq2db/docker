function Push-Image
{
    param
    (
        [string]$Tag
    )

    docker push linq2db/linq2db:$Tag
}

function Push-Version
{
    param
    (
        [string]$Tag
    )

    Push-Image $Tag
}

function Build-MSSQL-Windows
{
    param
    (
        [string]$Dockefile,
        [string]$Version,
        [string]$Version2,
        [string]$GAC,
        [string]$From,
        [string]$StartScript = 'start.ps1'
    )

    $User = 'smb-user'
    $Pass = '1qaz2ws!QAZ@WS'
    $Sources = "$PWD/sources"

    $IP = (Get-NetIPAddress -PrefixOrigin Dhcp).IPAddress | Select-Object -First 1
    $Share = "\\$IP\Installs"

    Remove-LocalUser -Name "$User"
    $verySecurePassword = ConvertTo-SecureString $Pass -AsPlainText -Force
    $_ = New-LocalUser -Name $User -Password $verySecurePassword

    Remove-SmbShare -Name Installs -Force

    $_ = New-SmbShare -Name Installs -Description "SQL Server Installers" -Path $Sources -FullAccess "Everyone"

    docker build -f $Dockefile --memory 4g --tag linq2db/linq2db:win-mssql-$Version --build-arg VERSION=$Version --build-arg VERSION2=$Version2 --build-arg SHARE_USER="$User" --build-arg SHARE_PASS="$Pass" --build-arg SHARE_PATH="$Share" --build-arg START_SCRIPT=$StartScript --build-arg GAC="$GAC" --build-arg FROM="$From" .\context

    Remove-SmbShare -Name Installs -Force

    Remove-LocalUser -Name $User
}
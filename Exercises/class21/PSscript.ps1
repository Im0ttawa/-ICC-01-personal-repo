# Import the Active Directory module
Import-Module ActiveDirectory

# Path to the CSV file containing user information
$users = Import-Csv -Path "Path\To\Your\File.csv"

# Loop through each user in the CSV
$users | ForEach-Object {
    # Assign user attributes from the CSV
    $FirstName = $_.FirstName
    $LastName = $_.LastName
    $UserName = $_.UserName
    $Department = $_.Department
    $Password = ConvertTo-SecureString $_.Password -AsPlainText -Force
    $OU = "OU=$Department,DC=gruta,DC=local"

    # Create the new AD user
    New-ADUser `
        -SamAccountName $UserName `
        -UserPrincipalName "$UserName@gruta.com" `
        -Name "$FirstName $LastName" `
        -GivenName $FirstName `
        -Surname $LastName `
        -DisplayName "$FirstName $LastName" `
        -Department $Department `
        -AccountPassword $Password `
        -ChangePasswordAtLogon $true `
        -Enabled $true `
        -Path $OU `
        -PassThru
}
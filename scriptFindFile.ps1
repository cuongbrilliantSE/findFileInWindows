# Specify the path to the UserData directory
$UserDataPath = "C:\Users\admin\AppData\Local\Google\Chrome\User Data"

# Get a list of all folders inside UserData
$folders = Get-ChildItem -Path $UserDataPath -Directory

# talentandstyle@gmail.com
foreach ($folder in $folders) {
    # Check if the "Preferences" file exists in the folder
    $preferencesPath = Join-Path -Path $folder.FullName -ChildPath "Preferences"

    if (Test-Path $preferencesPath -PathType Leaf) {
        # Read the content of the Preferences file
        $preferencesContent = Get-Content $preferencesPath -Raw

        # Check if the string "maingoc515@gmail.com" is present in the file
        if ($preferencesContent -match "talentandstyle@gmail.com") {
            Write-Host "Preferences file in $($folder.Name) contains the email 'talentandstyle@gmail.com'"
        } else {
            Write-Host "Preferences file in $($folder.Name) does not contain the email 'talentandstyle@gmail.com'"
        }
    } else {
        Write-Host "No Preferences file in $($folder.Name)"
    }
}

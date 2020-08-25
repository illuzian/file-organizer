$fileMapping = @{
    'Text' = "*.txt"
    'Doc' = "*.doc", "*.docx"
    'Pdf' = "*.pdf"
    'Compressed' = "*.gz", "*.zip", "*.7zip"
    'Code' = "*.sql", "*.ps1", "*.py", "*.kql"
    'Table' = "*.xls", "*.xlsx", "*.csv"
    'Key' = "*.pem", "*.key", "*.ppk"
    'Cert' = "*.cer"
    'Date' = "*.xml"
    'Picture' = "*.jpg", "*.png", "*.bmp"
    'IoC' = "*.yar", "*.yara"
    'Binary' = "*.exe", "*.bin"
    'Mail' = "*.eml", "*.msg"

}

foreach ($directory in $fileMapping.Keys) {
    if (-Not (Test-Path ".\$($directory)")) {
        New-Item -ItemType Directory -Force -Path ".\$($directory)"

        Write-Output "Created .\$($directory) as it didn't exist."


    }
    
    
    foreach ($fileType in $fileMapping[$directory]) {
        Write-Output "Moving $($fileType) into .\$($directory)."
        Move-Item -Path ".\$($fileType)" -Destination ".\$($directory)\"
    }
    
}

# if (-Not (Test-Path .\Text)) {
#     New-Item -ItemType Directory -Force -Path .\Text
# }

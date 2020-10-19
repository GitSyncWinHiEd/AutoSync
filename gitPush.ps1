Push-Location 'C:\GitSync'
$CommitMsg = "Commit files added or updated before {0}" -f (Get-Date -Format g)
git add .
git commit -m "$CommitMsg"
git push
$sum = 0
(Get-Content "input.txt" -Raw).Trim() -split ',' | ForEach-Object {
    $start, $end = $_.Trim() -split '-'
    for ($id = [long]$start; $id -le [long]$end; $id++) {
        $s = "$id"
        $h = $s.Length / 2
        if ($s.Length % 2 -eq 0 -and $s[0] -ne '0' -and $s.Substring(0, $h) -eq $s.Substring($h)) { $sum += $id }
    }
}
$sum
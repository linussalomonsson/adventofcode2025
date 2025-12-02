$sum = 0
(Get-Content "input.txt" -Raw).Trim() -split ',' | ForEach-Object {
    $start, $end = $_.Trim() -split '-'
    for ($id = [long]$start; $id -le [long]$end; $id++) {
        $s = "$id"
        if ($s[0] -ne '0') {
            for ($len = 1; $len -le $s.Length / 2; $len++) {
                if ($s.Length % $len -eq 0) {
                    $pattern = $s.Substring(0, $len)
                    $repeated = $pattern * ($s.Length / $len)
                    if ($s -eq $repeated) { $sum += $id; break }
                }
            }
        }
    }
}
$sum
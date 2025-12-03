$total = 0

foreach ($bank in Get-Content ".\input.txt") {
    $digits = $bank.ToCharArray() | ForEach-Object { [int]::Parse($_) }
    $n = $digits.Length
    $result = ""
    $start = 0
    
    for ($i = 0; $i -lt 12; $i++) {
        $end = $n - (12 - $i)
        $max = $digits[$start]
        $maxIdx = $start
        
        for ($j = $start + 1; $j -le $end; $j++) {
            if ($digits[$j] -gt $max) {
                $max = $digits[$j]
                $maxIdx = $j
            }
        }
        
        $result += $max
        $start = $maxIdx + 1
    }
    
    $total += [long]$result
}

Write-Host "Total output joltage: $total"

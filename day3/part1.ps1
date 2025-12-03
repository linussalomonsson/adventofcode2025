$banks = Get-Content "input.txt"
$totalJoltage = 0

foreach ($bank in $banks) {
    $digits = $bank.ToCharArray() | ForEach-Object { [int]::Parse($_) }
    
    $maxJoltage = 0
    
    for ($i = 0; $i -lt $digits.Length - 1; $i++) {
        for ($j = $i + 1; $j -lt $digits.Length; $j++) {
            $value = $digits[$i] * 10 + $digits[$j]
            if ($value -gt $maxJoltage) {
                $maxJoltage = $value
            }
        }
    }
    
    $totalJoltage += $maxJoltage
}

Write-Host "Total output joltage: $totalJoltage"
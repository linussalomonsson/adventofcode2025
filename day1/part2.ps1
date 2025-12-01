$rotations = Get-Content -Path ".\input.txt" 

$dialPosition = 50
$zeroCount = 0

foreach ($rotation in $rotations) {
    $direction = $rotation[0]
    $distance = [int]$rotation.Substring(1)

    if ($direction -eq 'L') {
        $completeLoops = [Math]::Floor($distance / 100)
        $zeroCount += $completeLoops
        
        $remainingDistance = $distance % 100
        if ($remainingDistance -gt $dialPosition -and $dialPosition -ne 0) {
            $zeroCount++
        }
        
        $dialPosition = ($dialPosition - $distance) % 100
        if ($dialPosition -lt 0) {
            $dialPosition += 100
        }
        
        if ($dialPosition -eq 0) {
            $zeroCount++
        }
    }
    elseif ($direction -eq 'R') {
        $completeLoops = [Math]::Floor($distance / 100)
        $zeroCount += $completeLoops
        
        $remainingDistance = $distance % 100
        $oldPosition = $dialPosition
        
        $dialPosition = ($dialPosition + $distance) % 100
        
        if ($oldPosition + $remainingDistance -gt 100) {
            $zeroCount++
        }
        
        if ($dialPosition -eq 0) {
            $zeroCount++
        }
    }
}

Write-Host "Password: $zeroCount" -ForegroundColor Yellow
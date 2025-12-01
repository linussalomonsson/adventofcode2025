$rotations = Get-Content -Path ".\input.txt" 

$dialPosition = 50
$zeroCount = 0

Write-Host "Starting dial position: $dialPosition"
Write-Host ""

foreach ($rotation in $rotations) {
    $direction = $rotation[0]
    $distance = [int]$rotation.Substring(1)

    if ($direction -eq 'L') {
        $dialPosition = ($dialPosition - $distance) % 100
        if ($dialPosition -lt 0) {
            $dialPosition += 100
        }
    }
    elseif ($direction -eq 'R') {
        $dialPosition = ($dialPosition + $distance) % 100
    }

    Write-Host "After $rotation -> Dial position: $dialPosition"

    if ($dialPosition -eq 0) {
        $zeroCount++
        Write-Host "  (Total zero hits: $zeroCount)"
    }
}

Write-Host "Password: $zeroCount" -ForegroundColor Yellow
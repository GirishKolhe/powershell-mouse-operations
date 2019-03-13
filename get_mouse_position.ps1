Add-Type -AssemblyName System.Windows.Forms

$Pos = [System.Windows.Forms.Cursor]::Position
echo $pos.X, $pos.Y
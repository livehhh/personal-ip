$listener = New-Object System.Net.HttpListener
$listener.Prefixes.Add('http://localhost:8080/')
$listener.Start()
Write-Host 'Server started on http://localhost:8080/'

while ($listener.IsListening) {
    $context = $listener.GetContext()
    $path = $context.Request.Url.AbsolutePath
    if ($path -eq '/') { $path = '/personal-ip.html' }
    $file = Join-Path 'c:\Users\WRR\Desktop\123' $path.TrimStart('/')
    if (Test-Path $file -PathType Leaf) {
        $ext = [System.IO.Path]::GetExtension($file).ToLower()
        $mime = switch ($ext) {
            '.html' { 'text/html; charset=utf-8' }
            '.css' { 'text/css' }
            '.js' { 'application/javascript' }
            '.mp4' { 'video/mp4' }
            '.jpg' { 'image/jpeg' }
            '.jpeg' { 'image/jpeg' }
            '.png' { 'image/png' }
            '.gif' { 'image/gif' }
            '.svg' { 'image/svg+xml' }
            default { 'application/octet-stream' }
        }
        $bytes = [System.IO.File]::ReadAllBytes($file)
        $context.Response.ContentType = $mime
        $context.Response.ContentLength64 = $bytes.Length
        $context.Response.OutputStream.Write($bytes, 0, $bytes.Length)
    } else {
        $context.Response.StatusCode = 404
    }
    $context.Response.Close()
}

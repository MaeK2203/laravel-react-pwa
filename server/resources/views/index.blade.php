<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <link
        rel="stylesheet"
        href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"
    />
    <link
        rel="stylesheet"
        href="https://fonts.googleapis.com/icon?family=Material+Icons"
    />
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <meta name="mobile-web-app-capable" content="yes">
    <meta name="mobile-web-app-title" content="TODO" />
    <meta name="mobile-web-app-status-bar-style" content="default">

    <link rel="apple-touch-icon" href="apple-touch-icon.png" />




    <title>sample-api</title>

    @viteReactRefresh
    @vite(['resources/scss/app.scss', 'resources/ts/index.tsx'])

</head>

<body>
<div id="root"></div>
</body>

</html>

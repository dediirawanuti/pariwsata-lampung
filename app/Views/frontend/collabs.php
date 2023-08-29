<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?= $title; ?></title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <link rel="icon" sizes="512x512" href="<?= base_url(); ?>/assets/img/favicon.ico">

    <style>
        .bg-gradient {
            background: linear-gradient(to right, #667eea, #764ba2);
        }
    </style>
</head>

<body class="bg-gradient flex items-center justify-center h-screen">
    <div class="text-center">
        <h1 class="text-4xl sm:text-5xl md:text-6xl text-white font-bold mb-8">Coming Soon</h1>
        <p class="text-white text-lg mb-12">We are currently working on something awesome. Stay tuned!</p>
        <div class="flex justify-center space-x-4">
            <a href="<?= base_url(); ?>" class="bg-white text-blue-700 font-bold py-2 px-6 rounded hover:bg-blue-600 hover:text-white transition duration-300">&laquo; Beranda</a>
        </div>
    </div>
</body>

</html>
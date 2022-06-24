<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="{{ asset('css/app.css') }}" rel="stylesheet">
    <script src="../path/to/flowbite/dist/flowbite.js"></script>
    <link rel="stylesheet" href="https://unpkg.com/flowbite@1.4.2/dist/flowbite.min.css" />
    <script src="https://unpkg.com/flowbite@1.4.2/dist/flowbite.js"></script>
</head>

<body class="h-screen overflow-hidden flex items-center justify-center" style="background: #edf2f7">
    <section class="min-h-screen flex flex-col">
        <div class="flex items-center justify-center min-h-screen bg-gray-100">
            <div class="px-8 py-6 mt-4 text-left bg-white shadow-lg">
                <h3 class="text-2xl font-bold text-center">Register</h3>
                <form action="/register" method="post">
                    @csrf
                    <div class="mt-4">
                        <div>
                            <label class="block" for="name">Nama<label>
                                    <input type="text" name="name" id="name" placeholder="nama"
                                        class="w-full px-4 py-2 mt-2 border rounded-md focus:outline-none focus:ring-1 focus:ring-blue-600">
                                    @error('name')
                                        <div class="bg-blue-100 border-t border-b border-blue-100 text-blue-700 px-4 py-3"
                                            role="alert">
                                            <p class="font-bold">Not valid</p>
                                        </div>
                                    @enderror
                        </div>
                        <div class="mt-4">
                            <label class="block" for="email">Email<label>
                                    <input type="email" name="email" id="email" placeholder="email"
                                        class="w-full px-4 py-2 mt-2 border rounded-md focus:outline-none focus:ring-1 focus:ring-blue-600">
                                    @error('email')
                                        <div class="bg-blue-100 border-t border-b border-blue-500 text-blue-700 px-4 py-3"
                                            role="alert">
                                            <p class="font-bold">Not valid</p>
                                        </div>
                                    @enderror
                        </div>
                        <div class="mt-4">
                            <label class="block" for="password">Password<label>
                                    <input type="password" name="password" id="password" placeholder="password"
                                        class="w-full px-4 py-2 mt-2 border rounded-md focus:outline-none focus:ring-1 focus:ring-blue-600">
                                    @error('password')
                                        <div class="bg-blue-100 border-t border-b border-blue-500 text-blue-700 px-4 py-3"
                                            role="alert">
                                            <p class="font-bold">Not valid</p>
                                        </div>
                                    @enderror
                        </div>
                        <div class="flex items-baseline justify-between">
                            <button
                                class="px-6 py-2 mt-4 text-white bg-blue-600 rounded-lg hover:bg-blue-900">Register</button>
                            <a href="/login" class="text-sm text-blue-600 hover:underline">Back to Login</a>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </section>
</body>

</html>

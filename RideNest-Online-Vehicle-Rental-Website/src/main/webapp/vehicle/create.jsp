<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add New Vehicle</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 text-gray-800">
<div class="max-w-3xl mx-auto mt-10 bg-white p-8 rounded shadow">
    <h2 class="text-2xl font-bold mb-6">Add New Vehicle</h2>
    <form action="manage-vehicles" method="post" enctype="multipart/form-data" class="space-y-4">
        <input type="hidden" name="action" value="create" />
        <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
            <div>
                <label class="block font-semibold mb-1">Vehicle Name</label>
                <input type="text" name="vehicle_name" required class="w-full border px-3 py-2 rounded" />
            </div>
            <div>
                <label class="block font-semibold mb-1">Brand</label>
                <input type="text" name="brand" required class="w-full border px-3 py-2 rounded" />
            </div>
            <div>
                <label class="block font-semibold mb-1">Model</label>
                <input type="text" name="model" required class="w-full border px-3 py-2 rounded" />
            </div>
            <div>
                <label class="block font-semibold mb-1">Type</label>
                <input type="text" name="vehicle_type" required class="w-full border px-3 py-2 rounded" />
            </div>
            <div>
                <label class="block font-semibold mb-1">Cost Per KM</label>
                <input type="number" name="cost_per_km" step="0.01" required class="w-full border px-3 py-2 rounded" />
            </div>
            <div>
                <label class="block font-semibold mb-1">Availability</label>
                <select name="availability_status" required class="w-full border px-3 py-2 rounded">
                    <option value="Available">Available</option>
                    <option value="Maintenance">Maintenance</option>
                    <option value="Booked">Booked</option>
                </select>
            </div>
            <div class="md:col-span-2">
                <label class="block font-semibold mb-1">Image</label>
                <input type="file" name="vehicle_image" accept="image/*" class="w-full" />
            </div>
            <div class="md:col-span-2">
                <label class="block font-semibold mb-1">Description</label>
                <textarea name="description" rows="4" class="w-full border px-3 py-2 rounded"></textarea>
            </div>
        </div>
        <div class="flex justify-end mt-6">
            <button type="submit"
                    class="bg-blue-600 text-white px-6 py-2 rounded hover:bg-blue-700 transition">
                Save Vehicle
            </button>
        </div>
    </form>
</div>
</body>
</html>
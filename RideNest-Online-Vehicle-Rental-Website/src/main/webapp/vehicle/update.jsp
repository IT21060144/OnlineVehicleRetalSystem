<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Vehicle</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 text-gray-800">
<div class="max-w-3xl mx-auto mt-10 bg-white p-8 rounded shadow">
    <h2 class="text-2xl font-bold mb-6">Edit Vehicle</h2>
    <form action="manage-vehicles" method="post" enctype="multipart/form-data" class="space-y-4">
        <input type="hidden" name="action" value="update" />
        <input type="hidden" name="vehicle_id" value="${vehicleData.vehicleId}" />
        <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
            <div>
                <label class="block font-semibold mb-1">Vehicle Name</label>
                <input type="text" name="vehicle_name" value="${vehicleData.vehicleName}" required class="w-full border px-3 py-2 rounded" />
            </div>
            <div>
                <label class="block font-semibold mb-1">Brand</label>
                <input type="text" name="brand" value="${vehicleData.brand}" required class="w-full border px-3 py-2 rounded" />
            </div>
            <div>
                <label class="block font-semibold mb-1">Model</label>
                <input type="text" name="model" value="${vehicleData.model}" required class="w-full border px-3 py-2 rounded" />
            </div>
            <div>
                <label class="block font-semibold mb-1">Type</label>
                <input type="text" name="vehicle_type" value="${vehicleData.vehicleType}" required class="w-full border px-3 py-2 rounded" />
            </div>
            <div>
                <label class="block font-semibold mb-1">Cost Per KM</label>
                <input type="number" name="cost_per_km" step="0.01" value="${vehicleData.costPerKm}" required class="w-full border px-3 py-2 rounded" />
            </div>
            <div>
                <label class="block font-semibold mb-1">Availability</label>
                <select name="availability_status" class="w-full border px-3 py-2 rounded">
                    <option value="Available" ${vehicleData.availabilityStatus == 'Available' ? 'selected' : ''}>Available</option>
                    <option value="Maintenance" ${vehicleData.availabilityStatus == 'Maintenance' ? 'selected' : ''}>Maintenance</option>
                    <option value="Booked" ${vehicleData.availabilityStatus == 'Booked' ? 'selected' : ''}>Booked</option>
                </select>
            </div>
            <div class="md:col-span-2">
                <label class="block font-semibold mb-1">Image</label>
                <input type="file" name="vehicle_image" accept="image/*" class="w-full" />
                <p class="text-sm text-gray-500 mt-1">Current image will be replaced if a new one is uploaded.</p>
            </div>
            <div class="md:col-span-2">
                <label class="block font-semibold mb-1">Description</label>
                <textarea name="description" rows="4" class="w-full border px-3 py-2 rounded">${vehicleData.description}</textarea>
            </div>
        </div>
        <div class="flex justify-end mt-6">
            <button type="submit"
                    class="bg-green-600 text-white px-6 py-2 rounded hover:bg-green-700 transition">
                Update Vehicle
            </button>
        </div>
    </form>
</div>
</body>
</html>
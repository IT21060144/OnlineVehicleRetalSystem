<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Manage Vehicles</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>
<body class="bg-gray-100 text-gray-800">

<div class="max-w-7xl mx-auto px-4 py-6">
    <div class="flex justify-between items-center mb-6">
        <h1 class="text-2xl font-semibold">Vehicles</h1>
        <a href="manage-vehicles?action=create"
           class="bg-blue-600 text-white px-4 py-2 rounded hover:bg-blue-700 transition">
            + Add New Vehicle
        </a>
    </div>

    <div class="overflow-x-auto">
        <table class="min-w-full bg-white shadow rounded">
            <thead>
            <tr class="bg-gray-200 text-gray-700 text-left text-sm uppercase">
                <th class="px-6 py-3">Image</th>
                <th class="px-6 py-3">Name</th>
                <th class="px-6 py-3">Brand</th>
                <th class="px-6 py-3">Model</th>
                <th class="px-6 py-3">Type</th>
                <th class="px-6 py-3">Cost/km</th>
                <th class="px-6 py-3">Availability</th>
                <th class="px-6 py-3">Actions</th>
            </tr>
            </thead>
            <tbody class="text-sm">
            <c:forEach var="vehicle" items="${vehicles}">
                <tr class="border-b hover:bg-gray-50">
                    <td class="px-6 py-4">
                        <img src="vehicle/images/${vehicle.vehicleId}.jpg"
                             alt="Vehicle Image" class="w-20 h-16 object-cover rounded">
                    </td>
                    <td class="px-6 py-4">${vehicle.vehicleName}</td>
                    <td class="px-6 py-4">${vehicle.brand}</td>
                    <td class="px-6 py-4">${vehicle.model}</td>
                    <td class="px-6 py-4">${vehicle.vehicleType}</td>
                    <td class="px-6 py-4">රු.${vehicle.costPerKm}</td>
                    <td class="px-6 py-4">
                        <span class="inline-block px-2 py-1 text-xs rounded
                            ${vehicle.availabilityStatus == 'Available' ? 'bg-green-200 text-green-800' : 'bg-red-200 text-red-800'}">
                            ${vehicle.availabilityStatus}
                        </span>
                    </td>
                    <td class="px-6 py-4">
                        <a href="manage-vehicles?action=edit&id=${vehicle.vehicleId}"
                           class="text-blue-600 hover:text-blue-800 mr-3">
                            <i class="fas fa-edit"></i>
                        </a>
                        <a href="manage-vehicles?action=delete&id=${vehicle.vehicleId}"
                           class="text-red-600 hover:text-red-800"
                           onclick="return confirm('Are you sure you want to delete this vehicle?');">
                            <i class="fas fa-trash-alt"></i>
                        </a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>

</body>
</html>
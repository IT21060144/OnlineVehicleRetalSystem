<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Available Vehicles</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gradient-to-r from-slate-100 to-slate-200 min-h-screen flex flex-col">

<!-- Header -->
<header class="bg-gradient-to-r from-indigo-600 to-purple-700 shadow-md text-white">
    <div class="container mx-auto px-4 py-4 flex justify-between items-center">
        <h1 class="text-2xl font-bold">RideNest</h1>
        <nav>
            <a href="http://localhost:8080/RideNest-Online-Vehicle-Rental-Website/" class="hover:underline">Home</a>
            <a href="http://localhost:8080/RideNest-Online-Vehicle-Rental-Website/vehicles" class="ml-4 hover:underline">Vehicles</a>
        </nav>
    </div>
</header>

<!-- Main content -->
<main class="flex-1 container mx-auto px-4 py-8">
    <h2 class="text-3xl font-semibold text-gray-800 mb-6">Available Vehicles</h2>

    <!-- Search and Filters -->
    <div class="flex flex-col md:flex-row md:items-center justify-between gap-4 mb-6">
        <input id="searchInput" type="text" placeholder="Search vehicles..."
               class="w-full md:w-1/2 px-4 py-2 rounded-lg border border-gray-300 focus:outline-none focus:ring-2 focus:ring-indigo-500">

        <div class="flex gap-2">
            <button class="filter-btn bg-indigo-600 text-white px-4 py-2 rounded-lg hover:bg-indigo-700"
                    onclick="filterVehicles('all')">All Vehicles</button>
            <button class="filter-btn bg-green-600 text-white px-4 py-2 rounded-lg hover:bg-green-700"
                    onclick="filterVehicles('available')">Available</button>
        </div>
    </div>

    <!-- Vehicle Cards -->
    <div id="vehicleContainer" class="grid gap-6 grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4">
        <c:forEach var="vehicle" items="${vehicles}">
            <div class="vehicle-card bg-white rounded-2xl shadow-lg overflow-hidden transform hover:scale-105 transition duration-300"
                 data-name="${vehicle.vehicleName}"
                 data-brand="${vehicle.brand}"
                 data-model="${vehicle.model}"
                 data-type="${vehicle.vehicleType}"
                 data-status="${vehicle.availabilityStatus}">
                <img src="vehicle/images/${vehicle.vehicleId}.jpg" alt="${vehicle.vehicleName}"
                     class="w-full h-48 object-cover bg-gray-200">

                <div class="p-4">
                    <h3 class="text-xl font-bold text-indigo-700">${vehicle.vehicleName}</h3>
                    <p class="text-sm text-gray-500">${vehicle.brand} - ${vehicle.model}</p>
                    <p class="text-sm text-gray-600">Type: ${vehicle.vehicleType}</p>
                    <p class="text-gray-800 font-semibold mt-2">රු. ${vehicle.costPerKm} / km</p>
                    <p class="text-sm text-gray-600 mt-2">${vehicle.description}</p>
                    <span class="mt-3 inline-block px-3 py-1 rounded-full text-xs font-medium
                        ${vehicle.availabilityStatus == 'Available' ? 'bg-green-100 text-green-800' : 'bg-red-100 text-red-800'}">
                        ${vehicle.availabilityStatus}
                    </span>
                </div>
            </div>
        </c:forEach>
    </div>
</main>

<!-- Footer -->
<footer class="bg-gradient-to-r from-purple-700 to-indigo-600 text-white mt-8">
    <div class="container mx-auto px-4 py-4 text-center text-sm">
        © 2025 RideNest. All rights reserved.
    </div>
</footer>

<!-- JavaScript for Filtering -->
<script>
    const searchInput = document.getElementById('searchInput');
    const cards = document.querySelectorAll('.vehicle-card');
    let currentFilter = 'all';

    searchInput.addEventListener('input', filterAndSearch);

    function filterVehicles(filter) {
        currentFilter = filter;
        filterAndSearch();
    }

    function filterAndSearch() {
        const query = searchInput.value.toLowerCase();

        cards.forEach(card => {
            const name = card.dataset.name.toLowerCase();
            const brand = card.dataset.brand.toLowerCase();
            const model = card.dataset.model.toLowerCase();
            const type = card.dataset.type.toLowerCase();
            const status = card.dataset.status.toLowerCase();

            const matchesQuery = name.includes(query) || brand.includes(query) || model.includes(query) || type.includes(query);
            const matchesFilter = currentFilter === 'all' || status === 'available';

            card.style.display = (matchesQuery && matchesFilter) ? 'block' : 'none';
        });
    }
</script>

</body>
</html>
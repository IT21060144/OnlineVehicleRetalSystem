package com.ridenest.servlet;

import com.ridenest.model.Vehicle;
import com.ridenest.service.VehicleService;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;

@WebServlet("/manage-vehicles")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024,     // 1MB
    maxFileSize = 1024 * 1024 * 5,       // 5MB
    maxRequestSize = 1024 * 1024 * 10    // 10MB
)
public class VehicleServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private VehicleService vehicleService;

    @Override
    public void init() throws ServletException {
        vehicleService = new VehicleService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            request.setAttribute("vehicles", vehicleService.getAllVehicles());
            request.getRequestDispatcher("vehicle/index.jsp").forward(request, response);
        } else if (action.equals("create")) {
            request.getRequestDispatcher("vehicle/create.jsp").forward(request, response);
        } else if (action.equals("edit")) {
            int id = Integer.parseInt(request.getParameter("id"));
            Vehicle vehicle = vehicleService.getVehicle(id);
            request.setAttribute("vehicleData", vehicle);
            request.getRequestDispatcher("vehicle/update.jsp").forward(request, response);
        } else if (action.equals("delete")) {
            int id = Integer.parseInt(request.getParameter("id"));
            vehicleService.deleteVehicle(id);
            response.sendRedirect("manage-vehicles");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action.equals("create")) {
            String vehicleName = request.getParameter("vehicle_name");
            String brand = request.getParameter("brand");
            String model = request.getParameter("model");
            String vehicleType = request.getParameter("vehicle_type");
            double costPerKm = Double.parseDouble(request.getParameter("cost_per_km"));
            String availabilityStatus = request.getParameter("availability_status");
            String description = request.getParameter("description");

            Vehicle vehicle = new Vehicle();
            vehicle.setVehicleName(vehicleName);
            vehicle.setBrand(brand);
            vehicle.setModel(model);
            vehicle.setVehicleType(vehicleType);
            vehicle.setCostPerKm(costPerKm);
            vehicle.setAvailabilityStatus(availabilityStatus);
            vehicle.setDescription(description);

            int vehicleId = vehicleService.createVehicleAndGetId(vehicle);
            if (vehicleId > 0) {
                // Handle image upload
                Part filePart = request.getPart("vehicle_image");
                if (filePart != null && filePart.getSize() > 0) {
                    String uploadPath = getServletContext().getRealPath("/") + "vehicle/images/";
                    File dir = new File(uploadPath);
                    if (!dir.exists()) dir.mkdirs();
                    filePart.write(uploadPath + File.separator + vehicleId + ".jpg");
                }
                response.sendRedirect("manage-vehicles");
            } else {
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            }

        } else if (action.equals("update")) {
            int vehicleId = Integer.parseInt(request.getParameter("vehicle_id"));
            String vehicleName = request.getParameter("vehicle_name");
            String brand = request.getParameter("brand");
            String model = request.getParameter("model");
            String vehicleType = request.getParameter("vehicle_type");
            double costPerKm = Double.parseDouble(request.getParameter("cost_per_km"));
            String availabilityStatus = request.getParameter("availability_status");
            String description = request.getParameter("description");

            Vehicle vehicle = new Vehicle();
            vehicle.setVehicleId(vehicleId);
            vehicle.setVehicleName(vehicleName);
            vehicle.setBrand(brand);
            vehicle.setModel(model);
            vehicle.setVehicleType(vehicleType);
            vehicle.setCostPerKm(costPerKm);
            vehicle.setAvailabilityStatus(availabilityStatus);
            vehicle.setDescription(description);

            if (vehicleService.updateVehicle(vehicle)) {
                Part filePart = request.getPart("vehicle_image");
                if (filePart != null && filePart.getSize() > 0) {
                    String uploadPath = getServletContext().getRealPath("/") + "vehicle/images/";
                    File dir = new File(uploadPath);
                    if (!dir.exists()) dir.mkdirs();
                    filePart.write(uploadPath + File.separator + vehicleId + ".jpg");
                }
                response.sendRedirect("manage-vehicles");
            } else {
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            }
        }
    }
}
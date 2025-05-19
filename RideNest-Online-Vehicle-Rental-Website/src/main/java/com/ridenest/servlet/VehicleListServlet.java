package com.ridenest.servlet;

import com.ridenest.model.Vehicle;
import com.ridenest.service.VehicleService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/vehicles")
public class VehicleListServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private final VehicleService vehicleService = new VehicleService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Vehicle> vehicles = vehicleService.getAllVehicles();
        request.setAttribute("vehicles", vehicles);

        request.getRequestDispatcher("vehicle.jsp").forward(request, response);
    }
}
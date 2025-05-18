package controller;

import util.dbConnect;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/admin")
public class AdminController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if ("addDoctor".equals(action)) {
            addDoctor(request, response);
        } else if ("addSpecialization".equals(action)) {
            addSpecialization(request, response);
        } else if ("confirmAppointment".equals(action)) {
            confirmAppointment(request, response);
        } else if ("cancelAppointment".equals(action)) {
            cancelAppointment(request, response);
        }
    }

    private void addDoctor(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        int specializationId = Integer.parseInt(request.getParameter("specialization_id"));
        double price = Double.parseDouble(request.getParameter("price"));

        try (Connection conn = new dbConnect().connect()) {
            PreparedStatement stmt = conn.prepareStatement(
                "INSERT INTO doctor (name, specialization_id, price) VALUES (?, ?, ?)"
            );
            stmt.setString(1, name);
            stmt.setInt(2, specializationId);
            stmt.setDouble(3, price);
            stmt.executeUpdate();

            response.sendRedirect("admin/dashboard.jsp");
        } catch (SQLException e) {
            throw new ServletException("Error adding doctor", e);
        }
    }

    private void addSpecialization(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");

        try (Connection conn = new dbConnect().connect()) {
            PreparedStatement stmt = conn.prepareStatement("INSERT INTO specialization (name) VALUES (?)");
            stmt.setString(1, name);
            stmt.executeUpdate();

            response.sendRedirect("admin/dashboard.jsp");
        } catch (SQLException e) {
            throw new ServletException("Error adding specialization", e);
        }
    }

    private void confirmAppointment(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int appointmentId = Integer.parseInt(request.getParameter("appointment_id"));

        try (Connection conn = new dbConnect().connect()) {
            PreparedStatement stmt = conn.prepareStatement(
                "UPDATE channel SET status = 'Confirmed' WHERE id = ?"
            );
            stmt.setInt(1, appointmentId);
            stmt.executeUpdate();

            response.sendRedirect("admin/view-appointments.jsp");
        } catch (SQLException e) {
            throw new ServletException("Error confirming appointment", e);
        }
    }

    private void cancelAppointment(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int appointmentId = Integer.parseInt(request.getParameter("appointment_id"));

        try (Connection conn = new dbConnect().connect()) {
            PreparedStatement stmt = conn.prepareStatement(
                "UPDATE channel SET status = 'Cancelled' WHERE id = ?"
            );
            stmt.setInt(1, appointmentId);
            stmt.executeUpdate();

            response.sendRedirect("admin/view-appointments.jsp");
        } catch (SQLException e) {
            throw new ServletException("Error cancelling appointment", e);
        }
    }
}

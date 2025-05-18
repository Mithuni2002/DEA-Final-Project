package controller;

import util.dbConnect;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/appointment")
public class AppointmentController extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if ("book".equals(action)) {
            bookAppointment(request, response);
        } else if ("pay".equals(action)) {
            processPayment(request, response);
        }
    }

    private void bookAppointment(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int patientId = Integer.parseInt(request.getParameter("patient_id"));
        int doctorId = Integer.parseInt(request.getParameter("doctor_id"));
        int specializationId = Integer.parseInt(request.getParameter("specialization_id"));
        String appointmentDate = request.getParameter("appointment_date");
        String appointmentTime = request.getParameter("appointment_time");

        try (Connection conn = new dbConnect().connect()) {
            PreparedStatement stmt = conn.prepareStatement(
                "INSERT INTO channel (patient_id, doctor_id, specialization_id, appointment_date, appointment_time) VALUES (?, ?, ?, ?, ?)",
                Statement.RETURN_GENERATED_KEYS
            );
            stmt.setInt(1, patientId);
            stmt.setInt(2, doctorId);
            stmt.setInt(3, specializationId);
            stmt.setString(4, appointmentDate);
            stmt.setString(5, appointmentTime);
            stmt.executeUpdate();

            int appointmentId = -1;
            ResultSet rs = stmt.getGeneratedKeys();
            if (rs.next()) {
                appointmentId = rs.getInt(1);
            }

            // Pass doctorId and appointmentId to payment.jsp
            request.setAttribute("doctorId", doctorId);
            request.setAttribute("appointmentId", appointmentId);
            request.getRequestDispatcher("patient/payment.jsp").forward(request, response);

        } catch (SQLException e) {
            throw new ServletException("Error booking appointment", e);
        }
    }

    private void processPayment(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int appointmentId = Integer.parseInt(request.getParameter("appointment_id"));
        String cardNumber = request.getParameter("card_number");
        String nameOnCard = request.getParameter("name_on_card");
        String expiry = request.getParameter("expiry");
        String cvv = request.getParameter("cvv");

        try (Connection conn = new dbConnect().connect()) {
            PreparedStatement stmt = conn.prepareStatement(
                "INSERT INTO payment (appointment_id, card_number, name_on_card, expiry_date, cvv) VALUES (?, ?, ?, ?, ?)"
            );
            stmt.setInt(1, appointmentId);
            stmt.setString(2, cardNumber);
            stmt.setString(3, nameOnCard);
            stmt.setString(4, expiry);
            stmt.setString(5, cvv);
            stmt.executeUpdate();

            request.setAttribute("appointmentId", appointmentId);
            request.getRequestDispatcher("patient/appointment-success.jsp").forward(request, response);

        } catch (SQLException e) {
            throw new ServletException("Error processing payment", e);
        }
    }
}

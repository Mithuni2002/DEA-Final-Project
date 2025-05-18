package controller;

import util.dbConnect;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/patient")
public class PatientController extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("updateProfile".equals(action)) {
            updateProfile(request, response);
        } else if ("changePassword".equals(action)) {
            changePassword(request, response);
        }
    }

    private void updateProfile(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();
        int patientId = (int) session.getAttribute("patientId");

        String firstName = request.getParameter("first_name");
        String lastName = request.getParameter("last_name");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String email = request.getParameter("email");

        try (Connection conn = new dbConnect().connect()) {
            PreparedStatement emailCheck = conn.prepareStatement("SELECT id FROM patient WHERE email = ? AND id != ?");
            emailCheck.setString(1, email);
            emailCheck.setInt(2, patientId);
            ResultSet rs = emailCheck.executeQuery();
            if (rs.next()) {
                request.setAttribute("error", "Email is already in use by another account.");
                request.getRequestDispatcher("patient/edit-profile.jsp").forward(request, response);
                return;
            }

            PreparedStatement stmt = conn.prepareStatement(
                "UPDATE patient SET first_name = ?, last_name = ?, phone = ?, address = ?, email = ? WHERE id = ?"
            );
            stmt.setString(1, firstName);
            stmt.setString(2, lastName);
            stmt.setString(3, phone);
            stmt.setString(4, address);
            stmt.setString(5, email);
            stmt.setInt(6, patientId);
            stmt.executeUpdate();

            session.setAttribute("patientName", firstName);
            session.setAttribute("lastName", lastName);
            session.setAttribute("phone", phone);
            session.setAttribute("address", address);
            session.setAttribute("email", email);

            response.sendRedirect("patient/profile.jsp");

        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    private void changePassword(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();
        int patientId = (int) session.getAttribute("patientId");

        String oldPassword = request.getParameter("old_password");
        String newPassword = request.getParameter("new_password");

        try (Connection conn = new dbConnect().connect()) {
            PreparedStatement checkStmt = conn.prepareStatement("SELECT password FROM patient WHERE id = ?");
            checkStmt.setInt(1, patientId);
            ResultSet rs = checkStmt.executeQuery();

            if (rs.next()) {
                String currentPassword = rs.getString("password");
                if (!currentPassword.equals(oldPassword)) {
                    request.setAttribute("error", "Old password is incorrect.");
                    request.getRequestDispatcher("patient/change-password.jsp").forward(request, response);
                    return;
                }
            }

            PreparedStatement updateStmt = conn.prepareStatement("UPDATE patient SET password = ? WHERE id = ?");
            updateStmt.setString(1, newPassword);
            updateStmt.setInt(2, patientId);
            updateStmt.executeUpdate();

            session.setAttribute("success", "Password updated successfully.");
            response.sendRedirect("patient/profile.jsp");

        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }
}

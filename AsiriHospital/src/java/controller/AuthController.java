package controller;

import util.dbConnect;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/auth")
public class AuthController extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("login".equals(action)) {
            loginUser(request, response);
        } else if ("signup".equals(action)) {
            signupPatient(request, response);
        }
    }

    private void loginUser(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try (Connection conn = new dbConnect().connect()) {

            // Check if it's an admin login
            PreparedStatement adminStmt = conn.prepareStatement("SELECT * FROM admin WHERE email = ? AND password = ?");
            adminStmt.setString(1, email);
            adminStmt.setString(2, password);
            ResultSet adminRs = adminStmt.executeQuery();

            if (adminRs.next()) {
                HttpSession session = request.getSession();
                session.setAttribute("adminId", adminRs.getInt("id"));
                session.setAttribute("adminEmail", adminRs.getString("email"));
                response.sendRedirect("admin/dashboard.jsp");
                return;
            }

            // Check if it's a patient login
            PreparedStatement patientStmt = conn.prepareStatement("SELECT * FROM patient WHERE email = ? AND password = ?");
            patientStmt.setString(1, email);
            patientStmt.setString(2, password);
            ResultSet patientRs = patientStmt.executeQuery();

            if (patientRs.next()) {
                HttpSession session = request.getSession();
                session.setAttribute("patientId", patientRs.getInt("id"));
                session.setAttribute("patientName", patientRs.getString("first_name"));
                session.setAttribute("lastName", patientRs.getString("last_name"));
                session.setAttribute("dob", patientRs.getString("dob"));
                session.setAttribute("address", patientRs.getString("address"));
                session.setAttribute("phone", patientRs.getString("phone"));
                session.setAttribute("email", patientRs.getString("email"));
                session.setAttribute("nic", patientRs.getString("nic"));

                response.sendRedirect("patient/index.jsp");
            } else {
                request.setAttribute("error", "Invalid email or password");
                request.getRequestDispatcher("auth/login.jsp").forward(request, response);
            }

        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    private void signupPatient(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String fname = request.getParameter("first_name");
        String lname = request.getParameter("last_name");
        String dob = request.getParameter("dob");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String nic = request.getParameter("nic");

        try (Connection conn = new dbConnect().connect()) {
            PreparedStatement stmt = conn.prepareStatement(
                    "INSERT INTO patient (first_name, last_name, dob, address, phone, email, password, nic) VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
            stmt.setString(1, fname);
            stmt.setString(2, lname);
            stmt.setString(3, dob);
            stmt.setString(4, address);
            stmt.setString(5, phone);
            stmt.setString(6, email);
            stmt.setString(7, password);
            stmt.setString(8, nic);
            stmt.executeUpdate();

            // Get inserted patient back
            PreparedStatement fetch = conn.prepareStatement("SELECT * FROM patient WHERE email = ?");
            fetch.setString(1, email);
            ResultSet rs = fetch.executeQuery();

            if (rs.next()) {
                HttpSession session = request.getSession();
                session.setAttribute("patientId", rs.getInt("id"));
                session.setAttribute("patientName", rs.getString("first_name"));
                session.setAttribute("lastName", rs.getString("last_name"));
                session.setAttribute("dob", rs.getString("dob"));
                session.setAttribute("address", rs.getString("address"));
                session.setAttribute("phone", rs.getString("phone"));
                session.setAttribute("email", rs.getString("email"));
                session.setAttribute("nic", rs.getString("nic"));

                response.sendRedirect("patient/index.jsp");
            } else {
                request.setAttribute("error", "Signup failed. Please try again.");
                request.getRequestDispatcher("auth/signup.jsp").forward(request, response);
            }

        } catch (SQLException e) {
            request.setAttribute("error", "Email already exists or internal error.");
            request.getRequestDispatcher("auth/signup.jsp").forward(request, response);
        }
    }
}

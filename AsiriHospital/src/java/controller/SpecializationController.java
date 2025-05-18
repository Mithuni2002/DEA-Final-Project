package controller;

import util.dbConnect;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;

@WebServlet("/specializations")
public class SpecializationController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int doctorId = Integer.parseInt(request.getParameter("doctorId"));
        response.setContentType("text/html");

        try (Connection conn = new dbConnect().connect()) {
            PreparedStatement stmt = conn.prepareStatement(
                "SELECT s.id, s.name FROM specialization s JOIN doctor d ON s.id = d.specialization_id WHERE d.id = ?"
            );
            stmt.setInt(1, doctorId);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                response.getWriter().println(
                    "<option value=\"" + rs.getInt("id") + "\">" + rs.getString("name") + "</option>"
                );
            }
        } catch (SQLException e) {
            response.getWriter().println("<option disabled>Error loading specializations</option>");
        }
    }
}

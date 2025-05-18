package controller;

import util.dbConnect;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import java.util.*;

@WebServlet("/doctor-search")
public class DoctorSearchServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("application/json");
        String term = request.getParameter("term");

        List<String> results = new ArrayList<>();

        try (Connection conn = new dbConnect().connect()) {
            PreparedStatement stmt = conn.prepareStatement("SELECT id, name FROM doctor WHERE name LIKE ?");
            stmt.setString(1, "%" + term + "%");
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                results.add("{\"label\":\"" + name + "\", \"value\":\"" + id + "\"}");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        PrintWriter out = response.getWriter();
        out.print("[" + String.join(",", results) + "]");
        out.flush();
    }
}

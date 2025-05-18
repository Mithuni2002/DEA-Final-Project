<%@ page import="java.sql.*, util.dbConnect" %>
<%@ include file="../includes/head.jsp" %>
<div class="container mt-5">
  <div class="d-flex justify-content-between align-items-center mb-3">
    <h3>View Appointments</h3>
    <a href="dashboard.jsp" class="btn btn-primary">Back to Dashboard</a>
  </div>

  <table class="table table-bordered">
    <thead>
      <tr>
        <th>Patient</th>
        <th>Doctor</th>
        <th>Specialization</th>
        <th>Date</th>
        <th>Time</th>
        <th>Status</th>
        <th>Price</th>
        <th>Action</th>
      </tr>
    </thead>
    <tbody>
    <%
      Connection conn = null;
      PreparedStatement stmt = null;
      ResultSet rs = null;
      try {
        conn = new dbConnect().connect();
        stmt = conn.prepareStatement(
          "SELECT c.id, p.first_name, p.last_name, d.name AS doctor_name, s.name AS specialization, " +
          "c.appointment_date, c.appointment_time, c.status, d.price " +
          "FROM channel c " +
          "JOIN patient p ON c.patient_id = p.id " +
          "JOIN doctor d ON c.doctor_id = d.id " +
          "JOIN specialization s ON c.specialization_id = s.id " +
          "ORDER BY c.id DESC"
        );
        rs = stmt.executeQuery();
        while (rs.next()) {
    %>
      <tr>
        <td><%= rs.getString("first_name") %> <%= rs.getString("last_name") %></td>
        <td><%= rs.getString("doctor_name") %></td>
        <td><%= rs.getString("specialization") %></td>
        <td><%= rs.getString("appointment_date") %></td>
        <td><%= rs.getString("appointment_time") %></td>
        <td><%= rs.getString("status") %></td>
        <td>LKR <%= rs.getDouble("price") %></td>
        <td>
          <% if ("Pending".equals(rs.getString("status"))) { %>
            <form action="<%=request.getContextPath()%>/admin" method="post" style="display:inline-block;">
              <input type="hidden" name="action" value="confirmAppointment">
              <input type="hidden" name="appointment_id" value="<%= rs.getInt("id") %>">
              <button type="submit" class="btn btn-success btn-sm">Confirm</button>
            </form>
            <form action="<%=request.getContextPath()%>/admin" method="post" style="display:inline-block;">
              <input type="hidden" name="action" value="cancelAppointment">
              <input type="hidden" name="appointment_id" value="<%= rs.getInt("id") %>">
              <button type="submit" class="btn btn-danger btn-sm">Cancel</button>
            </form>
          <% } else { %>
            <span class="text-muted">No Action</span>
          <% } %>
        </td>
      </tr>
    <%
        }
      } catch (SQLException e) {
        out.println("<tr><td colspan='8' class='text-danger'>Error loading appointments</td></tr>");
      } finally {
        try { if (rs != null) rs.close(); } catch (Exception e) {}
        try { if (stmt != null) stmt.close(); } catch (Exception e) {}
        try { if (conn != null) conn.close(); } catch (Exception e) {}
      }
    %>
    </tbody>
  </table>
</div>
<%@ include file="../includes/scripts.jsp" %>

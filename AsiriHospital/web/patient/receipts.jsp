<%@ page import="java.sql.*, util.dbConnect" %>
<%@ include file="../includes/head.jsp" %>
<%@ include file="../includes/navbar.jsp" %>

<div class="container mt-4">
  <h3>Channel Receipts</h3>
  <table class="table table-bordered">
    <thead>
      <tr>
        <th>Channel No</th>
        <th>Date</th>
        <th>Time</th>
        <th>Doctor</th>
        <th>Specialization</th>
        <th>Price (LKR)</th>
      </tr>
    </thead>
    <tbody>
    <%
      // Get the logged-in patient's ID from session
      Integer patientIdObj = (Integer) session.getAttribute("patientId");
      int patientId = (patientIdObj != null) ? patientIdObj : -1;

      Connection conn = null;
      PreparedStatement stmt = null;
      ResultSet rs = null;

      try {
        conn = new dbConnect().connect();

        stmt = conn.prepareStatement(
          "SELECT c.id, c.appointment_date, c.appointment_time, d.name AS doctor_name, " +
          "s.name AS specialization, d.price, " +
          "(SELECT COUNT(*) + 1 FROM channel x " +
          " WHERE x.doctor_id = c.doctor_id AND x.appointment_date = c.appointment_date " +
          " AND x.status = 'Confirmed' AND x.id < c.id) AS channel_no " +
          "FROM channel c " +
          "JOIN doctor d ON c.doctor_id = d.id " +
          "JOIN specialization s ON c.specialization_id = s.id " +
          "WHERE c.patient_id = ? AND c.status = 'Confirmed' " +
          "ORDER BY c.appointment_date DESC, c.appointment_time ASC"
        );
        stmt.setInt(1, patientId);
        rs = stmt.executeQuery();

        boolean hasReceipts = false;
        while (rs.next()) {
          hasReceipts = true;
    %>
      <tr>
        <td><%= rs.getInt("channel_no") %></td>
        <td><%= rs.getString("appointment_date") %></td>
        <td><%= rs.getString("appointment_time") %></td>
        <td><%= rs.getString("doctor_name") %></td>
        <td><%= rs.getString("specialization") %></td>
        <td>LKR <%= rs.getDouble("price") %></td>
      </tr>
    <%
        }

        if (!hasReceipts) {
    %>
      <tr>
        <td colspan="6" class="text-center text-muted">No confirmed appointments found.</td>
      </tr>
    <%
        }
      } catch (SQLException e) {
        out.println("<tr><td colspan='6' class='text-danger'>Error loading receipts.</td></tr>");
        e.printStackTrace();
      } finally {
        try { if (rs != null) rs.close(); } catch (Exception e) {}
        try { if (stmt != null) stmt.close(); } catch (Exception e) {}
        try { if (conn != null) conn.close(); } catch (Exception e) {}
      }
    %>
    </tbody>
  </table>
</div>

<%@ include file="../includes/footer.jsp" %>
<%@ include file="../includes/scripts.jsp" %>

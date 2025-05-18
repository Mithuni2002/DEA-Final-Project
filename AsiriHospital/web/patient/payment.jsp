<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*, util.dbConnect" %>
<!DOCTYPE html>
<html>
<head>
    <title>Asiri Hospital</title>
    <link rel="stylesheet" href="../assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="../assets/css/style.css">
</head>
<body>

<%@ include file="../includes/navbar.jsp" %>

<%
    String doctorIdStr = String.valueOf(request.getAttribute("doctorId"));
    String appointmentIdStr = String.valueOf(request.getAttribute("appointmentId"));
    double price = 0.0;

    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    try {
        if (doctorIdStr != null && !doctorIdStr.equals("null")) {
            int doctorId = Integer.parseInt(doctorIdStr);
            conn = new dbConnect().connect();
            stmt = conn.prepareStatement("SELECT price FROM doctor WHERE id = ?");
            stmt.setInt(1, doctorId);
            rs = stmt.executeQuery();
            if (rs.next()) {
                price = rs.getDouble("price");
            }
        }
    } catch (SQLException e) {
        out.println("<div class='alert alert-danger'>Error loading price</div>");
    } finally {
        try { if (rs != null) rs.close(); } catch (Exception e) {}
        try { if (stmt != null) stmt.close(); } catch (Exception e) {}
        try { if (conn != null) conn.close(); } catch (Exception e) {}
    }
%>

<div class="container mt-5">
  <h3>Payment</h3>

  <p><strong>Total Amount:</strong> LKR <%= price %></p>

  <!-- ✅ Fixed action path -->
  <form action="<%=request.getContextPath()%>/appointment" method="post">
    <input type="hidden" name="action" value="pay">
    <input type="hidden" name="doctor_id" value="<%= doctorIdStr %>">
    <input type="hidden" name="appointment_id" value="<%= appointmentIdStr %>">
    <input type="hidden" name="price" value="<%= price %>">

    <div class="mb-3">
      <label>Card Number</label>
      <input type="text" name="card_number" class="form-control" required>
    </div>
    <div class="mb-3">
      <label>Name on Card</label>
      <input type="text" name="name_on_card" class="form-control" required>
    </div>
    <div class="row">
      <div class="col-md-6 mb-3">
        <label>Expiry Date</label>
        <input type="text" name="expiry" placeholder="MM/YY" class="form-control" required>
      </div>
      <div class="col-md-6 mb-3">
        <label>CVV</label>
        <input type="password" name="cvv" class="form-control" required>
      </div>
    </div>

    <div class="form-check mb-3">
      <input class="form-check-input" type="checkbox" required>
      <label class="form-check-label">I agree to the payment terms and conditions</label>
    </div>

    <button type="submit" class="btn btn-success">Pay Now</button>
  </form>
</div>

<%@ include file="../includes/footer.jsp" %>
<%@ include file="../includes/scripts.jsp" %>

</body>
</html>

<%@ page import="java.sql.*, util.dbConnect" %>
<%@ include file="../includes/admin-head.jsp" %>

<style>
    body {
        background-color: #f4f6f9;
        font-family: 'Segoe UI', sans-serif;
        padding: 40px 20px;
    }

    .form-container {
        max-width: 600px;
        margin: auto;
        background-color: #fff;
        padding: 35px 30px;
        border-radius: 12px;
        box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
    }

    .form-container h3 {
        margin-bottom: 30px;
        font-weight: 600;
        color: #198754;
        text-align: center;
    }

    label {
        font-weight: 500;
        margin-bottom: 8px;
        display: block;
    }

    .form-control {
        border-radius: 8px;
        padding: 10px;
        margin-bottom: 25px;
    }

    .btn-primary {
        background-color: #198754;
        border: none;
        width: 100%;
        padding: 12px;
        font-weight: 500;
        border-radius: 8px;
        margin-top: 10px;
    }

    .btn-primary:hover {
        background-color: #146c43;
    }
</style>

<div class="form-container">
    <h3>Add Doctor</h3>
    <form action="../admin" method="post">
        <input type="hidden" name="action" value="addDoctor">

        <div>
            <label for="name">Doctor Name</label>
            <input type="text" id="name" name="name" class="form-control" placeholder="Enter full name" required>
        </div>

        <div>
            <label for="specialization">Specialization</label>
            <select id="specialization" name="specialization_id" class="form-control" required>
                <%
                  Connection conn = null;
                  PreparedStatement stmt = null;
                  ResultSet rs = null;
                  try {
                      conn = new dbConnect().connect();
                      stmt = conn.prepareStatement("SELECT id, name FROM specialization");
                      rs = stmt.executeQuery();
                      while (rs.next()) {
                %>
                    <option value="<%= rs.getInt("id") %>"><%= rs.getString("name") %></option>
                <%
                      }
                  } catch (SQLException e) {
                      out.println("<option disabled>Error loading specializations</option>");
                      e.printStackTrace();
                  } finally {
                      try { if (rs != null) rs.close(); } catch (Exception e) {}
                      try { if (stmt != null) stmt.close(); } catch (Exception e) {}
                      try { if (conn != null) conn.close(); } catch (Exception e) {}
                  }
                %>
            </select>
        </div>

        <div>
            <label for="price">Doctor Fee (LKR)</label>
            <input type="number" step="0.01" id="price" name="price" class="form-control" placeholder="Enter consultation fee" required>
        </div>

        <button type="submit" class="btn btn-primary">Add Doctor</button>
    </form>
</div>

<%@ include file="../includes/scripts.jsp" %>

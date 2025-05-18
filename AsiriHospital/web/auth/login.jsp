<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="false" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Asiri Hospital</title>
  <!-- Fonts -->
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;700&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Zilla+Slab:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap" rel="stylesheet">
<style>
    * {
      box-sizing: border-box;
      margin: 0;
      padding: 0;
      font-family: 'Poppins', sans-serif;
    }

    body {
      background: url('../img/Untitled design (1).PNG') no-repeat center center fixed;
      background-size: cover;
      min-height: 100vh;
      overflow-y: auto;
      display: flex;
      justify-content: center;
      align-items: center;
      padding: 40px 20px;
      position: relative;
    }

    body::before {
      content: '';
      position: absolute;
      top: 0; left: 0;
      width: 100%;
      height: 100%;
      background: rgba(0, 0, 0, 0.45);
      z-index: 0;
    }

    .form-container {
      position: relative;
      z-index: 1;
      width: 100%;
      max-width: 400px;
      padding: 35px 30px;
      background: white;
      border-radius: 10px;
      box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
    }

    h2 {
      font-size: 36px;
      font-family: 'Zilla Slab', serif;
      color: #009e61;
      text-align: center;
      margin-bottom: 25px;
    }

    .login-input {
      width: 100%;
      padding: 10px;
      border: 1px solid #cbd5e1;
      border-radius: 5px;
      font-size: 15px;
      margin-bottom: 15px;
    }

    .login-input:focus {
      border-color: #0d6efd;
      outline: none;
    }

    .btn-login {
      background: #28a745;
      color: white;
      padding: 12px;
      border: none;
      border-radius: 6px;
      font-size: 16px;
      width: 100%;
      font-weight: bold;
      margin-top: 5px;
      transition: background 0.3s ease;
    }

    .btn-login:hover {
      background: #218838;
    }

    .form-footer {
      margin-top: 15px;
      text-align: center;
    }

    .form-footer a {
      color: #007bff;
      text-decoration: none;
    }

    .text-danger {
      color: red;
      font-size: 0.9em;
      text-align: center;
      margin-top: 10px;
    }
  </style>
</head>

<body>
  <div class="form-container">
    <h2>Patient Login</h2>
    <form action="../auth" method="post">
      <input type="hidden" name="action" value="login">

      <label for="email">Email</label>
      <input type="email" name="email" id="email" class="login-input" required>

      <label for="password">Password</label>
      <input type="password" name="password" id="password" class="login-input" required>

      <button type="submit" class="btn-login">Login</button>

      <div class="form-footer">
        <p>Don't have an account? <a href="signup.jsp">Sign Up</a></p>
      </div>

      <p class="text-danger">${error}</p>
    </form>
  </div>

  <%@ include file="../includes/scripts.jsp" %>
</body>
</html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Sign Up - Asiri Hospital</title>
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
  padding: 40px 15px;
  display: flex;
  justify-content: center;
  align-items: flex-start;
  position: relative;
}

/* Dark overlay */
body::before {
  content: '';
  position: absolute;
  top: 0; left: 0;
  width: 100%;
  height: 100%;
  background: rgba(0, 0, 0, 0.45);
  z-index: 0;
}

/* Form wrapper */
.form-container {
  position: relative;
  z-index: 1;
  width: 100%;
  max-width: 550px;
  background: #fff;
  padding: 40px 30px;
  border-radius: 15px;
  box-shadow: 0 12px 30px rgba(0, 0, 0, 0.25);
}

h3.signup-title {
  font-size: 36px;
  font-family: 'Zilla Slab', serif;
  color: #009e61;
  text-align: center;
  margin-bottom: 30px;
}

/* Inputs */
.signup-input,
.signup-textarea {
  width: 100%;
  padding: 10px 12px;
  border: 1px solid #cbd5e1;
  border-radius: 6px;
  margin-bottom: 15px;
  font-size: 15px;
  transition: border-color 0.3s ease;
}

.signup-input:focus,
.signup-textarea:focus {
  border-color: #0d6efd;
  outline: none;
}

/* Checkbox */
input[type="checkbox"] {
  margin-right: 8px;
}

/* Button */
.signup-button {
  background: #28a745;
  color: #fff;
  padding: 12px;
  width: 100%;
  border: none;
  font-weight: bold;
  font-size: 16px;
  border-radius: 6px;
  margin-top: 10px;
  transition: background 0.3s ease;
}

.signup-button:hover {
  background: #218838;
}

/* Error text */
.signup-error {
  color: red;
  font-size: 0.9rem;
  margin-top: 10px;
  text-align: center;
}

/* Responsive layout for two columns on larger screens */
@media (min-width: 768px) {
  .row {
    display: flex;
    flex-wrap: wrap;
    gap: 16px;
  }

  .col-md-6 {
    flex: 0 0 48%;
  }

  .col-12 {
    flex: 0 0 100%;
  }
}


  </style>
</head>


<body>
<div class="form-container signup-form">
  <h3 class="signup-title">Sign Up</h3>

  <form action="../auth" id="signupForm" onsubmit="return validateForm()" method="post">
    <input type="hidden" name="action" value="signup">

    <div class="row">
      <div class="col-md-6 mb-3 form-group">
        <label for="fname">First Name</label>
        <input type="text" name="first_name" id="fname" class="form-control signup-input" required>
      </div>

      <div class="col-md-6 mb-3 form-group">
        <label for="lname">Last Name</label>
        <input type="text" name="last_name" id="lname" class="form-control signup-input" required>
      </div>

      <div class="col-md-6 mb-3 form-group">
        <label for="dob">Date of Birth</label>
        <input type="date" name="dob" id="dob" class="form-control signup-input" required>
      </div>

      <div class="col-md-6 mb-3 form-group">
        <label for="nic">NIC</label>
        <input type="text" name="nic" id="nic" class="form-control signup-input">
      </div>

      <div class="col-12 mb-3 form-group">
        <label for="address">Address</label>
        <textarea name="address" id="address" class="form-control signup-textarea" required></textarea>
      </div>

      <div class="col-md-6 mb-3 form-group">
        <label for="phone">Phone</label>
        <input type="text" name="phone" id="phone" class="form-control signup-input" required>
      </div>

      <div class="col-md-6 mb-3 form-group">
        <label for="email">Email</label>
        <input type="email" name="email" id="email" class="form-control signup-input" required>
      </div>

      <div class="col-md-6 mb-3 form-group">
        <label for="password">Password</label>
        <input type="password" name="password" id="password" class="form-control signup-input" required>
      </div>

      <div class="col-12 form-group">
        <input type="checkbox" id="agree" required>
        <label for="agree" class="form-check-label">I agree to the terms and conditions</label>
      </div>
    </div>

    <button type="submit" class="btn btn-success mt-3 signup-button">Sign Up</button>
    <p class="text-danger signup-error">${error}</p>
  </form>
</div>

<%@ include file="../includes/scripts.jsp" %>


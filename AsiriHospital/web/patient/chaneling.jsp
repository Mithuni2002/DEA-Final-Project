<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*, util.dbConnect" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Asiri Hospital - Channel a Doctor</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery UI CSS -->
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
    <style>
        html, body {
            height: 100%;
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background-color: #f8f9fa;
            display: flex;
            flex-direction: column;
        }

        .main-content {
            flex: 1 0 auto;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 30px 15px;
        }

        .channel-form-card {
            background-color: #fff;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 6px 20px rgba(0,0,0,0.1);
            width: 100%;
            max-width: 600px;
        }

        .channel-form-card h3 {
            text-align: center;
            font-weight: 700;
            margin-bottom: 30px;
            color: #343a40;
        }

        label {
            font-weight: 500;
        }

        .form-check-label {
            font-weight: 400;
        }

        footer {
            flex-shrink: 0;
            background-color: #343a40;
            color: #ffffff;
            text-align: center;
            padding: 15px 0;
            margin-top: auto;
        }

        @media (max-width: 576px) {
            .channel-form-card {
                padding: 30px 20px;
            }
        }
    </style>
</head>
<body>

<%@ include file="../includes/navbar.jsp" %>

<div class="main-content">
    <div class="channel-form-card">
        <h3>Channel a Doctor</h3>
        <form action="../appointment" method="post">
            <input type="hidden" name="action" value="book">
            <input type="hidden" name="patient_id" value="${sessionScope.patientId}">

            <!-- Doctor Selection (Autocomplete) -->
            <div class="mb-3">
                <label for="doctorName" class="form-label">Select Doctor</label>
                <input type="text" id="doctorName" class="form-control" placeholder="Type doctor's name..." required>
                <input type="hidden" name="doctor_id" id="doctorId">
            </div>

            <!-- Specialization -->
            <div class="mb-3">
                <label for="specializationDropdown" class="form-label">Specialization</label>
                <select name="specialization_id" id="specializationDropdown" class="form-control" required>
                    <option value="">Select specialization</option>
                </select>
            </div>

            <!-- Appointment Date -->
            <div class="mb-3">
                <label for="appointmentDate" class="form-label">Appointment Date</label>
                <input type="date" name="appointment_date" id="appointmentDate" class="form-control" required>
            </div>

            <!-- Appointment Time -->
            <div class="mb-3">
                <label for="appointmentTime" class="form-label">Appointment Time</label>
                <select name="appointment_time" id="appointmentTime" class="form-control" required>
                    <option value="10:30 AM">10:30 AM</option>
                    <option value="1:30 PM">1:30 PM</option>
                    <option value="4:30 PM">4:30 PM</option>
                </select>
            </div>

            <!-- Agree to Terms -->
            <div class="form-check mb-3">
                <input type="checkbox" name="agree" class="form-check-input" id="agreeCheck" required>
                <label class="form-check-label" for="agreeCheck">I agree to the terms and conditions</label>
            </div>

            <button type="submit" class="btn btn-primary w-100">Channel</button>
        </form>
    </div>
</div>

<!-- Footer -->
<footer>
    <div class="container">
        <p>&copy; 2025 Asiri Hospital. All rights reserved.</p>
    </div>
</footer>

<%@ include file="../includes/scripts.jsp" %>

<!-- jQuery and jQuery UI -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>

<script>
    $(function () {
        $("#doctorName").autocomplete({
            source: "../doctor-search",
            select: function (event, ui) {
                $("#doctorName").val(ui.item.label);
                $("#doctorId").val(ui.item.value);

                // Load related specializations
                $.get("../specializations?doctorId=" + ui.item.value, function (data) {
                    $("#specializationDropdown").html(data);
                });

                return false;
            }
        });
    });
</script>

</body>
</html>

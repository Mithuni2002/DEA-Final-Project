<%@ include file="../includes/admin-head.jsp" %>

<style>
    body {
        background-color: #f4f6f9;
        font-family: 'Segoe UI', sans-serif;
        padding: 40px 20px;
    }

    .form-container {
        max-width: 500px;
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

    .btn-success {
        background-color: #198754;
        border: none;
        width: 100%;
        padding: 12px;
        font-weight: 500;
        border-radius: 8px;
        margin-top: 10px;
    }

    .btn-success:hover {
        background-color: #146c43;
    }
</style>

<div class="form-container">
    <h3>Add Specialization</h3>
    <form action="../admin" method="post">
        <input type="hidden" name="action" value="addSpecialization">

        <div>
            <label for="name">Specialization Name</label>
            <input type="text" id="name" name="name" class="form-control" placeholder="Enter specialization name" required>
        </div>

        <button type="submit" class="btn btn-success">Add Specialization</button>
    </form>
</div>

<%@ include file="../includes/scripts.jsp" %>


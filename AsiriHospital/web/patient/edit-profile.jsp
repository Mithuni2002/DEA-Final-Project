<%@ include file="../includes/head.jsp" %>
<%@ include file="../includes/navbar.jsp" %>
<div class="container mt-4">
    <h3>Edit Profile</h3>
    <form action="../patient" method="post">
        <input type="hidden" name="action" value="updateProfile">

        <div class="mb-3">
            <label>First Name</label>
            <input type="text" name="first_name" value="${sessionScope.patientName}" class="form-control" required>
        </div>

        <div class="mb-3">
            <label>Last Name</label>
            <input type="text" name="last_name" value="${sessionScope.lastName}" class="form-control" required>
        </div>

        <div class="mb-3">
            <label>Email</label>
            <input type="email" name="email" value="${sessionScope.email}" class="form-control" required>
        </div>

        <div class="mb-3">
            <label>Phone</label>
            <input type="text" name="phone" value="${sessionScope.phone}" class="form-control" required>
        </div>

        <div class="mb-3">
            <label>Address</label>
            <textarea name="address" class="form-control" required>${sessionScope.address}</textarea>
        </div>

        <button type="submit" class="btn btn-primary">Update</button>
        <p class="text-danger">${error}</p>
    </form>
</div>
<%@ include file="../includes/footer.jsp" %>
<%@ include file="../includes/scripts.jsp" %>

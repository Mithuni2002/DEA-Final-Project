<%@ include file="../includes/head.jsp" %>
<%@ include file="../includes/navbar.jsp" %>
<div class="container mt-4">
    <h3>Change Password</h3>
    <form action="../patient" method="post">
        <input type="hidden" name="action" value="changePassword">

        <div class="mb-3">
            <label>Old Password</label>
            <input type="password" name="old_password" class="form-control" required>
        </div>

        <div class="mb-3">
            <label>New Password</label>
            <input type="password" name="new_password" class="form-control" required>
        </div>

        <button type="submit" class="btn btn-warning">Change</button>

        <p class="text-danger mt-3">${error}</p>
        <p class="text-success mt-3">${success}</p>
    </form>

    <div class="mt-3">
        <a href="profile.jsp" class="btn btn-secondary">Back to Profile</a>
    </div>
</div>
<%@ include file="../includes/footer.jsp" %>
<%@ include file="../includes/scripts.jsp" %>

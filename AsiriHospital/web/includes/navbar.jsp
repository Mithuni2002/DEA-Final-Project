<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/patient/index.jsp">Asiri Hospital</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto align-items-center">
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/about.jsp">About Us</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/contact.jsp">Contact Us</a>
                </li>
                <li class="nav-item">
                    <a class="btn btn-outline-light btn-sm ms-2" href="../logout">Logout</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
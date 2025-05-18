<%@ include file="includes/head.jsp" %>
<%@ include file="includes/navbar.jsp" %>

<style>
    .contact-hero {
        background: url('../img/hos2.png') center center/cover no-repeat;
        padding: 100px 20px;
        color: white;
        text-align: center;
        position: relative;
    }

    .contact-hero::before {
        content: "";
        position: absolute;
        top: 0; left: 0;
        width: 100%; height: 100%;
        background-color: rgba(0, 0, 0, 0.6);
    }

    .contact-hero .content {
        position: relative;
        z-index: 1;
    }

    .contact-card {
        border: none;
        border-radius: 12px;
        box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        padding: 30px;
        background-color: #f8f9fa;
    }

    .contact-card h5 {
        font-weight: bold;
        color: #343a40;
    }

    .contact-card p {
        margin: 0 0 10px;
        font-size: 1.05rem;
    }

    .map-responsive {
        overflow: hidden;
        padding-bottom: 56.25%;
        position: relative;
        height: 0;
    }

    .map-responsive iframe {
        position: absolute;
        top: 0; left: 0;
        width: 100%;
        height: 100%;
        border: 0;
    }
</style>

<!-- Hero Section -->
<div class="contact-hero">
    <div class="content container">
        <h1 class="display-4 fw-bold">Get in Touch</h1>
        <p class="lead">We're here to help you 24/7. Reach out to us for any inquiries or support.</p>
    </div>
</div>

<!-- Contact Info Section -->
<div class="container my-5">
    <div class="row justify-content-center">
        <div class="col-md-6 contact-card">
            <h5><i class="bi bi-telephone-fill me-2"></i>Phone</h5>
            <p>+94 11 212 3456</p>

            <h5><i class="bi bi-envelope-fill me-2"></i>Email</h5>
            <p>info@asirihospital.lk</p>

            <h5><i class="bi bi-geo-alt-fill me-2"></i>Address</h5>
            <p>181, Kirula Rd, Colombo 5, Sri Lanka</p>
        </div>
    </div>
</div>
<%@ include file="includes/footer.jsp" %>
<%@ include file="includes/scripts.jsp" %>
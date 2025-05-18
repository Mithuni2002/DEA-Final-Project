<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Asiri Hospital</title>

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet"/>

  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>

  <!-- Animate.css -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>

  <style>
    body {
      font-family: 'Roboto', sans-serif;
    }

    /* Hero Section */
    .hero {
      background: url('img/4.jpg') no-repeat center center / cover;
      height: 100vh;
      position: relative;
      color: white;
      display: flex;
      align-items: center;
      justify-content: center;
      text-align: center;
    }

    .hero::before {
      content: "";
      position: absolute;
      inset: 0;
      background: rgba(0, 0, 0, 0.6);
      z-index: 1;
    }

    .hero-content {
      position: relative;
      z-index: 2;
      max-width: 800px;
      padding: 20px;
    }

    .hero-content h1 {
      font-size: 3.5rem;
      margin-bottom: 20px;
    }

    .hero-content p {
      font-size: 1.2rem;
      margin-bottom: 30px;
    }

    /* ======= Hospital Tour Carousel ======= */
    .carousel-wrapper {
      background-color: #f0f9f0;
      padding: 60px 0;
    }

    .carousel-container {
      overflow: hidden;
      white-space: nowrap;
      width: 100%;
    }

    .carousel-track {
      display: inline-flex;
      animation: scroll 20s linear infinite;
    }

    .carousel-track img {
      height: 400px;            /* adjust height as needed */
      width: auto;
      object-fit: cover;
      margin-right: 6px;        /* little gap between images */
      border-radius: 10px;
    }

    @keyframes scroll {
      0%   { transform: translateX(0); }
      100% { transform: translateX(-50%); }   /* move left by 50% (because we duplicate images) */
    }

    /* About Section */
    #about {
      padding: 60px 20px;
      background-color: #f8f9fa;
    }

    #about h2 {
      font-size: 2.5rem;
      margin-bottom: 20px;
    }

    #about p {
      font-size: 1.1rem;
      line-height: 1.6;
    }

    /* Doctors Section */
    .doctors-section {
      background-color: #fff;
      padding: 60px 20px;
    }

    .doctor-card {
      position: relative;
      text-align: center;
      margin: 0 15px;
      flex: 1 1 200px;
    }

    .doctor-card img {
      width: 100%;
      max-width: 200px;
      border-radius: 10px;
      transition: transform 0.3s;
      cursor: pointer;
    }

    .doctor-card img:hover {
      transform: scale(1.05);
    }

    .doctor-tooltip {
      display: none;
      position: absolute;
      top: 100%;
      left: 50%;
      transform: translateX(-50%);
      width: 220px;
      background-color: #343a40;
      color: #fff;
      padding: 15px;
      border-radius: 10px;
      z-index: 10;
      margin-top: 10px;
      text-align: left;
      font-size: 0.9rem;
    }

    .doctor-card:hover .doctor-tooltip {
      display: block;
    }

    /* Footer */
    footer {
      background-color: #343a40;
      color: #fff;
      padding: 20px 0;
      text-align: center;
    }
  </style>
</head>
<body>
<!-- Navigation Bar -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
      <a class="navbar-brand" href="#">Asiri Hospital</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNav">
          <ul class="navbar-nav ms-auto">
              <li class="nav-item"><a class="nav-link" href="auth/signup.jsp">Sign Up</a></li>
          <li class="nav-item"><a class="nav-link" href="auth/login.jsp">Login</a></li>
          <li class="nav-item"><a class="nav-link" href="#tour">Hospital Tour</a></li>
          <li class="nav-item"><a class="nav-link" href="contact.jsp">Contact</a></li>
        </ul>
      </div>
    </div>
  </nav>
  <!-- Hero Section -->
  <section class="hero">
    <div class="hero-content animate__animated animate__fadeInDown">
      <h1>Welcome to Asiri Hospital</h1>
      <p>Your health is our priority. Experience world-class medical services in a serene environment.</p>
      <a href="#about" class="btn btn-success btn-lg animate__animated animate__fadeInUp animate__delay-1s">Learn More</a>
    </div>
  </section>

  <!-- Hospital Tour (Carousel) Section -->
  <section id="tour" class="carousel-wrapper">
    <div class="container">
      <h2 class="text-center mb-5">Take a Quick Tour</h2>
    </div>
    <div class="carousel-container">
      <div class="carousel-track">
        <!-- Original images -->
        <img src="img/hos1.PNG" alt="Hospital exterior view">
        <img src="img/hos2.PNG" alt="Modern ward interior">
        <img src="img/hos3.PNG" alt="Main entrance lobby">
        <img src="img/hos4.PNG" alt="Modern ward interior">
        <img src="img/hos5.PNG" alt="Main entrance lobby">
        <!-- Duplicate images for seamless loop -->
        <img src="img/hos1.PNG" alt="Hospital exterior view (duplicate)">
        <img src="img/hos2.PNG" alt="Modern ward interior (duplicate)">
        <img src="img/hos3.PNG" alt="Main entrance lobby (duplicate)">
        <img src="img/hos4.PNG" alt="Modern ward interior (duplicate)">
        <img src="img/hos5.PNG" alt="Main entrance lobby (duplicate)">
      </div>
    </div>
  </section>

  <!-- About Section -->
  <section id="about">
    <div class="container">
      <h2 class="text-center">About Us</h2>
      <p>
        Asiri Hospital is a state-of-the-art healthcare facility located in a serene, natural setting. We offer
        world-class medical services backed by experienced professionals and advanced technologies.
        Our commitment is to provide compassionate care and ensure the well-being of our patients.
      </p>
    </div>
  </section>

  <!-- Doctors Section -->
  <section class="doctors-section text-center">
    <div class="container">
      <h2 class="mb-4">Meet Our Doctors</h2>
      <div class="d-flex flex-wrap justify-content-center">

        <!-- Doctor 1 -->
        <div class="doctor-card">
          <img src="img/1.png" alt="Doctor 1" />
          <div class="doctor-tooltip">
            <strong>Dr. James Carter</strong><br/>
            Specialist in Cardiology with 10+ years of experience. Known for compassionate care and cutting-edge techniques.
          </div>
        </div>

        <!-- Doctor 2 -->
        <div class="doctor-card">
          <img src="img/2.png" alt="Doctor 2" />
          <div class="doctor-tooltip">
            <strong>Dr. Sarah Wilson</strong><br/>
            Expert in Pediatrics, passionate about children’s health and development. Fluent in child psychology.
          </div>
        </div>

        <!-- Doctor 3 -->
        <div class="doctor-card">
          <img src="img/Untitled-1.png" alt="Doctor 3" />
          <div class="doctor-tooltip">
            <strong>Dr. Nina Perera</strong><br/>
            Leading consultant in Internal Medicine, focusing on preventive healthcare and holistic wellness.
          </div>
        </div>

      </div>
    </div>
  </section>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<%@ include file="includes/footer.jsp" %>
<%@ include file="includes/scripts.jsp" %>
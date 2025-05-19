<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>About Us - ReelGood</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap">
  <style>
    /* Base Styles */
    :root {
      --primary: #f62428;
      --primary-hover: #d91f23;
      --primary-foreground: #ffffff;
      --background: #0a1419;
      --foreground: #ffffff;
      --muted: #2a2a2a;
      --muted-foreground: #b0a8a8;
      --border: #333333;
      --header: #bd0202;
      --footer: #1a0505;
      --card-bg: #2a2a2a;
      --radius: 0.5rem;
      --shadow: 0 1px 3px 0 rgba(0, 0, 0, 0.3), 0 1px 2px 0 rgba(0, 0, 0, 0.2);
      --shadow-lg: 0 10px 15px -3px rgba(0, 0, 0, 0.3), 0 4px 6px -2px rgba(0, 0, 0, 0.2);
    }
    
    * {
      box-sizing: border-box;
      margin: 0;
      padding: 0;
    }
    
    body {
      font-family: "Inter", -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Oxygen, Ubuntu, Cantarell, "Open Sans",
        "Helvetica Neue", sans-serif;
      color: var(--foreground);
      background-color: var(--background);
      line-height: 1.5;
      min-height: 100vh;
      display: flex;
      flex-direction: column;
    }
    
    .container {
      max-width: 1200px;
      margin: 0 auto;
      padding: 2rem 1rem;
      width: 100%;
    }
    
    h1, h2, h3, h4, h5, h6 {
      font-weight: 700;
      line-height: 1.2;
      margin-bottom: 1rem;
    }
    
    a {
      color: var(--primary);
      text-decoration: none;
      transition: color 0.2s ease;
    }
    
    a:hover {
      color: var(--primary-hover);
    }
    

    
    /* Hero Section */
    .hero {
      text-align: center;
      padding: 3rem 0;
    }
    
    .hero-logo {
      max-width: 350px;
      margin: 0 auto 2rem;
    }
    
    .hero-title {
      font-size: 4rem;
      margin-bottom: 2rem;
      text-transform: uppercase;
      font-weight: 800;
    }
    
    .mission-statement {
      max-width: 800px;
      margin: 0 auto;
      background-color: rgba(42, 42, 42, 0.8);
      padding: 2rem;
      border-radius: var(--radius);
      text-align: center;
      font-size: 1.1rem;
      line-height: 1.6;
    }
    
    .mission-tagline {
      font-style: italic;
      margin: 2rem 0;
      font-size: 1.2rem;
      color: var(--primary);
    }
    
    /* Team Section */
    .team-section {
      padding: 3rem 0;
      text-align: center;
    }
    
    .team-title {
      font-size: 2.5rem;
      margin-bottom: 0.5rem;
    }
    
    .team-subtitle {
      font-size: 1.2rem;
      color: var(--muted-foreground);
      margin-bottom: 3rem;
    }
    
    .team-grid {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
      gap: 2rem;
      max-width: 1000px;
      margin: 0 auto;
    }
    
    .team-card {
      background-color: var(--card-bg);
      border-radius: var(--radius);
      padding: 2rem;
      text-align: center;
    }
    
    .team-role {
      font-size: 1.5rem;
      margin-bottom: 0.5rem;
    }
    
    .team-description {
      font-size: 0.9rem;
      color: var(--muted-foreground);
      margin-bottom: 1.5rem;
    }
    
    .team-avatar {
      width: 150px;
      height: 150px;
      border-radius: 50%;
      background-color: #5a3030;
      margin: 0 auto 1.5rem;
      display: flex;
      align-items: center;
      justify-content: center;
    }
    
    .team-avatar i {
      font-size: 3rem;
      color: #e9a5a5;
    }
    
    .team-name {
      font-size: 1.8rem;
      margin-bottom: 0.5rem;
    }
    
   
    
    /* Responsive */
    @media (max-width: 768px) {
      .hero-title {
        font-size: 3rem;
      }
      
      .team-grid {
        grid-template-columns: 1fr;
      }
      
      .navbar-content {
        flex-direction: column;
        gap: 1rem;
      }
      
      .nav-links {
        flex-wrap: wrap;
        justify-content: center;
        gap: 1rem;
      }
    }
  </style>
</head>
<body>
  <jsp:include page=" user-navbar.jsp"/>

  <!-- Hero Section -->
  <section class="hero">
    <img src="${pageContext.request.contextPath}/images/ReelGood.jpg" alt="ReelGood Logo" class="hero-logo">
    <h1 class="hero-title">WHO WE ARE</h1>
    <div class="mission-statement">
      <p>At ReelGood, we believe that the magic of cinema should begin long before the opening credits roll. Our mission is simple: to make your movie-going experience faster, easier, and more enjoyable.</p>
      <br>
      <p>Founded with a passion for both technology and entertainment, ReelGood is an online platform designed to streamline the way you discover and book movie tickets. Whether you're planning a night out with friends or a spontaneous solo trip to the cinema, we're here to make sure you never miss a show. We're more than just a booking system – we're movie lovers just like you. That's why we built a platform that not only handles the logistics but also enhances the anticipation. With a sleek interface, smart filters, and intuitive features, ReelGood is built to help you find the right movie, at the right time, at the right place.</p>
      <br>
      <p>We aim to become the go-to destination for moviegoers everywhere – a one-stop hub where the love of film meets the ease of technology. Whether it's a premiere night, a matinee, or a midnight screening, ReelGood is here to get you there. Thank you for choosing ReelGood. Let's make every movie night unforgettable.</p>
    </div>
    <div class="mission-tagline">- We are Mission: Bookable -</div>
    <h2>Team Led By:</h2>
  </section>

  <!-- Team Section -->
  <section class="team-section">
    <h2 class="team-title">Meet the Developers</h2>
    <p class="team-subtitle">AKA: The CodeFathers</p>
    
    <div class="team-grid">
      <div class="team-card">
        <h3 class="team-role">FrontEnd</h3>
        <p class="team-description">500 Days of FlexBox</p>
        <div class="team-avatar">
          <i class="fas fa-image"></i>
        </div>
        <h4 class="team-name">John Doe</h4>
      </div>
      
      <div class="team-card">
        <h3 class="team-role">Full-Stack</h3>
        <p class="team-description">The Iron Stack</p>
        <div class="team-avatar">
          <i class="fas fa-image"></i>
        </div>
        <h4 class="team-name">Jane Smith</h4>
      </div>
    </div>
  </section>

  <jsp:include page="user-footer.jsp"/>
</body>
</html>

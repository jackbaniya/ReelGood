<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Who We Are - ReelGood</title>
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
      padding: 0;
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
    
    /* Header Placeholder */
    .header-placeholder {
      height: 80px;
      background-color: var(--header);
      margin-bottom: 0;
      display: flex;
      align-items: center;
      justify-content: center;
      color: white;
      font-weight: bold;
    }
    
    /* Hero Section */
    .hero-section {
      position: relative;
      height: 600px;
      background-image: url('${pageContext.request.contextPath}/images/cinema-background.jpg');
      background-size: cover;
      background-position: center;
      display: flex;
      align-items: center;
      padding: 0 2rem;
    }
    
    .hero-overlay {
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background-color: rgba(0, 0, 0, 0.7);
      z-index: 1;
    }
    
    .hero-content {
      position: relative;
      z-index: 2;
      display: flex;
      width: 100%;
      max-width: 1200px;
      margin: 0 auto;
    }
    
    .hero-title {
      flex: 1;
      font-size: 5rem;
      font-weight: 800;
      text-transform: uppercase;
      line-height: 1;
      color: white;
    }
    
    .hero-description {
      flex: 2;
      background-color: rgba(42, 42, 42, 0.8);
      padding: 2rem;
      border-radius: var(--radius);
      font-size: 1rem;
      line-height: 1.6;
    }
    
    .hero-logo {
      display: block;
      width: 300px;
      margin: 0 auto 2rem;
    }
    
    .mission-tagline {
      text-align: center;
      font-style: italic;
      margin: 2rem 0;
      font-size: 1.2rem;
      color: var(--primary);
    }
    
    /* Locations Section */
    .locations-section {
      padding: 4rem 2rem;
    }
    
    .locations-title {
      font-size: 4rem;
      text-align: right;
      margin-bottom: 2rem;
      display: flex;
      align-items: center;
      justify-content: flex-end;
    }
    
    .locations-title i {
      color: var(--primary);
      font-size: 4rem;
      margin-left: 1rem;
    }
    
    .locations-subtitle {
      text-align: right;
      font-size: 1rem;
      color: var(--muted-foreground);
      margin-bottom: 3rem;
    }
    
    .locations-container {
      max-height: 800px;
      overflow-y: auto;
      padding-right: 1rem;
      /* Scrollbar styling */
      scrollbar-width: thin;
      scrollbar-color: var(--primary) var(--muted);
    }
    
    .locations-container::-webkit-scrollbar {
      width: 8px;
    }
    
    .locations-container::-webkit-scrollbar-track {
      background: var(--muted);
      border-radius: 10px;
    }
    
    .locations-container::-webkit-scrollbar-thumb {
      background-color: var(--primary);
      border-radius: 10px;
    }
    
    .location-card {
      display: flex;
      margin-bottom: 3rem;
      background-color: var(--card-bg);
      border-radius: var(--radius);
      overflow: hidden;
    }
    
    .location-card:nth-child(even) {
      flex-direction: row-reverse;
    }
    
    .location-image {
      flex: 1;
      min-width: 300px;
      max-width: 400px;
      height: 300px;
      object-fit: cover;
    }
    
    .location-info {
      flex: 1;
      padding: 2rem;
    }
    
    .location-name {
      font-size: 1.8rem;
      margin-bottom: 1rem;
    }
    
    .location-description {
      font-size: 1rem;
      line-height: 1.6;
    }
    
    /* Credits Section */
    .credits-section {
      padding: 4rem 2rem;
      background-color: rgba(42, 42, 42, 0.5);
    }
    
    .credits-title {
      font-size: 3rem;
      text-align: center;
      margin-bottom: 2rem;
      position: relative;
    }
    
    .credits-title:after {
      content: '';
      display: block;
      width: 100px;
      height: 3px;
      background-color: var(--primary);
      margin: 1rem auto;
    }
    
    .credits-container {
      max-width: 800px;
      margin: 0 auto;
    }
    
    .credit-item {
      margin-bottom: 3rem;
      border-bottom: 1px solid var(--border);
      padding-bottom: 2rem;
    }
    
    .credit-item:last-child {
      border-bottom: none;
    }
    
    .credit-role {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-bottom: 1rem;
    }
    
    .credit-role-title {
      font-size: 1.2rem;
      font-weight: 600;
    }
    
    .credit-person {
      font-size: 1.5rem;
      font-weight: 700;
    }
    
    .credit-subtitle {
      font-size: 0.9rem;
      color: var(--muted-foreground);
      margin-bottom: 1rem;
    }
    
    .credit-contributions {
      display: flex;
      flex-wrap: wrap;
      gap: 0.5rem;
    }
    
    .credit-contribution {
      font-size: 0.9rem;
      background-color: var(--muted);
      padding: 0.25rem 0.75rem;
      border-radius: 50px;
    }
    
    .developers-title {
      font-size: 2rem;
      text-align: center;
      margin: 3rem 0 1rem;
    }
    
    .developers-subtitle {
      font-size: 1rem;
      text-align: center;
      color: var(--muted-foreground);
      margin-bottom: 2rem;
    }
    
    
    .footer-placeholder {
      height: 200px;
      background-color: var(--footer);
      margin-top: auto;
      display: flex;
      align-items: center;
      justify-content: center;
      color: white;
      font-weight: bold;
    }
    
    /* Responsive */
    @media (max-width: 992px) {
      .hero-content {
        flex-direction: column;
      }
      
      .hero-title {
        margin-bottom: 2rem;
        font-size: 4rem;
      }
      
      .location-card, .location-card:nth-child(even) {
        flex-direction: column;
      }
      
      .location-image {
        max-width: 100%;
        width: 100%;
      }
    }
    
    @media (max-width: 768px) {
      .hero-title {
        font-size: 3rem;
      }
      
      .locations-title {
        font-size: 3rem;
      }
      
      .locations-title i {
        font-size: 3rem;
      }
    }
  </style>
</head>
<body>
  <jsp:include page=" user-navbar.jsp"/>

  <!-- Hero Section -->
  <section class="hero-section">
    <div class="hero-overlay"></div>
    <div class="hero-content">
      <div class="hero-title">
        WHO<br>WE<br>ARE
      </div>
      <div class="hero-description">
        <img src="${pageContext.request.contextPath}/images/ReelGood.jpg" alt="ReelGood Logo" class="hero-logo">
        <p>At ReelGood, we believe that the magic of cinema should begin long before the opening credits roll. Our mission is simple: to make your movie-going experience faster, easier, and more enjoyable.</p>
        <br>
        <p>Founded with a passion for both technology and entertainment, ReelGood is an online platform designed to streamline the way you discover and book movie tickets. Whether you're planning a night out with friends or a spontaneous solo trip to the cinema, we're here to make sure you never miss a show. We're more than just a booking system – we're movie lovers just like you. That's why we built a platform that not only handles the logistics but also enhances the anticipation. With a sleek interface, smart filters, and intuitive features, ReelGood is built to help you find the right movie, at the right time, at the right place.</p>
        <br>
        <p>We aim to become the go-to destination for moviegoers everywhere – a one-stop hub where the love of film meets the ease of technology. Whether it's a premiere night, a matinee, or a midnight screening, ReelGood is here to get you there. Thank you for choosing ReelGood. Let's make every movie night unforgettable.</p>
      </div>
    </div>
  </section>
  
  <div class="mission-tagline">- We are Mission: Bookable -</div>

  <!-- Locations Section -->
  <section class="locations-section">
    <div class="container">
      <h2 class="locations-title">
        OUR LOCATIONS <i class="fas fa-map-marker-alt"></i>
      </h2>
      <p class="locations-subtitle">Your Indiana Jones treasure found.</p>
      
      <div class="locations-container">
        <!-- Location Template - Can be repeated for more locations -->
        <div class="location-card">
          <img src="${pageContext.request.contextPath}/images/theater1.jpg" alt="ReelGood New Baneshwor" class="location-image">
          <div class="location-info">
            <h3 class="location-name">ReelGood New Baneshwor</h3>
            <p class="location-description">
              Located in the bustling heart of Baneshwor, this hall offers a spacious and well-equipped venue suitable for conferences, meetings, seminars, and social events. It features modern audio-visual equipment, comfortable seating arrangements, and easy accessibility with ample parking nearby. Ideal for both corporate and community gatherings.
            </p>
          </div>
        </div>
        
        <div class="location-card">
          <img src="${pageContext.request.contextPath}/images/theater2.jpg" alt="ReelGood Putalisadak" class="location-image">
          <div class="location-info">
            <h3 class="location-name">ReelGood Putalisadak</h3>
            <p class="location-description">
              Situated in the vibrant commercial area of Putalisadak, this hall is perfect for workshops, training sessions, and medium-sized events. It boasts a professional ambiance with excellent lighting and sound systems, making it an excellent choice for business meetings and cultural programs. Conveniently located with good public transport links.
            </p>
          </div>
        </div>
        
        <div class="location-card">
          <img src="${pageContext.request.contextPath}/images/theater3.jpg" alt="ReelGood Bagbazar" class="location-image">
          <div class="location-info">
            <h3 class="location-name">ReelGood Bagbazar</h3>
            <p class="location-description">
              Nestled in the historic and culturally rich area of Bagbazar, this hall provides a charming and versatile space for various events including cultural shows, private functions, and small conferences. It features traditional decor blended with modern amenities to offer a unique atmosphere. Easily accessible and close to major landmarks.
            </p>
          </div>
        </div>
        
      </div>
    </div>
  </section>

  <!-- Credits Section -->
  <section class="credits-section">
    <div class="container">
      <h2 class="credits-title">Credits</h2>
      
      <div class="credits-container">
        <div class="credit-item">
          <div class="credit-role">
            <span class="credit-role-title">Team Leader:</span>
            <span class="credit-person">SARTHAK BANIYA</span>
          </div>
          <p class="credit-subtitle">The Chosen One</p>
          <div class="credit-contributions">
            <span class="credit-contribution">Frontend Design</span>
            <span class="credit-contribution">Wireframes</span>
            <span class="credit-contribution">Report Formatting</span>
            <span class="credit-contribution">Report Writing</span>
          </div>
        </div>
        
        <h3 class="developers-title">Meet the Developers</h3>
        <p class="developers-subtitle">AKA: The CodeFathers</p>
        
        <div class="credit-item">
          <div class="credit-role">
            <span class="credit-role-title">FrontEnd:</span>
            <span class="credit-person">DISHANT PANJIYAR</span>
          </div>
          <p class="credit-subtitle">500 Days of FlexBox</p>
          <div class="credit-contributions">
            <span class="credit-contribution">Frontend Design</span>
            <span class="credit-contribution">Wireframes</span>
            <span class="credit-contribution">Report Formatting</span>
            <span class="credit-contribution">Report Writing</span>
          </div>
        </div>
        
        <div class="credit-item">
          <div class="credit-role">
            <span class="credit-role-title">Full-Stack:</span>
            <span class="credit-person">SASWAT KHATRY</span>
          </div>
          <p class="credit-subtitle">The Iron Stack</p>
          <div class="credit-contributions">
            <span class="credit-contribution">Frontend Design</span>
            <span class="credit-contribution">Wireframes</span>
            <span class="credit-contribution">Report Formatting</span>
            <span class="credit-contribution">Report Writing</span>
          </div>
        </div>
      </div>
    </div>
  </section>

  <jsp:include page="user-footer.jsp"/>
  </div>
</body>
</html>

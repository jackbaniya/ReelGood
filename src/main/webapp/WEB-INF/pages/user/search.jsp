<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>ReelGood - Movies</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap">
  <style>
    /* Base Styles */
    :root {
      --primary: #f62428;
      --primary-hover: #d91f23;
      --primary-foreground: #ffffff;
      --background: #2a1010;
      --foreground: #ffffff;
      --muted: #3a1c1c;
      --muted-foreground: #b0a8a8;
      --border: #4a2020;
      --header: #bd0202;
      --footer: #110a0a;
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
      flex: 1;
    }
    
    h1,
    h2,
    h3,
    h4,
    h5,
    h6 {
      font-weight: 700;
      line-height: 1.2;
    }
    
    a {
      color: var(--primary);
      text-decoration: none;
    }
    
    .text-muted {
      color: var(--muted-foreground);
    }
    
    .font-medium {
      font-weight: 500;
    }
    
    .divider {
      height: 1px;
      background-color: var(--border);
      margin: 1rem 0;
    }
    
    .separator {
      margin: 0 0.5rem;
    }
    
    /* Button Styles */
    .btn {
      display: inline-flex;
      align-items: center;
      justify-content: center;
      border-radius: var(--radius);
      font-weight: 500;
      font-size: 0.875rem;
      padding: 0.5rem 1rem;
      cursor: pointer;
      transition: all 0.2s ease;
      border: none;
    }
    
    .btn-primary {
      background-color: var(--primary);
      color: var(--primary-foreground);
    }
    
    .btn-primary:hover {
      background-color: var(--primary-hover);
    }
    
    .btn-outline {
      background-color: transparent;
      border: 1px solid var(--border);
      color: var(--foreground);
    }
    
    .btn-outline:hover {
      background-color: var(--muted);
    }
    
    .btn-block {
      width: 100%;
    }
    
    .btn:disabled {
      opacity: 0.5;
      cursor: not-allowed;
    }
    
    /* Icon Button Styles */
    .user-button {
      display: flex;
      align-items: center;
      justify-content: center;
    }
    
    .icon {
      display: inline-flex;
      align-items: center;
      justify-content: center;
      width: 2.5rem;
      height: 2.5rem;
      border-radius: 50%;
      background-color: var(--primary);
      color: var(--primary-foreground);
      border: none;
      cursor: pointer;
      transition: all 0.2s ease;
    }
    
    .icon:hover {
      background-color: var(--primary-hover);
      transform: translateY(-2px);
    }
    
    .icon svg {
      width: 1.25rem;
      height: 1.25rem;
      stroke-width: 2;
    }
    
    .icon-user {
      padding: 0;
    }
    
    /* Header Styles */
    header {
      margin-bottom: 2rem;
      background-color: var(--header);
      padding: 0;
      border-radius: var(--radius);
      box-shadow: var(--shadow-lg);
    }
    
    .header-content {
      width: 100%;
      display: flex;
      align-items: center;
      justify-content: space-between;
      padding: 0.5rem 1.5rem;
    }
    
    .logo-container {
      padding: 0.5rem 0;
    }
    
    .logo-container img {
      display: block;
      height: auto;
      max-height: 60px;
      width: auto;
    }
    
    /* Movie Grid Styles */
    .movie-grid {
      display: grid;
      grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
      gap: 1.5rem;
      margin: 2rem 0;
    }
    
    .movie-card {
      background-color: var(--muted);
      border-radius: var(--radius);
      overflow: hidden;
      box-shadow: var(--shadow);
      transition: transform 0.2s ease, box-shadow 0.2s ease;
    }
    
    .movie-card:hover {
      transform: translateY(-5px);
      box-shadow: var(--shadow-lg);
    }
    
    .movie-poster {
      position: relative;
      aspect-ratio: 2 / 3;
      overflow: hidden;
    }
    
    .movie-poster img {
      width: 100%;
      height: 100%;
      object-fit: cover;
      transition: transform 0.3s ease;
    }
    
    .movie-card:hover .movie-poster img {
      transform: scale(1.05);
    }
    
    .movie-rating {
      position: absolute;
      top: 0.5rem;
      right: 0.5rem;
      background-color: rgba(0, 0, 0, 0.7);
      color: var(--primary-foreground);
      padding: 0.25rem 0.5rem;
      border-radius: var(--radius);
      font-size: 0.75rem;
      font-weight: 600;
    }
    
    .movie-info {
      padding: 1rem;
    }
    
    .movie-title {
      font-size: 1rem;
      margin-bottom: 0.5rem;
      display: -webkit-box;
      /*-webkit-line-clamp: 2;*/
      -webkit-box-orient: vertical;
      overflow: hidden;
      height: 2.4em;
    }
    
    .movie-meta {
      font-size: 0.75rem;
      color: var(--muted-foreground);
      margin-bottom: 1rem;
      display: -webkit-box;
      /*-webkit-line-clamp: 1;*/
      -webkit-box-orient: vertical;
      overflow: hidden;
    }
    
    .book-btn {
      width: 100%;
      margin-top: 0.5rem;
    }
  </style>
</head>
<body>
  <jsp:include page="user-navbar.jsp" />
  
  <h1 style="text-align:center; margin-top: 24px;">Search Results: "${param.query}"</h1>
  <div id="now-showing"> 
    <div class="movie-grid">
      <!-- movie grid for search results will be populated by JavaScript -->
    </div>
  </div>
  
  <jsp:include page="user-footer.jsp" />

  <template id="movie-card-template">
    <div class="movie-card">
      <div class="movie-poster">
        <img src="/placeholder.svg" alt="">
        <span class="movie-rating"></span>
      </div>
      <div class="movie-info">
        <h3 class="movie-title"></h3>
        <div class="movie-meta">
          <span class="movie-duration"></span>
          <span class="separator">•</span>
          <span class="movie-genre"></span>
        </div>
        <a href="#" class="btn btn-primary book-btn">Book Tickets</a>
      </div>
    </div>
  </template>

  <script>
    document.addEventListener("DOMContentLoaded", () => {
      loadMovies();
    });

    function loadMovies() {
      // Get the search query from URL parameters
      const urlParams = new URLSearchParams(window.location.search);
      const searchQuery = urlParams.get('query') || '';
      
      // Sample movie data - in a real application, this would come from a database
      const allMovies = [
        {
          id: "1",
          title: "Interstellar: Beyond Time",
          posterUrl: "${pageContext.request.contextPath}/images/movie.jpg",
          rating: "PG-13",
          duration: "2h 45m",
          genre: "Sci-Fi/Adventure",
        },
        {
          id: "2",
          title: "Sikandar (2025)",
          posterUrl: "${pageContext.request.contextPath}/images/sikander.jpg",
          rating: "PG",
          duration: "2h 26m",
          genre: "Action/Drama",
        },
        {
          id: "3",
          title: "Anjila",
          posterUrl: "${pageContext.request.contextPath}/images/anjila.jpg",
          rating: "R",
          duration: "2h 10m",
          genre: "Romance/Drama",
        },
        {
          id: "4",
          title: "A Minecraft Movie",
          posterUrl: "${pageContext.request.contextPath}/images/minecraft.jpg",
          rating: "PG",
          duration: "1h 41m ",
          genre: "Action, Comedy, Adventure",
        },
        {
          id: "5",
          title: "Snow White",
          posterUrl: "${pageContext.request.contextPath}/images/snowwhite.jpg",
          rating: "PG",
          duration: "1h 49m",
          genre: "Adventure, Romance, Family",
        },
        {
          id: "6",
          title: "Basanta",
          posterUrl: "${pageContext.request.contextPath}/images/basanta.jpg",
          rating: "R",
          duration: "2h 40m",
          genre: "Drama/Romance",
        },
      ];
      
      // Filter movies based on search query
      let filteredMovies = allMovies;
      if (searchQuery) {
        filteredMovies = allMovies.filter(movie => 
          movie.title.toLowerCase().includes(searchQuery.toLowerCase()) ||
          movie.genre.toLowerCase().includes(searchQuery.toLowerCase())
        );
      }

      // Render filtered movies
      const movieGrid = document.querySelector("#now-showing .movie-grid");
      if (movieGrid) {
        // Clear existing content
        movieGrid.innerHTML = '';
        
        if (filteredMovies.length === 0) {
          movieGrid.innerHTML = '<p style="grid-column: 1/-1; text-align: center; padding: 2rem;">No movies found matching your search.</p>';
        } else {
          filteredMovies.forEach((movie) => {
            const movieCard = createMovieCard(movie);
            movieGrid.appendChild(movieCard);
          });
        }
      } else {
        console.error("Movie grid element not found");
      }
    }

    function createMovieCard(movie) {
      const template = document.getElementById("movie-card-template");
      if (!template) {
        console.error("Movie card template not found");
        return document.createElement("div");
      }

      const movieCard = template.content.cloneNode(true);

      // Set movie data
      movieCard.querySelector(".movie-title").textContent = movie.title;
      movieCard.querySelector(".movie-poster img").src = movie.posterUrl;
      movieCard.querySelector(".movie-poster img").alt = movie.title;
      movieCard.querySelector(".movie-duration").textContent = movie.duration;
      movieCard.querySelector(".movie-genre").textContent = movie.genre;

      // Set rating if available
      if (movie.rating) {
        movieCard.querySelector(".movie-rating").textContent = movie.rating;
      } else {
        movieCard.querySelector(".movie-rating").remove();
      }

      // Set button text and link
      const bookBtn = movieCard.querySelector(".book-btn");
      bookBtn.textContent = "Book Tickets";
      bookBtn.href = "${pageContext.request.contextPath}/user/movie-details?id=" + movie.id;

      return movieCard;
    }
  </script>
</body>
</html>

<%-- search input field and button --%>
<script>
document.addEventListener("DOMContentLoaded", () => {
  const searchForm = document.getElementById("search-form")
  const searchInput = document.getElementById("search-input")
  const searchButton = document.getElementById("search-button")

  //form submission
  searchForm.addEventListener("submit", (event) => {
    event.preventDefault() // to prevent the default form sublission

    const searchQuery = searchInput.value.trim()

    if (searchQuery) {
      //redirect to search 
      window.location.href = '${pageContext.request.contextPath}/user/search?query=${encodeURIComponent(searchQuery)}'
    }
})

//allowing pressing enter key to submit
searchInput.addEventListener("keypress", (event) =>{
  if (event.key === "Enter"){
    event.preventDefault()
    searchButton.click()
  }
})
})

</script>


<style>
.user-navbar {
  background: #c00;
  color: #fff;
  width: 100%;
  padding: 0;
  margin: 0;
}
.navbar-content {
  display: flex;
  align-items: center;
  justify-content: space-between;
  max-width: 1400px;
  margin: 0 auto;
  padding: 0 32px;
  height: 100px;
}
.logo-container img {
  height: 80px;
  width: auto;
  object-fit: contain;
}
.main-navigation .nav-links {
  display: flex;
  gap: 32px;
  list-style: none;
  margin: 0;
  padding: 0;
}
.main-navigation .nav-link {
  color: #fff;
  text-decoration: none;
  font-weight: 500;
  font-size: 16px;
  padding: 8px 16px;
  border-radius: 8px;
  transition: background 0.2s;
}
.main-navigation .nav-link:hover,
.main-navigation .nav-link.active {
  background-color: #ff6b81;
  color: #fff;
}
.user-button .icon-user {
  width: 40px;
  height: 40px;
  border-radius: 50%;
  border: none;
  background: #fff;
  color: #c00;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 22px;
  text-decoration: none;
  transition: background 0.2s;
}
.user-button .icon-user:hover {
  background: #ffe9eb;
  color: #b71c1c;
}
@media (max-width: 900px) {
  .navbar-content {
    flex-direction: column;
    height: auto;
    padding: 16px;
    gap: 12px;
  }
  .main-navigation .nav-links {
    gap: 16px;
  }
}

.container {
  width: 100%;
  max-width: 600px;
  padding: 0 20px;
}

.search-bar {
  display: flex;
  align-items: center;
  background-color: #1a1a1a; /* Black background for search bar */
  border-radius: 50px;
  overflow: hidden;
  height: 50px;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
}

#search-input {
  flex: 1;
  border: none;
  background-color: transparent;
  padding: 0 20px;
  height: 100%;
  color: white;
  font-size: 16px;
  outline: none;
}

#search-input::placeholder {
  color: #999;
}

#search-button {
  background-color: transparent;
  border: none;
  color: white;
  width: 50px;
  height: 50px;
  cursor: pointer;
  display: flex;
  justify-content: center;
  align-items: center;
  transition: background-color 0.3s;
}

#search-button:hover {
  background-color: rgba(255, 255, 255, 0.1);
}

#search-button i {
  font-size: 18px;
}

</style>
<div class="user-navbar">
  <div class="navbar-content">
    <div class="logo-container">
      <a href="<%= request.getContextPath() %>/user/index">
        <img src="<%= request.getContextPath() %>/images/ReelGood.jpg" alt="ReelGood Logo">
      </a>
    </div>
    <nav class="main-navigation">
      <ul class="nav-links">
        <li><a href="<%= request.getContextPath() %>/user/index" class="nav-link">Home</a></li>
        <li><a href="<%= request.getContextPath() %>/user/movies" class="nav-link">Movies</a></li>
        <li><a href="<%= request.getContextPath() %>/user/contact" class="nav-link">Help</a></li>
        <li>
          <div class="container">
            <form id ="search-form" action ="${pageContext.reqiest.contextPath}/user/search" method="get">
              <div class = "search-bar">
                <input type ="text" id = "search-input" name = "query" placeholder="Search.." autocomplete = "off">
                <button type = "submit" id = "search-button">
                  <i class="fa fa-search" aria-hidden="true"></i>
                </button>
              </div>
            </form>
          </div>
        </li>
      </ul>
    </nav>
    <div class="user-button">
      <a href="<%= request.getContextPath() %>/user/profile" class="icon-user">
        <i class="fa fa-user"></i>
      </a>
    </div>
  </div>
</div> 
package com.reelgood.service;

import com.reelgood.model.MovieModel;
import com.reelgood.config.DbConfig;
import java.sql.Blob;
import java.util.ArrayList;
import java.util.List;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class MovieService {
    public List<MovieModel> getAllMovies() {
        List<MovieModel> movies = new ArrayList<>();
        try (Connection conn = DbConfig.getDbConnection()) {
            String sql = "SELECT MovieID, MovieTitle, ReleaseDate, Duration, Genre, Language, Rating, Image, Status, Description, Cast, Director FROM movie";
            try (PreparedStatement stmt = conn.prepareStatement(sql);
                 ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    MovieModel movie = new MovieModel();
                    movie.setId(rs.getInt("MovieID"));
                    movie.setTitle(rs.getString("MovieTitle"));
                    movie.setReleaseDate(rs.getDate("ReleaseDate"));
                    movie.setDuration(rs.getString("Duration"));
                    movie.setGenre(rs.getString("Genre"));
                    movie.setLanguage(rs.getString("Language"));
                    movie.setRating(rs.getInt("Rating"));
                    movie.setImage(rs.getBlob("Image"));
                    movie.setStatus(rs.getString("Status"));
                    movie.setDescription(rs.getString("Description"));
                    movie.setCast(rs.getString("Cast"));
                    movie.setDirector(rs.getString("Director"));
                    movies.add(movie);
                }
            }
            return movies;
        } catch (SQLException e) {
            throw new RuntimeException("Error fetching movies: " + e.getMessage(), e);
        }
    }

    public void addMovie(MovieModel movie) throws SQLException {
        try (Connection conn = DbConfig.getDbConnection()) {
            conn.setAutoCommit(false);
            try {
                // Insert movie details
                String sql = "INSERT INTO movie (MovieTitle, ReleaseDate, Duration, Genre, Language, Rating, Status, Description, Cast, Director) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
                try (PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
                    stmt.setString(1, movie.getTitle());
                    stmt.setDate(2, movie.getReleaseDate());
                    stmt.setString(3, movie.getDuration());
                    stmt.setString(4, movie.getGenre());
                    stmt.setString(5, movie.getLanguage());
                    if (movie.getRating() == null) {
                        stmt.setNull(6, java.sql.Types.INTEGER);
                    } else {
                        stmt.setInt(6, movie.getRating());
                    }
                    stmt.setString(7, movie.getStatus());
                    stmt.setString(8, movie.getDescription());
                    stmt.setString(9, movie.getCast());
                    stmt.setString(10, movie.getDirector());
                    stmt.executeUpdate();

                    // Get the generated movie ID
                    try (ResultSet rs = stmt.getGeneratedKeys()) {
                        if (rs.next()) {
                            int movieId = rs.getInt(1);
                            
                            // If image is provided, update it
                            if (movie.getImage() != null) {
                                String updateImage = "UPDATE movie SET Image=? WHERE MovieID=?";
                                try (PreparedStatement updateStmt = conn.prepareStatement(updateImage)) {
                                    updateStmt.setBlob(1, movie.getImage());
                                    updateStmt.setInt(2, movieId);
                                    updateStmt.executeUpdate();
                                }
                            }
                        }
                    }
                }
                conn.commit();
            } catch (SQLException e) {
                conn.rollback();
                throw e;
            } finally {
                conn.setAutoCommit(true);
            }
        }
    }

    public MovieModel getMovieById(int id) throws SQLException {
        System.out.println("DEBUG - MovieService.getMovieById - Looking for movie with ID: " + id);
        try (Connection conn = DbConfig.getDbConnection()) {
            String sql = "SELECT MovieID, MovieTitle, ReleaseDate, Duration, Genre, Language, Rating, Image, Status, Description, Cast, Director FROM movie WHERE MovieID = ?";
            System.out.println("DEBUG - MovieService.getMovieById - SQL: " + sql);
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setInt(1, id);
                System.out.println("DEBUG - MovieService.getMovieById - Executing query for ID: " + id);
                try (ResultSet rs = stmt.executeQuery()) {
                    if (rs.next()) {
                        MovieModel movie = new MovieModel();
                        movie.setId(rs.getInt("MovieID"));
                        movie.setTitle(rs.getString("MovieTitle"));
                        movie.setReleaseDate(rs.getDate("ReleaseDate"));
                        movie.setDuration(rs.getString("Duration"));
                        movie.setGenre(rs.getString("Genre"));
                        movie.setLanguage(rs.getString("Language"));
                        movie.setRating(rs.getInt("Rating"));
                        movie.setImage(rs.getBlob("Image"));
                        movie.setStatus(rs.getString("Status"));
                        movie.setDescription(rs.getString("Description"));
                        movie.setCast(rs.getString("Cast"));
                        movie.setDirector(rs.getString("Director"));
                        System.out.println("DEBUG - MovieService.getMovieById - Found movie: " + movie.getTitle());
                        return movie;
                    }
                    System.out.println("DEBUG - MovieService.getMovieById - No movie found with ID: " + id);
                    return null;
                }
            }
        } catch (SQLException e) {
            System.out.println("DEBUG - MovieService.getMovieById - SQLException: " + e.getMessage());
            e.printStackTrace();
            throw e;
        }
    }

    public void updateMovie(MovieModel movie) throws SQLException {
        try (Connection conn = DbConfig.getDbConnection()) {
            conn.setAutoCommit(false);
            try {
                // Update movie details
                String sql = "UPDATE movie SET MovieTitle=?, ReleaseDate=?, Duration=?, Genre=?, Language=?, Rating=?, Status=?, Description=?, Cast=?, Director=? WHERE MovieID=?";
                try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                    stmt.setString(1, movie.getTitle());
                    stmt.setDate(2, movie.getReleaseDate());
                    stmt.setString(3, movie.getDuration());
                    stmt.setString(4, movie.getGenre());
                    stmt.setString(5, movie.getLanguage());
                    if (movie.getRating() == null) {
                        stmt.setNull(6, java.sql.Types.INTEGER);
                    } else {
                        stmt.setInt(6, movie.getRating());
                    }
                    stmt.setString(7, movie.getStatus());
                    stmt.setString(8, movie.getDescription());
                    stmt.setString(9, movie.getCast());
                    stmt.setString(10, movie.getDirector());
                    stmt.setInt(11, movie.getId());
                    stmt.executeUpdate();

                    // Update movie image if provided
                    if (movie.getImage() != null) {
                        String updateImage = "UPDATE movie SET Image=? WHERE MovieID=?";
                        try (PreparedStatement updateStmt = conn.prepareStatement(updateImage)) {
                            updateStmt.setBlob(1, movie.getImage());
                            updateStmt.setInt(2, movie.getId());
                            updateStmt.executeUpdate();
                        }
                    }
                }
                conn.commit();
            } catch (SQLException e) {
                conn.rollback();
                throw e;
            } finally {
                conn.setAutoCommit(true);
            }
        }
    }

    public void deleteMovie(int id) throws SQLException {
        // Validate movie existence before deletion
        MovieModel movie = getMovieById(id);
        if (movie == null) {
            throw new SQLException("Movie with ID " + id + " does not exist");
        }

        try (Connection conn = DbConfig.getDbConnection()) {
            conn.setAutoCommit(false);
            try {
                // 1. Find all show IDs for this movie
                String selectShows = "SELECT ScheduleID FROM movie_theater_schedule WHERE MovieID = ?";
                try (PreparedStatement showStmt = conn.prepareStatement(selectShows)) {
                    showStmt.setInt(1, id);
                    try (ResultSet rs = showStmt.executeQuery()) {
                        while (rs.next()) {
                            int scheduleId = rs.getInt("ScheduleID");
                            // 2. Delete all bookings for this show
                            String deleteBookings = "DELETE FROM bookings WHERE ScheduleID = ?";
                            try (PreparedStatement bookingStmt = conn.prepareStatement(deleteBookings)) {
                                bookingStmt.setInt(1, scheduleId);
                                bookingStmt.executeUpdate();
                            }
                        }
                    }
                }
                // 3. Delete all shows for this movie
                String deleteShows = "DELETE FROM movie_theater_schedule WHERE MovieID = ?";
                try (PreparedStatement stmt = conn.prepareStatement(deleteShows)) {
                    stmt.setInt(1, id);
                    stmt.executeUpdate();
                }
                // 4. Delete the movie
                String deleteMovie = "DELETE FROM movie WHERE MovieID = ?";
                try (PreparedStatement stmt = conn.prepareStatement(deleteMovie)) {
                    stmt.setInt(1, id);
                    stmt.executeUpdate();
                }
                conn.commit();
            } catch (SQLException e) {
                conn.rollback();
                throw e;
            } finally {
                conn.setAutoCommit(true);
            }
        }
    }

    public Blob getMovieImage(int movieId) throws SQLException {
        try (Connection conn = DbConfig.getDbConnection()) {
            String sql = "SELECT Image FROM movie WHERE MovieID = ?";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setInt(1, movieId);
                try (ResultSet rs = stmt.executeQuery()) {
                    if (rs.next()) {
                        return rs.getBlob("Image");
                    }
                    return null;
                }
            }
        }
    }

    public List<MovieModel> searchMoviesByTitle(String query) {
        List<MovieModel> movies = new ArrayList<>();
        try (Connection conn = DbConfig.getDbConnection()) {
            String sql = "SELECT MovieID, MovieTitle, ReleaseDate, Duration, Genre, Language, Rating, Image, Status, Description, Cast, Director FROM movie WHERE LOWER(MovieTitle) LIKE ?";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1, "%" + query.toLowerCase() + "%");
                try (ResultSet rs = stmt.executeQuery()) {
                    while (rs.next()) {
                        MovieModel movie = new MovieModel();
                        movie.setId(rs.getInt("MovieID"));
                        movie.setTitle(rs.getString("MovieTitle"));
                        movie.setReleaseDate(rs.getDate("ReleaseDate"));
                        movie.setDuration(rs.getString("Duration"));
                        movie.setGenre(rs.getString("Genre"));
                        movie.setLanguage(rs.getString("Language"));
                        movie.setRating(rs.getInt("Rating"));
                        movie.setImage(rs.getBlob("Image"));
                        movie.setStatus(rs.getString("Status"));
                        movie.setDescription(rs.getString("Description"));
                        movie.setCast(rs.getString("Cast"));
                        movie.setDirector(rs.getString("Director"));
                        movies.add(movie);
                    }
                }
            }
            return movies;
        } catch (SQLException e) {
            throw new RuntimeException("Error searching movies: " + e.getMessage(), e);
        }
    }
}
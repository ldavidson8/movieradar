# MovieRadar

MovieRadar is a Flutter application that allows users to search for and discover movies using the TMDB (The Movie Database) API.

## Features

- **Movie Details**: Users can view detailed information about a movie, including its plot, cast, and reviews.
- **Watchlist**: Users can add movies to a personalized watchlist, which is stored locally on the device.

## Technologies Used

- **Flutter**: The application is built using the Flutter framework, which allows for cross-platform development.
- **TMDB API**: The app integrates with the TMDB API to fetch movie data, including titles, descriptions, cast information, and reviews.
- **Shared Preferences**: The app uses the `shared_preferences` package to store the user's watchlist locally on the device.
- **Go Router**: The app uses the `go_router` package for handling navigation and routing within the application.
- **Bloc Pattern**: The app follows the Bloc (Business Logic Component) pattern, which separates the business logic from the UI.
- **Shimmer Effect**: The app uses the `shimmer` package to provide a loading indicator while fetching data from the TMDB API.

## Project Structure

The project's structure follows the Bloc pattern and is organized as follows:

1. **movieradar**:

   - This is the main project directory.
   - It contains the Flutter app's configuration files, such as `.env` and `.env.example`.

2. **lib**:

   - This folder contains the main source code of the Flutter app.
   - **blocs**: This folder contains the business logic components (BLoCs) of the app, which handle the application state.
   - **data**: This folder contains the data-related files, such as the database helper and the TMDB API integration.
   - **firebase_options.dart**: This file contains the configuration for the Firebase integration.
   - **main.dart**: This is the entry point of the Flutter app.
   - **models**: This folder contains the data models used throughout the app.
   - **repositories**: This folder contains the repository classes that handle data fetching and processing.
   - **themes.dart** and **theme_constants.dart**: These files define the app's theme and color constants.
   - **ui**:
     - **screens**: This folder contains the app's main screens and pages.
     - **widgets**: This folder contains the reusable UI components used throughout the app.
   - **utils**: This folder contains utility classes and functions used in the app.

3. **pubspec.lock** and **pubspec.yaml**:

   - These files manage the app's dependencies and Flutter configuration.

4. **README.md**:

   - This file contains the project's documentation and instructions.

5. **test**:

   - This folder contains the app's unit tests.
   - **mocks**: This folder contains mock implementations used for testing.

6. **TMDB api**:
   - This folder contains the TMDB API requests and responses used in the app.
   - **bruno.json** and **collection.bru** are files related to the TMDB API integration.
   - **environments** folder contains the TMDB API environment configuration.

<details>
<summary>View Requests</summary>
Here's a detailed summary of the TMDB API requests in the folder:

1. **Discover Movie.bru**:

   - This file contains the API request and response for the TMDB Discover Movie endpoint, which allows you to discover movies based on various criteria, such as genre, release date, and popularity.

2. **Get List of Movies currently in theatres.bru**:

   - This file contains the API request and response for the TMDB endpoint that retrieves the list of movies currently playing in theaters.

3. **Get List of Popular Movies.bru**:

   - This file contains the API request and response for the TMDB endpoint that retrieves the list of popular movies.

4. **Get List of Top Rated Movies.bru**:

   - This file contains the API request and response for the TMDB endpoint that retrieves the list of top-rated movies.

5. **Get List of Upcoming Movies.bru**:

   - This file contains the API request and response for the TMDB endpoint that retrieves the list of upcoming movies.

6. **Get Movie Credits.bru**:

   - This file contains the API request and response for the TMDB endpoint that retrieves the cast and crew information for a specific movie.

7. **Get Movie details by ID.bru**:

   - This file contains the API request and response for the TMDB endpoint that retrieves the details of a specific movie, including its title, plot, release date, and more.

8. **Get Recommendation from Movie ID.bru**:

   - This file contains the API request and response for the TMDB endpoint that retrieves the recommended movies based on a specific movie's ID.

9. **Get Trending by Day.bru** and **Get Trending by Week.bru**:

   - These files contain the API requests and responses for the TMDB endpoints that retrieve the trending movies, TV shows, and people for the current day and week, respectively.

10. **Get Trending Movies by Day.bru** and **Get Trending Movies by Week.bru**:

    - These files contain the API requests and responses for the TMDB endpoints that retrieve the trending movies for the current day and week, respectively.

11. **Get Trending People by Day.bru** and **Get Trending People by Week.bru**:

    - These files contain the API requests and responses for the TMDB endpoints that retrieve the trending people for the current day and week, respectively.

12. **Get Trending TV Shows by Day.bru** and **Get Trending TV Shows by Week.bru**:

    - These files contain the API requests and responses for the TMDB endpoints that retrieve the trending TV shows for the current day and week, respectively.

13. **Get Videos from Movie ID.bru**:

    - This file contains the API request and response for the TMDB endpoint that retrieves the videos (e.g., trailers, clips) associated with a specific movie.

14. **Search for movies.bru**: - This file contains the API request and response for the TMDB endpoint that searches for movies based on a user's query.
</details>

## Getting Started

To run the MovieRadar app, follow these steps:

1. Clone the repository: `git clone https://github.com/ldavidson8/movie-radar.git`
2. Navigate to the project directory: `cd movie-radar`
3. Install the dependencies: `flutter pub get`
4. Run the app: `flutter run`

Make sure you have the Flutter SDK installed and configured on your development environment.

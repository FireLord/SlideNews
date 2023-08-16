# SlideNews :newspaper:

#### An application to show news from various parts of the world :world_map: made in clean architecture MVVM.

## Features

- You can search the news articles.
- You can view the news articles in the app itself.
- You can save the news articles.
- You can delete by sliding the news article.
- You can undo the delete action from the SnackBar

## Screenshots
<img src = "/screenshots/1.jpeg" alt="screenshot1" width="200"/> <img src = "/screenshots/2.jpeg" alt="screenshot2" width="200"/> <img src = "/screenshots/3.jpeg" alt="screenshot3" width="200"/> <img src = "/screenshots/4.jpeg" alt="screenshot4" width="200"/>

## Download
You can download the apk from [releases](https://github.com/FireLord/SlideNews/releases/download/v1/slideNews-v1.apk)

## Libraries Used

- Retrofit: For making network requests and fetching news data from the API.
- RecyclerView: For displaying a list of news articles.
- Hilt: For dependency injection
- Room db: For storing the fetched news data from newsapi.org.
- Navigation: To handle the fragments and have only 1 Activity file

## Getting Started

To run the SlideNews App on your local machine, follow these steps:

1. Clone the repository: `git clone https://github.com/FireLord/SlideNews.git`
2. Open the project in Android Studio.
3. Build and run the app on an emulator or physical device.

Make sure you have an active internet connection to fetch the data from the API.
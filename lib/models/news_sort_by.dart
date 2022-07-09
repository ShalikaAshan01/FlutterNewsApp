enum NewsSortBy { relevancy, popularity, publishedAt }

extension NewsSortByExtension on NewsSortBy {
  String enumToString() {
    switch (this) {
      case NewsSortBy.relevancy:
        return 'Relevancy';
      case NewsSortBy.popularity:
        return 'Popularity';
      case NewsSortBy.publishedAt:
        return 'Published At';
    }
  }
}

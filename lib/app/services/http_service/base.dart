class ProHeal {
  static String baseUrl =
      'https://health.gov/myhealthfinder/api/v3/topicsearch.json';
  static String topicsUrl = '$baseUrl?topicId=';
  static String healthNewsUrl =
      'https://newsapi.org/v2/top-headlines?country=us&category=health';
  static Map<String, String> headers = {
    "Authorization": "fae23e0131604ca99bd4b7c2fa7915c9",
    "Content-Type": "application/json",
  };
}

const String API_URL = "192.168.0.199";

Uri getUri(String path) {
  return new Uri(
    scheme: 'http',
    host: API_URL,
    port: 3399,
    path: path,
  );
}

Uri getUriWithQuery(String path, Map<String, dynamic> query) {
  return new Uri(
    scheme: 'http',
    host: API_URL,
    port: 3399,
    path: path,
    queryParameters: query,
  );
}

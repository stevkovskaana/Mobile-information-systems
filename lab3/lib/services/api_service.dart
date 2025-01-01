import 'package:http/http.dart' as http;

class ApiService {
  static Future<http.Response> getJokeTypesFromAPI() async {
    var response = await http
        .get(Uri.parse("https://official-joke-api.appspot.com/types"));
    print("Response: ${response.body}");
    return response;
  }

  static Future<http.Response> getJokesForTypeFromAPI(String type) async {
    var response = await http.get(
        Uri.parse("https://official-joke-api.appspot.com/jokes/$type/ten"));
    print("Response: ${response.body}");
    return response;
  }

  static Future<http.Response> getRandomJokeFromAPI() async {
    var response = await http
        .get(Uri.parse("https://official-joke-api.appspot.com/random_joke"));
    print("Response: ${response.body}");
    return response;
  }
}

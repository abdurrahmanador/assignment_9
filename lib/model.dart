import 'package:http/http.dart'as http;
import 'dart:convert';

class WeatherData{
  final String temperature;
  final String description;
  WeatherData({required this.temperature,required this.description});
}

class WeatherApi {
  final String apikey;
  final String baseUrl;

  WeatherApi({required this.apikey, required this.baseUrl});

  Future<WeatherData> fetchWeatherData(String cityName, Map<String, dynamic> data) async {
    final response = await http.post(
      Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?q=chittagong&appid=94201acea62c96c25114571eb7cd3dbb&fbclid=IwAR2GBbIuH5NKa6p-wUH5ApWgf5pMg0LlMEzxuGRSmAHA6XBfzrtorYG7aZo'),
      body: json.encode(data),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final jsonBody = json.decode(response.body);
      print(jsonBody);
      final temperature = jsonBody['main']['temp'].toString();
      final description = jsonBody['weather'][0]['description'];

      return WeatherData(temperature: temperature, description: description);
    } else {
      throw Exception('Failed to fetch weather data');
    }
  }

}
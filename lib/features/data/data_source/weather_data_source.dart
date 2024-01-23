import 'package:dio/dio.dart';

class WeatherRemoteDataSource {
  final Dio _dio = Dio();

  Future<Map<String, dynamic>> getWeather(String cityName) async {
    final response = await _dio.get(
      'http://api.weatherapi.com/v1/current.json?key=e76d154ceb2a4e05a2c62513241901&q=&aqi=no',
    );
    return response.data;
  }
}

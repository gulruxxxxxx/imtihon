import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/data/data_source/weather_data_source.dart';
import '../../features/data/repository/get_weather.dart';
import '../../features/domain/usecase/weather.dart';

final serviceLocator = GetIt.I;

Future<void> setupLocator() async{
  serviceLocator.registerSingletonAsync(
          () async=> await SharedPreferences.getInstance()
  );
  serviceLocator.registerLazySingleton(() => Dio (BaseOptions(baseUrl: 'http://api.weatherapi.com')));
  serviceLocator.registerLazySingleton(() => WeatherRemoteDataSource());
  serviceLocator.registerLazySingleton(() => WeatherRepositoryImpl(serviceLocator()));
  serviceLocator.registerLazySingleton(() => GetWeatherUseCase(serviceLocator()));
}
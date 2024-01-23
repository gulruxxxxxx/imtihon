part of 'weather_bloc.dart';
class WeatherState extends Equatable {
  @override
  List<Object?> get props => [];
}

class BlueWeather extends WeatherState {}

class RedWeather extends WeatherState {}

class YellowWeather extends WeatherState {}

class GreenWeather extends WeatherState {}
class GetWeatherState {
  final LoadingStatus status;
  final List<WeatherModel> weatherModel;

  GetWeatherState({required this.status, required this.weatherModel});

  GetWeatherState copyWith(
      {LoadingStatus? status, List<WeatherModel>? weatherModel}) {
    return GetWeatherState(
        status: status ?? this.status, weatherModel: weatherModel ?? this.weatherModel);
  }
}

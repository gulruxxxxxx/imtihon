// // features/weather/domain/entities/weather_entity.dart
// import 'package:equatable/equatable.dart';
//
// class WeatherEntity extends Equatable {
//   final String cityName;
//   final String region;
//   final String country;
//   final double latitude;
//   final double longitude;
//   final String timezoneId;
//   final int localtimeEpoch;
//   final String localtime;
//
//   final String lastUpdated;
//   final double temperature;
//   final bool isDay;
//   final String conditionText;
//   final double windSpeed;
//   final int humidity;
//   final int cloud;
//
//   WeatherEntity({
//     required this.cityName,
//     required this.region,
//     required this.country,
//     required this.latitude,
//     required this.longitude,
//     required this.timezoneId,
//     required this.localtimeEpoch,
//     required this.localtime,
//     required this.lastUpdated,
//     required this.temperature,
//     required this.isDay,
//     required this.conditionText,
//     required this.windSpeed,
//     required this.humidity,
//     required this.cloud,
//   });
//
//   @override
//   List<Object?> get props => [
//     cityName,
//     region,
//     country,
//     latitude,
//     longitude,
//     timezoneId,
//     localtimeEpoch,
//     localtime,
//     lastUpdated,
//     temperature,
//     isDay,
//     conditionText,
//     windSpeed,
//     humidity,
//     cloud,
//   ];
// }
import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather.freezed.dart';

@Freezed()
class WeatherEntity with _$WeatherEntity{
  const factory WeatherEntity({
    required int last_updated,
    required String icon,
    required int temperature,
    required String condition,
    required String city,
    required String country,
    required double wind_speed,
    required int humidity,
    required int cloud,
  }) = _WeatherEntity;
}

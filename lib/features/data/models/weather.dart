import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather.freezed.dart';

part 'weather.g.dart';

@Freezed(toJson: true)
class WeatherModel with _$WeatherModel {
 factory WeatherModel({
    @Default(0) int last_updated,
    @Default('') String icon,
    @Default(0) int temperature,
    @Default('') String condition,
    @Default('') String city,
    @Default('') String country,
    @Default(0) double wind_speed,
    @Default(0) int humidity,
    @Default(0) int cloud,
 }) = _WeatherModel;

  factory WeatherModel.fromJson(Map<String, dynamic> data) =>
      _$WeatherModelFromJson(data);

// @override
// Map<String, dynamic> toJson() => _$WeatherModelToJson(this);

}

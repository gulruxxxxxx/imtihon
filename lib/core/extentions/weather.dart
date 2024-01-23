
import '../../features/data/models/weather.dart';
import '../../features/domain/entities/weather.dart';

extension WeatherModelExtension on WeatherModel {
  WeatherEntity get toEntity {
    return WeatherEntity(
     last_updated: last_updated,
      icon: icon,
      temperature: temperature,
      condition: condition,
      city: city,
      country: country,
      wind_speed: wind_speed,
      humidity: humidity,
      cloud: cloud
    );
  }
}

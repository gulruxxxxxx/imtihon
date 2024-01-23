// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WeatherModelImpl _$$WeatherModelImplFromJson(Map<String, dynamic> json) =>
    _$WeatherModelImpl(
      last_updated: json['last_updated'] as int? ?? 0,
      icon: json['icon'] as String? ?? '',
      temperature: json['temperature'] as int? ?? 0,
      condition: json['condition'] as String? ?? '',
      city: json['city'] as String? ?? '',
      country: json['country'] as String? ?? '',
      wind_speed: (json['wind_speed'] as num?)?.toDouble() ?? 0,
      humidity: json['humidity'] as int? ?? 0,
      cloud: json['cloud'] as int? ?? 0,
    );

Map<String, dynamic> _$$WeatherModelImplToJson(_$WeatherModelImpl instance) =>
    <String, dynamic>{
      'last_updated': instance.last_updated,
      'icon': instance.icon,
      'temperature': instance.temperature,
      'condition': instance.condition,
      'city': instance.city,
      'country': instance.country,
      'wind_speed': instance.wind_speed,
      'humidity': instance.humidity,
      'cloud': instance.cloud,
    };

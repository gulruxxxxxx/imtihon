
import '../../../../core/either/either.dart';
import '../../../../core/failure/failure.dart';
import '../entities/weather.dart';

abstract class WeatherRepository {
  Future<Either<ServerFailure, List<WeatherEntity>>> getWeather();
}
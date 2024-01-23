
import '../../../core/either/either.dart';
import '../../../core/failure/failure.dart';
import '../../../core/usecase/usecases.dart';
import '../entities/weather.dart';
import '../repository/get_weather.dart';

class GetWeatherUseCase implements UseCase<List<WeatherEntity>, NoParams> {
  final WeatherRepository _weatherRepository;

  const GetWeatherUseCase(WeatherRepository repository)
      : _weatherRepository = repository;

  @override
  Future<Either<Failure, List<WeatherEntity>>> call(params) {
    return _weatherRepository.getWeather();
  }
}

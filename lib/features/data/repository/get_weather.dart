
import 'package:dio/dio.dart';

import '../../../../core/exception/exception.dart';
import '../../../core/either/either.dart';
import '../../../core/failure/failure.dart';
import '../../domain/entities/weather.dart';
import '../../domain/repository/get_weather.dart';
import '../data_source/weather_data_source.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherRemoteDataSource _remoteDataSource;

  const WeatherRepositoryImpl(WeatherRemoteDataSource remoteDataSource)
      : _remoteDataSource = remoteDataSource;

  @override
  Future<Either<ServerFailure, List<WeatherEntity>>> getWeather() async {
    try {


      return Right(WeatherEntity as List<WeatherEntity>
      );

    } on ServerException catch (exception) {
      return Left(ServerFailure());
    }
  }
}

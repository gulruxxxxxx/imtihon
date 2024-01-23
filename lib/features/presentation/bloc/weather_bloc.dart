
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../../data/models/status.dart';
import '../../data/models/weather.dart';
part 'weather_state.dart';
part 'weather_event.dart';

class GetWeatherBloc extends Bloc<GetWeatherEvent, GetWeatherState> {
  GetWeatherBloc()
      : super(GetWeatherState(
    status: LoadingStatus.pure,
    weatherModel: [],
  )) {
    on<GetFullWeather>((event, emit) async {
      emit(state.copyWith(status: LoadingStatus.loading));
      try {
        await Future.delayed(const Duration(seconds: 3));
        final dio = Dio();
        final response = await dio.get(
            "http://api.weatherapi.com/v1/current.json?key=e76d154ceb2a4e05a2c62513241901&q=Tashkent&aqi=no");
        final weathers = WeatherModel.fromJson(response.data);


        emit(
          state.copyWith(
              status: LoadingStatus.loadedWithSuccess, weatherModel: [weathers]),
        );
      } catch (e) {
        print(e);
        emit(state.copyWith(status: LoadingStatus.loadedWithFailure));
        event.onFailure('$e');
      }
    });
  }
}

class WeatherBloc extends Bloc<int, WeatherState> {
  WeatherBloc(param0) : super(BlueWeather());

  @override
  Stream<WeatherState> mapEventToState(int temperature) async* {
    if (temperature > 25) {
      yield RedWeather();
    } else if (temperature > 15) {
      yield YellowWeather();
    } else if (temperature > 5) {
      yield GreenWeather();
    } else {
      yield BlueWeather();
    }
  }
}

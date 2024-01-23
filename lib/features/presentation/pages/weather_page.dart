import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imtihon/assets/constants/colors.dart';
import 'package:imtihon/assets/constants/images.dart';

import '../../../core/usecase/usecases.dart';
import '../../data/data_source/weather_data_source.dart';
import '../../data/models/status.dart';
import '../../data/repository/get_weather.dart';
import '../../domain/usecase/weather.dart';
import '../bloc/weather_bloc.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => GetWeatherBloc(),
        child: Builder(builder: (context) {
          return Scaffold(
              body: Stack(
            fit: StackFit.expand,
            children: [
              BlocBuilder<GetWeatherBloc, GetWeatherState>(
                  builder: (context, state) {
                if (state.status == LoadingStatus.pure) {
                  context.read<GetWeatherBloc>().add(
                        GetFullWeather(
                          onSuccess: () {},
                          onFailure: (onFailure) {},
                        ),
                      );
                } else if (state.status == LoadingStatus.loading) {
                  return const Center(
                    child: CupertinoActivityIndicator(),
                  );
                } else if (state.status == LoadingStatus.loadedWithSuccess) {
                  final weather = state.weatherModel[0];
                  return Stack(
                    children: [
                      Center(
                        child: Image.asset(
                          AppImages.background,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Center(
                        child: Container(
                          height: 300,
                          width: 300,
                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(35),
                              gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              snow_template,
                              snow_template,
                            ],
                          )),
                          child: Text(
                              '${weather.humidity}%',
                          ),
                        ),
                      ),
                    ],
                  );
                }
                return SizedBox();
              })
            ],
          ));
        }));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/injector/set_up_locator.dart';
import 'features/data/data_source/weather_data_source.dart';
import 'features/presentation/bloc/weather_bloc.dart';
import 'features/presentation/pages/weather_page.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FutureBuilder(
        future: Future.delayed(Duration(seconds: 3)),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return BlocProvider(
              create: (context) => WeatherBloc(
                serviceLocator<WeatherRemoteDataSource>(),
              ),
              child: WeatherScreen(),
            );
          } else {
            return SplashScreen();
          }
        },
      ),
    );
  }
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}



import 'package:bloc/bloc.dart';
import 'package:bloc_state_management_projects/weather_app/data/location_permission.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/weather.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {
    on<FetchWeather>((event, emit) async {
      emit(WeatherLoading());
      try {
        // making request to get weather data using the Weather package.
        
        WeatherFactory weatherFactory =
            WeatherFactory(dotenv.env['api_key']!, language: Language.ENGLISH);

        // getting phone current location
        Position position = await LocationUtil().determinePosition();

        Weather weather = await weatherFactory.currentWeatherByLocation(
          position.latitude,
          position.longitude,
        );
        emit(WeatherSuccess(weather));
      } catch (e) {
        emit(WeatherFailure());
      }
    });
  }
}

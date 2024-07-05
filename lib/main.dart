import 'package:bloc_state_management_projects/todo/cubit/todo_cubit.dart';
import 'package:bloc_state_management_projects/todo/pages/todo_list.dart';
import 'package:bloc_state_management_projects/weather_app/bloc/weather_bloc.dart';
import 'package:bloc_state_management_projects/weather_app/features/weather/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TodoCubit()),
        BlocProvider(create: (context) => WeatherBloc()..add(FetchWeather())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Bloc infinite list',
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: const Home(),
      ),
    );
  }
}

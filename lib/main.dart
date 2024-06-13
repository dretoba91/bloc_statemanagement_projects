import 'package:bloc_state_management_projects/infinite_list/bloc/post_bloc.dart';
import 'package:bloc_state_management_projects/infinite_list/views/posts.page.dart';
import 'package:bloc_state_management_projects/todo/cubit/todo_cubit.dart';
import 'package:bloc_state_management_projects/todo/pages/todo_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => TodoCubit())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Bloc infinite list',
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: TodoList(),
      ),
    );
  }
}

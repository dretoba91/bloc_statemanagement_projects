import 'package:bloc_state_management_projects/infinite_list/views/posts.page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bloc infinite list',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const PostPage(),
    );
  }
}
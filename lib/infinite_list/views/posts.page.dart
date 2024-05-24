import 'package:bloc_state_management_projects/infinite_list/bloc/post_bloc.dart';
import 'package:bloc_state_management_projects/infinite_list/bloc/post_event.dart';
import 'package:bloc_state_management_projects/infinite_list/views/posts_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class PostPage extends StatelessWidget {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Post lists managed by Bloc'
        ),
        centerTitle: true,
        backgroundColor: Colors.blueGrey[700],
        elevation: 1.0,
      ),
      body: BlocProvider(
        create: (_) => PostBloc(httpClient: http.Client())
          ..add(
            PostFetched(),
        ),
        child: const SafeArea(
          child: PostList(),
        ),
      ),
    );
  }
}

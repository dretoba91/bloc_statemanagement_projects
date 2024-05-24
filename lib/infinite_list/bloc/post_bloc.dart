// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:bloc_state_management_projects/infinite_list/model/post_model.dart';
import 'package:http/http.dart' as http;

import 'package:bloc_state_management_projects/infinite_list/bloc/post_event.dart';
import 'package:bloc_state_management_projects/infinite_list/bloc/post_state.dart';
import 'package:stream_transform/stream_transform.dart';

const throttleDuration = Duration(milliseconds: 100);
const _postLimit = 20;

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (event, mapper) {
    return droppable<E>().call(event.throttle(duration), mapper);
  };
}

class PostBloc extends Bloc<PostEvent, PostState> {
  final http.Client httpClient;
  PostBloc({
    required this.httpClient,
  }) : super(const PostState()) {
    on<PostFetched>(onPostFetched,
        transformer: throttleDroppable(throttleDuration));
  }

  Future<void> onPostFetched(PostEvent event, Emitter<PostState> emit) async {
    log('hasReachedMax begining: ${state.hasReachedMax}');
    if (state.hasReachedMax) return;

    try {
      if (state.status == PostStatus.initial) {
        final posts = await _fetchPosts();
        return emit(
          state.copyWith(
            status: PostStatus.success,
            posts: posts,
            hasReachedMax: false,
          ),
        );
      }

      final posts = await _fetchPosts(state.posts.length);
      log('hasReachedMax: ${state.hasReachedMax}');
      emit(posts.isEmpty
          ? state.copyWith(
              hasReachedMax: true,
            )
          : state.copyWith(
              status: PostStatus.success,
              posts: List.of(state.posts)..addAll(posts),
              hasReachedMax: false,
            ));
    } catch (e) {
      emit(state.copyWith(
        status: PostStatus.failure,
      ));
    }
  }

  Future _fetchPosts([int startIndex = 0]) async {
    final response = await httpClient.get(
      Uri.https('jsonplaceholder.typicode.com', '/posts',
          <String, String>{'_start': '$startIndex', '_limit': '$_postLimit'}),
    );

    if (response.statusCode == 200) {
      final body = json.decode(response.body) as List;
      return body.map((dynamic json) {
        final map = json as Map<String, dynamic>;
        return Post(
          id: map["id"] as int,
          title: map["title"] as String,
          body: map["body"] as String,
        );
      }).toList();
    }
    throw Exception('error fetching posts');
  }
}

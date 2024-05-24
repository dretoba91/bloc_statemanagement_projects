

import 'package:bloc_state_management_projects/infinite_list/bloc/post_bloc.dart';
import 'package:bloc_state_management_projects/infinite_list/bloc/post_event.dart';
import 'package:bloc_state_management_projects/infinite_list/bloc/post_state.dart';
import 'package:bloc_state_management_projects/infinite_list/widgets/bottom_loader.dart';
import 'package:bloc_state_management_projects/infinite_list/widgets/post_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostList extends StatefulWidget {
  const PostList({super.key});

  @override
  State<PostList> createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  bool get _isBottom {    
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  void _onScroll() {    
    if (_isBottom) context.read<PostBloc>().add(PostFetched());
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostBloc, PostState>(
        builder: (BuildContext context, state) {
      switch (state.status) {
        case PostStatus.failure:
          return const Center(
            child: Text(
              'failed to fetch post',
            ),
          );
        case PostStatus.initial:
          return const Center(
            child: CircularProgressIndicator(),
          );
        case PostStatus.success:
          if (state.posts.isEmpty) {
            return const Center(
              child: Text(
                'no posts.. 🤦‍♂️',
              ),
            );
          }
          return ListView.builder(
            controller: _scrollController,
              itemCount: state.hasReachedMax
                  ? state.posts.length
                  : state.posts.length + 1,
              itemBuilder: (context, int index) {
                return index >= state.posts.length
                    ? const BottomLoader()
                    : PostListItem(
                        post: state.posts[index],
                      );
              });
      }
    });
  }
}

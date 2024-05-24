import 'package:bloc_state_management_projects/infinite_list/model/post_model.dart';
import 'package:flutter/material.dart';

class PostListItem  extends StatelessWidget {
  const PostListItem ({super.key, required this.post});
  final Post post;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Material(
      child: ListTile(
        leading: Text(
          '${post.id}',
          style: textTheme.bodySmall,
        ),
        title: Text(
          post.title,
          style: textTheme.bodyLarge,
        ),
        isThreeLine: true,
        subtitle: Text(
          post.body,
        ),
        dense: true,
      ),
    );
  }
}
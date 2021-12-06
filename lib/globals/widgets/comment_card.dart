import 'package:flutter/material.dart';
import 'package:hey_istanbullum/model/comment_model.dart';

class CommentCard extends StatelessWidget {
  CommentModel comment;
  CommentCard(this.comment);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text('Sule Aktas'),
        subtitle: Text(comment.description),
        trailing: Text('21.07\n19:23'),
      ),
    );
  }
}

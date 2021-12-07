import 'package:flutter/material.dart';
import 'package:hey_istanbullum/model/comment_model.dart';

class CommentCard extends StatelessWidget {
  CommentModel comment;
  CommentCard(this.comment);
  @override
  Widget build(BuildContext context) {
    String date = comment.created.split('T').first;
    String time = comment.created.split('T').last;
    Map commentTime = {
      'day': date.split('-')[1],
      'mounth': date.split('-')[2],
      'hour': time.split(':')[0],
      'minute': time.split(':')[1]
    };
    return Card(
      child: ListTile(
        title: Text(comment.user.nickname),
        subtitle: Text(comment.description),
        trailing: Text(
            '${commentTime['day']}.${commentTime['mounth']}\n${commentTime['hour']}:${commentTime['minute']}'),
      ),
    );
  }
}

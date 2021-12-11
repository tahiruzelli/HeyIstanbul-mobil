import 'package:flutter/material.dart';
import 'package:hey_istanbullum/model/comment_model.dart';

class CommentCard extends StatelessWidget {
  CommentModel comment;
  bool isProfile;
  CommentCard(this.comment, this.isProfile);
  @override
  Widget build(BuildContext context) {
    String date = comment.created.split('T').first;
    String time = comment.created.split('T').last;
    Map commentTime = {
      'day': date.split('-')[1],
      'mounth': date.split('-')[2],
      'hour': int.parse(time.split(':')[0]) + 3,
      'minute': time.split(':')[1]
    };
    return Card(
      child: ListTile(
        title: isProfile ? Container() : Text(comment.user.nickname),
        subtitle: Text(comment.description),
        trailing: Text(
            '${commentTime['day']}.${commentTime['mounth']}\n${commentTime['hour']}:${commentTime['minute']}'),
      ),
    );
  }
}

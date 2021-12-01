import 'package:flutter/material.dart';
import 'package:hey_istanbullum/views/favorites/widgets/favorite_card.dart';

class Favorities extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return FavoriteCard();
        },
      ),
    );
  }
}

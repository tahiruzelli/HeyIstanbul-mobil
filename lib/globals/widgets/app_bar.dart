import 'package:flutter/material.dart';

AppBar myAppBar(String title, {bool isFavorite = false, void func}) {
  return AppBar(
    centerTitle: true,
    backgroundColor: Colors.black,
    title: Text(title),
    actions: [
      isFavorite
          ? IconButton(
              onPressed: () {
                func;
              },
              icon: const Icon(Icons.favorite_border),
            )
          : Container(),
    ],
  );
}

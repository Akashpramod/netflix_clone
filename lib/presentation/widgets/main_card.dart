import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constant.dart';

class MainCard extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: 150,
      height: 250,
      decoration: BoxDecoration(
        borderRadius: kRadius10,
        image: const DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
              'https://upload.wikimedia.org/wikipedia/commons/0/0b/Netflix-avatar.png'),
        ),
    ),
);
}
}

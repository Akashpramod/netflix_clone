import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colours/colors.dart';
import 'package:netflix_clone/core/constant.dart';

class NumberCard extends StatelessWidget {
  const NumberCard({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            const SizedBox(
              width: 40,
              height: 150,
            ),
            Container(
              width: 130,
              height: 250,
              decoration: BoxDecoration(
                borderRadius: kRadius10,
                image: const DecorationImage(
                  image: NetworkImage(
                      'https://th.bing.com/th/id/OIP.4LghctcGIXbP1oIyYijbAgHaJQ?rs=1&pid=ImgDetMain'),
                ),
              ),
            ),
          ],
        ),
        Positioned(
            left: 13,
            bottom: 5,
            child: BorderedText(
              strokeWidth: 10.0,
              strokeColor: kwhiteColor,
              child: Text(
                '${index + 1}',
                style: const TextStyle(
                    fontSize: 100,
                    color: kblackColor,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none,
                    decorationColor: Colors.black),
              ),
            ))
      ],
    );
  }
}
import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colours/colors.dart';
import 'package:netflix_clone/core/constant.dart';
import 'package:netflix_clone/presentation/new_and_hot/widget/video_widget.dart';
import 'package:netflix_clone/presentation/widgets/custome_button_widget.dart';


class EveryonesWatchingWidget extends StatelessWidget {
  const EveryonesWatchingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          kheight,
          Text(
            'Friends',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          kheight,
          Text(
            'This hit sitcom follows the merry misadventures of six 20-something pals as they navigate the pitfalls of work,life and love in 1990s Manhattan.',
            style: TextStyle(color: kgrey),
          ),
          kheight80,
          VideoWidget(),
          kheight,
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomButtonWidget(
                icon: Icons.send,
                title: 'Share',
                textSize: 12,
              ),
              kwidth,
              CustomButtonWidget(
                icon: Icons.add,
                title: 'My List',
                textSize: 12,
              ),
              kwidth,
              CustomButtonWidget(
                icon: Icons.play_arrow,
                title: 'Play',
                textSize: 12,
              ),
              kwidth,
            ],
          )
        ],
      ),
    );
  }
}
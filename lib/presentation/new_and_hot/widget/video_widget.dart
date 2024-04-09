import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colours/colors.dart';


class VideoWidget extends StatelessWidget {
  const VideoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const SizedBox(
          width: double.infinity,
          height: 200,
          child: Image(
            image: NetworkImage(
              'https://occ-0-2794-2219.1.nflxso.net/dnm/api/v6/Qs00mKCpRvrkl3HZAN5KwEL1kpE/AAAABX5FTygZ-n1j3bA0OuJDOOo4EXUIC02hUnXN5iKwZkBErq2myyke7rER7fekIPuLLeB1du1qNVddtF9wgDLvzBHHvpsW854zFzqyEW6nFD5KtUc6d2dXag6lT85Ns4SUEF_TYw.jpg?r=284'
            ),
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child: CircleAvatar(
            radius: 22,
            backgroundColor: kblackColor.withOpacity(0.5),
            child: IconButton(
              icon: const Icon(Icons.volume_off),
              onPressed: () {},
            ),
          ),
        )
      ],
    );
  }
}
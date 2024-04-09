import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone/core/colours/colors.dart';
import 'package:netflix_clone/core/constant.dart';
import 'package:netflix_clone/presentation/new_and_hot/widget/video_widget.dart';
import 'package:netflix_clone/presentation/widgets/custome_button_widget.dart';


class ComingSoonWidget extends StatelessWidget {
  const ComingSoonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: Row(
        children: [
          const SizedBox(
            width: 50,
            height: 520,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'FEB',
                  style: TextStyle(fontSize: 16, color: kgrey),
                ),
                Text(
                  '11',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 5),
                )
              ],
            ),
          ),
          SizedBox(
            width: size.width - 50,
            height: 500,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const VideoWidget(),
                kheight20,
                Row(
                  children: [
                    Image.asset(
                      'assets/bg-tall-girl.png',
                      width: 150,
                      color: kwhiteColor,
                    ),
                    const Spacer(),
                    const CustomButtonWidget(
                        icon: Icons.notifications_none,
                        textSize: 12,
                        title: 'Remind Me'),
                    kwidth,
                    const CustomButtonWidget(
                        textSize: 12, icon: Icons.info_outline, title: 'Info'),
                    kwidth,
                  ],
                ),
                kheight,
                const Text(
                  'Coming on Friday',
                  style: TextStyle(fontSize: 17),
                ),
                kheight,
                Text(
                  'Tall Girl 2',
                  style: GoogleFonts.hammersmithOne(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                kheight,
                const Text(
                  'Landing the lead in the school musical is a dream come true for jodi, until the pressure sends her confidence - and her relationship - into a tailspain.',
                  style: TextStyle(color: kgrey),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
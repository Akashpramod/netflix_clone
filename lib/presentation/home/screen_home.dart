

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix_clone/core/colours/colors.dart';
import 'package:netflix_clone/core/constant.dart';
import 'package:netflix_clone/presentation/home/number_card.dart';
import 'package:netflix_clone/presentation/widgets/custome_button_widget.dart';
import 'package:netflix_clone/presentation/widgets/main_title.dart';
import 'package:netflix_clone/presentation/widgets/main_title_card.dart';

ValueNotifier<bool>scrollNotifier = ValueNotifier(true);
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: scrollNotifier,
        builder: (BuildContext context,index, _){
        return NotificationListener<UserScrollNotification>(
        onNotification: (notification){
          final ScrollDirection direction = notification.direction;
          print(direction);
          if(direction == ScrollDirection.reverse){
            scrollNotifier.value = false;
          }else if (direction == ScrollDirection.forward){
            scrollNotifier.value = true;
          }
          return true;
        },
        child: Stack(
          children: [
            ListView(
              children: [
                Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 600,
                      decoration: const BoxDecoration(
                          image: DecorationImage(image: NetworkImage(kmainImage))),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const CustomButtonWidget(
                              title: 'My List',
                              icon: Icons.add,
                            ),
                            _playButton(),
                            const CustomButtonWidget(icon: Icons.info, title: 'Info')
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                const MainTitleCard(
                  title: "Relesed in the past year",
                ),
                kheight,
                const MainTitleCard(
                  title: "Tranding",
                ),
                kheight,
                const NumberTitleCard(),
                kheight,
                const MainTitleCard(
                  title: "Tens Dramas",
                ),
                kheight,
                const MainTitleCard(
                  title: "SouthIndian Cinima",
                ),
                kheight,
              ],
            ),
          scrollNotifier.value == true?  AnimatedContainer(
            duration: const Duration(milliseconds: 1000),
              width: double.infinity,
              height: 90,
              color: Colors.black.withOpacity(0.3),
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.network('https://pngimg.com/uploads/netflix/netflix_PNG22.png',
                      width: 50, height: 50,),
                      Spacer(),
                      const Icon(Icons.cast,
                      color: Colors.white,
                      size: 30,),
                      kwidth,
                      Container(
                        width: 30,
                       height: 30,
                       child: Image.network('https://upload.wikimedia.org/wikipedia/commons/0/0b/Netflix-avatar.png',fit: BoxFit.cover,),
                      
                      ),
                      kwidth
                    
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [

                      Text("TV Shows" ,style: khomeTitleText),
                      Text('Movies',style: khomeTitleText),
                      Text('Catogries',style: khomeTitleText)
                    ],
                  )
                ]),
            ):
            kheight,
          ],
        ),

      );
      },
      )
    );
  }

  TextButton _playButton() {
    return TextButton.icon(
        onPressed: () {},
        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(kwhiteColor)),
        icon: const Icon(
          Icons.play_arrow,
          size: 25,
        ),
        label: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            'Play',
            style: TextStyle(fontSize: 20, color: kblackColor),
          ),
        ));
  }
}

class NumberTitleCard extends StatelessWidget {
  const NumberTitleCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const MainTitle(title: 'Top 10 Tv show In India Today'),
        kheight,
        LimitedBox(
          maxHeight: 200,
          child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(
                  10,
                  (index) => NumberCard(
                        index: index,
                      ))),
        )
      ],
    );
  }
}

class MainCard extends StatelessWidget {
  const MainCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: kRadius10,
      child: Container(
        width: 150,
        height: 250,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                'https://www.filmibeat.com/fanimg/baahubali-photos-images-32341.jpg'),
          ),
        ),
      ),
    );
  }
}
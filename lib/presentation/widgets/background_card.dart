// import 'package:flutter/material.dart';
// import 'package:netflix_clone/core/colours/colors.dart';
// import 'package:netflix_clone/presentation/widgets/custome_button_widget.dart';

// class BackgroundCard extends StatelessWidget {
//   const BackgroundCard({super.key});

//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: 
//          ListView(
//             children:  [
//               Stack(
//                 children: [
//                   Container(
//                     width: double.infinity,
//                     height: 600,
//                     decoration: const BoxDecoration(
//                       image: DecorationImage(image: NetworkImage('https://th.bing.com/th/id/OIP.XBmcgoV1_7KJFKo_1Yb2WwAAAA?rs=1&pid=ImgDetMain'))
//                     ),
//                   ),
//                   Positioned(
//                     bottom: 0,
//                     left: 0,
//                     right: 0,
//                     child: Padding(
//                       padding: const EdgeInsets.only(bottom: 10),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           Custom_Button_widget(
//                             title: 'My List',
//                             icon: Icons.add,
//                           ),
//                           _PlayButton(),
//                           const Custom_Button_widget(icon: Icons.info, 
//                           title: 'Info')
//                         ],
//                       ),
//                     ),
//                   )
//                 ],
//               )
//             ]
//          )
//     );
//   }
// }
//  TextButton _PlayButton() {
//     return TextButton.icon(
//                         onPressed: (){},
//                       style: ButtonStyle(
//                         backgroundColor: MaterialStateProperty.all(kwhiteColor)),
//                        icon:const Icon(Icons.play_arrow,size: 25,
//                        ), label: Padding(
//                          padding: const EdgeInsets.symmetric(horizontal: 10),
//                          child: Text('Play',style: TextStyle(fontSize: 20,
//                          color: kblackColor),
//                          ),
//                        )
//                        );
//   }


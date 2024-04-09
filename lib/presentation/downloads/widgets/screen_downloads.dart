


  
// import 'dart:math';
// import 'dart:ui';

// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:netflix_clone/core/colours/colors.dart';
// import 'package:netflix_clone/presentation/widgets/app_bar_vidget.dart';

// class ScreenDownloads extends StatelessWidget {
//    ScreenDownloads({Key? key}) : super(key: key);
//  final widgetlist= [
//           const section1(),
//           section2(),
//           const section3()
//         ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//           appBar:   PreferredSize(
//       preferredSize: Size.fromHeight(50),
//       child: AppBarWidget(title: "Downloads")),
     
//       body: ListView.separated(
//         padding: const EdgeInsets.all(10),
//         itemBuilder:(context, index) {
//           return widgetlist[index];
//         }, 
//         itemCount:widgetlist.length ,
//         separatorBuilder:(context, index) {
//           return const SizedBox(height: 10,);
//         }, 
//       ),
//     );
//   }
// }

// class _smartdownloads extends StatelessWidget {
//   const _smartdownloads({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return const  Row(
//         children: [
//           Icon(Icons.settings,color: kwhiteColor,),
//           SizedBox(width: 8),
//           Text("smartDownload",style: TextStyle(fontSize: 20),),
//         ],
//     );
//   }
// }

// class DownloadsImageWidgets extends StatelessWidget {
//   const DownloadsImageWidgets({
//     Key? key,
//     required this.imageUrl,
//     this.angle = 0,
//     this.radius=10,
//     required this.margin,
//      required this. size, 
//   }) : super(key: key);

//   final double angle;
//   final String imageUrl;
//   final EdgeInsets margin;
//   final Size size;
//   final double radius;

//   @override
//   Widget build(BuildContext context) {
//     // final Size size = MediaQuery.of(context).size;
//     return Transform.rotate(
//       angle: angle * pi / 180,
//       child: Container(
//         margin: margin,
//         width: size.width ,
//         height: size.height,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(radius),
//           image: DecorationImage(
//             image: NetworkImage(imageUrl),
//             fit: BoxFit.cover,
//           ),
//         ),
//       ),
//     );
//   }
// }
// class section1 extends StatelessWidget {
//   const section1({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return  const _smartdownloads();
//   }
// }
// class section2 extends StatelessWidget {
//    section2({super.key});
// final List<String> imageList = [
//     'https://media.themoviedb.org/t/p/w220_and_h330_face/rULWuutDcN5NvtiZi4FRPzRYWSh.jpg',
//     'https://media.themoviedb.org/t/p/w220_and_h330_face/fiVW06jE7z9YnO4trhaMEdclSiC.jpg',
//     'https://media.themoviedb.org/t/p/w220_and_h330_face/vZloFAK7NmvMGKE7VkF5UHaz0I.jpg',

//   ];

//   @override
//   Widget build(BuildContext context) {
//      final Size size = MediaQuery.of(context).size;
//     return  Column(
//       children: [
//          const Text(
//               "Introducing downloads for You",
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 color: kwhiteColor,fontSize: 24,
//                 fontWeight: FontWeight.bold
//               ),
//               ),
//                const Text("you will download a personalised selection of \n movies and shows for you,so there is \n always something to whatch on ypur \n divice",
//             textAlign: TextAlign.center,
//     style: TextStyle(
//      color: Colors.grey,
//      fontSize: 16,
//     ),),
    
//           SizedBox(
//             width: size.width,
//             height: size.width * 1.1,
//             child: Stack(
//               alignment: Alignment.center,
//               children: [
//                 CircleAvatar(
//                   radius: size.width * 0.4,
//                   backgroundColor: Colors.grey.withOpacity(0.5),
//                 ),
//                 DownloadsImageWidgets(
//                   imageUrl: imageList[0],
//                   margin: const EdgeInsets.only(left: 130,bottom: 50),
//                   angle: 20,
//                   size:Size(size.width*0.4,size.width*0.58),
//                 ),
//                 DownloadsImageWidgets(
//                   imageUrl: imageList[1],
//                   margin: const EdgeInsets.only(right: 130,bottom: 50),
//                   angle: -20,
//                 size:Size(size.width*0.4,size.width*0.58),

//                 ),
//                 DownloadsImageWidgets(
//                   imageUrl: imageList[2],
//                   margin: const EdgeInsets.only(bottom: 10),
//                   size:Size(size.width*0.5,size.width*0.65),
//                   radius: 5,
//                 ),
//               ],
//             ),
//           ),
//       ],
//     );
//   }
// }



// class section3 extends StatelessWidget {
//   const section3({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return  Column(
//       children: [
//     SizedBox(
//       width: double.infinity,
//       child:  MaterialButton(
//                color: kButtonColorBlue,
               
//                 onPressed: () {},
//                 child: const Padding(
//                   padding: EdgeInsets.symmetric(vertical: 1),
//                   child: Text(
//                     "set up",
//                     style: TextStyle(
//                       color: kButtonColorWhite,
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ),
//     ),
          
//           MaterialButton(
//             color: kwhiteColor,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(5),
//             ),
//             onPressed: () {},
//             child: const Text(
//               "see what you can download",
//               style: TextStyle(
//                 color:Colors.black,
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//      ],
// );
// }
// }
import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:netflix_clone/core/colours/colors.dart';
import 'package:netflix_clone/core/constant.dart';
import 'package:netflix_clone/infrastructure/api_key.dart';
import 'package:netflix_clone/presentation/widgets/app_bar_vidget.dart';

class ScreenDownloads extends StatefulWidget {
  const ScreenDownloads({super.key});

  @override
  State<ScreenDownloads> createState() => _ScreenDownloadsState();
}

class _ScreenDownloadsState extends State<ScreenDownloads> {
   @override
  void initState() {
    super.initState();
    fetchMovieImages(); 
  }
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<String>>(
      valueListenable: movieImagesNotifier,
      builder: (context, movieImages, _) {
        return SafeArea(
          child: Scaffold(
            appBar:  PreferredSize(
              preferredSize: Size.fromHeight(50),
              child: AppBarWidget(
                title: 'Downloads',
              ),
            ),
            body: ListView.separated(
              padding: const EdgeInsets.all(10.0),
              itemBuilder: (context, index) {
                if (index == 0) {
                  return const SmartDownloads();
                } else if (index == 1) {
                  return Section2(movieImages: movieImages);
                } else {
                  return const Section3();
                }
              },
              separatorBuilder: (context, index) => const SizedBox(
                height: 25,
              ),
              itemCount: 3,
            ),
          ),
        );
      },
    );
  }
}

class Section2 extends StatelessWidget {
  final List<String> movieImages;

  const Section2({super.key, required this.movieImages});

  

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        const Text(
          'Introducing Downloads for you',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 23.5, fontWeight: FontWeight.bold),
        ),
        kheight,
        const Text(
          'We\'ll download a personalised selection of movies and shows for you, so there\'s always something to watch on your device',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18, color: kgrey),
        ),
        kheight,
        SizedBox(
          width: size.width,
          height: size.width,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Center(
                child: CircleAvatar(
                  radius: size.width * 0.4,
                  backgroundColor: kgrey.withOpacity(0.5),
                ),
              ),
              for (int i = 0; i < min(3, movieImages.length); i++)
                DownloadsImageWidget(
                  imageList: movieImages[i],
                  margin: EdgeInsets.only(
                    left: i == 0 ? 180.0 : 0,
                    right: i == 1 ? 180.0 : 0,
                    top: 40,
                  ),
                  angle: i == 0 ? 15 : (i == 1 ? -15 : 0),
                  size: Size(size.width * 0.35, size.width * 0.55),
                ),
            ],
          ),
        ),
      ],
    );
  }
}

class Section3 extends StatelessWidget {
  const Section3({super.key});

  

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: MaterialButton(
            color: kButtonColorBlue,
            onPressed: () {},
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            child: const Text(
              'Set up',
              style: TextStyle(
                color: kwhiteColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: MaterialButton(
            color: kwhiteColor,
            onPressed: () {},
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            child: const Text(
              'See what you can download',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class SmartDownloads extends StatelessWidget {
  const SmartDownloads({super.key});

  

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Icon(
          Icons.settings,
          color: kwhiteColor,
        ),
        kwidth,
        Text('Smart downloads'),
      ],
    );
  }
}

class DownloadsImageWidget extends StatelessWidget {
  final double angle;
  final String imageList;
  final EdgeInsets margin;
  final Size size;

  const DownloadsImageWidget({

    super.key,
    required this.imageList,
    this.angle = 0,
    required this.margin,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: Transform.rotate(
        angle: angle * pi / 180,
        child: Container(
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            image: DecorationImage(
              image: NetworkImage(imageList),
              fit: BoxFit.cover,
            ),
            color: kblackColor,
          ),
        ),
      ),
    );
  }
}


final ValueNotifier<List<String>> movieImagesNotifier = ValueNotifier([]);

Future<void> fetchMovieImages() async {
  const apiKey = apikey;
  final response = await http.get(
    Uri.parse(
      'https://api.themoviedb.org/3/movie/popular?api_key=$apiKey',
    ),
  );

  if (response.statusCode == 200) {
    final Map<String, dynamic> data = json.decode(response.body);
    final List<dynamic> results = data['results'];
    final List<String> images = results
        .map<String>((result) =>
            'https://image.tmdb.org/t/p/w500/${result['poster_path']}')
        .toList();
    movieImagesNotifier.value = images;
  } else {
    throw Exception('Failed to load movies');
  }
}
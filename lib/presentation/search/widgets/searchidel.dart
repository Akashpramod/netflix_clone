// import 'package:flutter/material.dart';
// import 'package:netflix_clone/core/colours/colors.dart';
// import 'package:netflix_clone/core/constant.dart';
// import 'package:netflix_clone/presentation/search/widgets/search_Title.dart';

// const imageUrl =
//     'https://th.bing.com/th/id/OIP.nPAKvH8i2Iiiqd-_4EgHfwHaEK?rs=1&pid=ImgDetMain';

// class SearchIdleWidget extends StatelessWidget {
//   const SearchIdleWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const SearchTitle(
//           title: 'Top Searches',
//         ),
//         kheight,
//         Expanded(
//           child: ListView.separated(
//               shrinkWrap: true,
//               itemBuilder: (context, index) => const TopSearchItemTile(),
//               separatorBuilder: (context, index) => kheight20,
//               itemCount: 10),
//         )
//       ],
//     );
//   }
// }

// class TopSearchItemTile extends StatelessWidget {
//   const TopSearchItemTile({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     return Row(
//       children: [
//         Container(
//           width: screenWidth * 0.35,
//           height: 65,
//           decoration: const BoxDecoration(
//               image: DecorationImage(
//                   image: NetworkImage(imageUrl), fit: BoxFit.cover)),
//         ),
//         kwidth,
//         const Expanded(
//             child: Text(
//           'Movie Name',
//           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//         )),
//         const Icon(
//           Icons.play_circle_outline,
//           color: kwhiteColor,
//           size: 35,
//         )
//       ],
//     );
//   }
// }
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:netflix_clone/core/colours/colors.dart';
import 'package:netflix_clone/core/constant.dart';
import 'package:netflix_clone/presentation/search/widgets/search_title.dart';

class SearchIdleWidget extends StatefulWidget {
  const SearchIdleWidget({super.key});

  @override
  SearchIdleWidgetState createState() => SearchIdleWidgetState();
}

class SearchIdleWidgetState extends State<SearchIdleWidget> {
  List<String> movieNames = [];
  List<String> movieImageUrls = [];

  @override
  void initState() {
    super.initState();
    fetchMovieData();
  }

  Future<void> fetchMovieData() async {
    try {
      final response = await http.get(
        Uri.parse(
            'https://api.themoviedb.org/3/movie/popular?api_key=8da54ac86429d4c0b1982869b4569264'),
      );

      if (response.statusCode == 200) {
        final List<dynamic> movies = json.decode(response.body)['results'];
        final List<String> names =
            movies.map<String>((movie) => movie['title']).toList();
        final List<String> imageUrls = movies
            .map<String>((movie) =>
                'https://image.tmdb.org/t/p/w500/${movie['poster_path']}')
            .toList();
        setState(() {
          movieNames = names;
          movieImageUrls = imageUrls;
        });
      } else {
        throw Exception('Failed to load movie data');
      }
    } catch (error) {
      Text('Error fetching movie data: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTitle(
          title: 'Top Searches',
        ),
        kheight,
        Expanded(
          child: ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) => TopSearchItemTile(
              movieName:
                  movieNames.isNotEmpty ? movieNames[index] : 'Loading...',
              imageUrl: movieImageUrls.isNotEmpty ? movieImageUrls[index] : '',
            ),
            separatorBuilder: (context, index) => kheight,
            itemCount: movieNames.length,
          ),
        ),
      ],
    );
  }
}

class TopSearchItemTile extends StatelessWidget {
  final String movieName;
  final String imageUrl;

  const TopSearchItemTile({
    super.key,
    required this.movieName,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: screenWidth * 0.35,
          height: 65,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        kwidth,
        Expanded(
          child: Text(
            movieName,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        const Icon(
          Icons.play_circle_outline,
          color: kwhiteColor,
          size: 35,
        ),
      ],
    );
  }
}
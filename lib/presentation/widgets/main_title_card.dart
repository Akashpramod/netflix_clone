import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:netflix_clone/core/constant.dart';
import 'package:netflix_clone/presentation/widgets/main_title.dart';

class MovieCard extends StatelessWidget {
  final String imageUrl;

  const MovieCard({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8.0),
      width: 150,
      height: 250,
      child: Image.network(
        imageUrl,
        fit: BoxFit.cover,
        width: 150,
        height: 250,
      ),
    );
  }
}

class MainTitleCard extends StatefulWidget {
  const MainTitleCard({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MainTitleCard> createState() => _MainTitleCardState();
}

class _MainTitleCardState extends State<MainTitleCard> {
  List<String> movieImages = [];

  @override
  void initState() {
    super.initState();
    fetchMovieImages();
  }

  Future<void> fetchMovieImages() async {
    const apiKey = '8da54ac86429d4c0b1982869b4569264';
    final response = await http.get(
      Uri.parse('https://api.themoviedb.org/3/movie/popular?api_key=$apiKey'),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> results = data['results'];
      final List<String> images = results
          .map<String>((result) =>
              'https://image.tmdb.org/t/p/w500/${result['poster_path']}')
          .toList();
      setState(() {
        movieImages = images;
      });
    } else {
      throw Exception('Failed to load movie images');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MainTitle(title: widget.title),
          kheight,
          LimitedBox(
            maxHeight: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: movieImages.length,
              itemBuilder: (context, index) {
                return MovieCard(imageUrl: movieImages[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}


import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:netflix_clone/infrastructure/api_key.dart';

class VideoListItemPage extends StatelessWidget {
  final int index;

  const VideoListItemPage({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FutureBuilder<String>(
              future: fetchMovieImage(index),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  // Display a loading indicator while fetching data
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  // Display an error message if fetching data fails
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                } else {
                  // Display the movie image if fetching data succeeds
                  return Image.network(
                    snapshot.data!,
                    fit: BoxFit.cover,
                  );
                }
              },
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.black.withOpacity(0.5),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.volume_off),
                    iconSize: 30,
                    color: Colors.white,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      ),
                      VideoActionsWidget(icon: Icons.emoji_emotions, title: "lol"),
                      VideoActionsWidget(icon: Icons.add, title: "Add"),
                      VideoActionsWidget(icon: Icons.share, title: "share"),
                      VideoActionsWidget(icon: Icons.play_arrow, title: "play"),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  Future<String> fetchMovieImage(int index) async {
    const apiKey = apikey;
    final response = await http.get(
      Uri.parse('https://api.themoviedb.org/3/movie/popular?api_key=$apiKey'),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> results = data['results'];
      if (index < results.length) {
        final posterPath = results[index]['poster_path'];
        if (posterPath != null && posterPath.isNotEmpty) {
          final imageUrl = 'https://image.tmdb.org/t/p/w600_and_h900_bestv2/$posterPath';
          return imageUrl;
        } else {
          throw Exception('Poster path is null or empty');
        }
      } else {
        throw Exception('Movie not found at index $index');
      }
    } else {
      throw Exception('Failed to load movie images: ${response.statusCode}');
    }
  }
}

class VideoActionsWidget extends StatelessWidget {
  final IconData icon;
  final String title;

  const VideoActionsWidget({Key? key, required this.icon, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: Colors.white,
          size: 35,
        ),
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
        )
      ],
    );
  }
}

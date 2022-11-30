import 'package:coolmovies/custom_appbar.dart';
import 'package:coolmovies/details_page.dart';
import 'package:coolmovies/movie_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.movies});

  final Movie? movies;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var item = widget.movies?.allMovies?.nodes;
    return Scaffold(
        backgroundColor: Colors.grey[600],
        appBar: CustomAppBar(title: 'Cool Movies'),
        body: ListView.builder(
          itemCount: item?.length,
          itemBuilder: (context, index) {
            return _buildItem(item, index);
          },
        ));
  }

  _buildItem(List<MovieNodes>? movieList, int index) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailsPage(movie: movieList?[index]),
            ));
      },
      child: Container(
        height: 220,
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, 2),
                  blurRadius: 8,
                  spreadRadius: 2,
                  color: Colors.grey[800]!)
            ]),
        child: Row(
          children: [
            Expanded(
              flex: 4,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(movieList?[index].imgUrl ?? ""),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              flex: 6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movieList?[index].title ?? '',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Text(
                    movieList?[index].releaseDate ?? '',
                    style: const TextStyle(
                      color: Colors.orangeAccent,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:coolmovies/custom_appbar.dart';
import 'package:coolmovies/movie_model.dart';
import 'package:coolmovies/review_model.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class DetailsPage extends StatefulWidget {
  DetailsPage({super.key, this.movie});
  MovieNodes? movie;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  Review? review;
  bool isLoading = true;

  @override
  initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      _getReviews();
    });
  }

  @override
  Widget build(BuildContext context) {
    var data = widget.movie;
    return Scaffold(
      backgroundColor: Colors.grey[600],
      appBar: CustomAppBar(title: data?.title ?? ''),
      body: SafeArea(
        child: Stack(
          children: [
            ListView(
              children: [
                Stack(
                  children: [
                    Container(
                      foregroundDecoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.transparent,
                            Color(0xff0e0f11),
                          ],
                          begin: Alignment(0, 0.3),
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      child: Container(
                          height: 400,
                          width: double.infinity,
                          child: Image.network(
                            data?.imgUrl ?? "",
                            fit: BoxFit.fill,
                          )),
                    ),
                  ],
                ),
              ],
            ),
            Positioned.fill(
              top: 300,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Text(
                        data?.title ?? 'Movie title',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        '',
                        style: const TextStyle(
                          color: Colors.white60,
                          fontSize: 14,
                          letterSpacing: 0.8,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Release date: ${data?.releaseDate ?? ''}',
                            style: const TextStyle(
                              color: Colors.orangeAccent,
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.yellowAccent,
                                size: 20,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                '/ 10',
                                style: const TextStyle(
                                  color: Colors.orangeAccent,
                                  fontSize: 16,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _getReviews() async {
    var client = GraphQLProvider.of(context).value;

    final QueryResult result = await client.query(QueryOptions(
      document: gql("""
          query AllMoviesReviews {
           allMovieReviews(filter: {movieId: {equalTo: "${widget.movie?.id}"}}) {
              nodes {
                body
                id
                movieId
                rating
                title
              }
            }
          }
        """),
    ));

    if (result.hasException) {
      print(result.exception.toString());
    }

    if (result.data != null) {
      review = Review.fromJson(result.data!);
      setState(() {
        isLoading = false;
      });
    }
  }
}

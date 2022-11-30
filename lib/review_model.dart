class Review {
  AllMovieReviews? allMovieReviews;

  Review({this.allMovieReviews});

  Review.fromJson(Map<String, dynamic> json) {
    allMovieReviews = json['allMovieReviews'] != null
        ? new AllMovieReviews.fromJson(json['allMovieReviews'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.allMovieReviews != null) {
      data['allMovieReviews'] = this.allMovieReviews!.toJson();
    }
    return data;
  }
}

class AllMovieReviews {
  List<Nodes>? nodes;

  AllMovieReviews({this.nodes});

  AllMovieReviews.fromJson(Map<String, dynamic> json) {
    if (json['nodes'] != null) {
      nodes = <Nodes>[];
      json['nodes'].forEach((v) {
        nodes!.add(new Nodes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.nodes != null) {
      data['nodes'] = this.nodes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Nodes {
  String? body;
  String? id;
  String? movieId;
  int? rating;
  String? title;

  Nodes({this.body, this.id, this.movieId, this.rating, this.title});

  Nodes.fromJson(Map<String, dynamic> json) {
    body = json['body'];
    id = json['id'];
    movieId = json['movieId'];
    rating = json['rating'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['body'] = this.body;
    data['id'] = this.id;
    data['movieId'] = this.movieId;
    data['rating'] = this.rating;
    data['title'] = this.title;
    return data;
  }
}

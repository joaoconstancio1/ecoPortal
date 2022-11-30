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
  String? userReviewerId;
  String? title;
  int? rating;
  String? body;
  String? id;
  String? movieId;

  Nodes(
      {this.userReviewerId,
      this.title,
      this.rating,
      this.body,
      this.id,
      this.movieId});

  Nodes.fromJson(Map<String, dynamic> json) {
    userReviewerId = json['userReviewerId'];
    title = json['title'];
    rating = json['rating'];
    body = json['body'];
    id = json['id'];
    movieId = json['movieId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userReviewerId'] = this.userReviewerId;
    data['title'] = this.title;
    data['rating'] = this.rating;
    data['body'] = this.body;
    data['id'] = this.id;
    data['movieId'] = this.movieId;
    return data;
  }
}

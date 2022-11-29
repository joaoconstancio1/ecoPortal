class Movie {
  AllMovies? allMovies;

  Movie({this.allMovies});

  Movie.fromJson(Map<String, dynamic> json) {
    allMovies = json['allMovies'] != null
        ? new AllMovies.fromJson(json['allMovies'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.allMovies != null) {
      data['allMovies'] = this.allMovies!.toJson();
    }
    return data;
  }
}

class AllMovies {
  List<Nodes>? nodes;

  AllMovies({this.nodes});

  AllMovies.fromJson(Map<String, dynamic> json) {
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
  String? id;
  String? imgUrl;
  String? movieDirectorId;
  String? title;
  String? userCreatorId;
  String? releaseDate;
  String? nodeId;

  Nodes(
      {this.id,
      this.imgUrl,
      this.movieDirectorId,
      this.title,
      this.userCreatorId,
      this.releaseDate,
      this.nodeId});

  Nodes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imgUrl = json['imgUrl'];
    movieDirectorId = json['movieDirectorId'];
    title = json['title'];
    userCreatorId = json['userCreatorId'];
    releaseDate = json['releaseDate'];
    nodeId = json['nodeId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['imgUrl'] = this.imgUrl;
    data['movieDirectorId'] = this.movieDirectorId;
    data['title'] = this.title;
    data['userCreatorId'] = this.userCreatorId;
    data['releaseDate'] = this.releaseDate;
    data['nodeId'] = this.nodeId;
    return data;
  }
}

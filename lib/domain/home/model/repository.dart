import 'package:github_stars/data/home/model/repository_api.dart';

class Repository {
  Repository({this.name, this.description, this.stars});

  factory Repository.fromApi(RepositoryApi api) {
    return Repository(
        name: api.name, description: api.description, stars: api.stars);
  }

  final String name;
  final String description;
  final int stars;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Repository &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          description == other.description &&
          stars == other.stars;

  @override
  int get hashCode => name.hashCode ^ description.hashCode ^ stars.hashCode;
}

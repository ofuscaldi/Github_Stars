class RepositoryApi {
  RepositoryApi({this.name, this.description, this.stars});

  factory RepositoryApi.fromJson(Map<String, dynamic> json) => RepositoryApi(
      name: json['name'] as String,
      description: json['description'] as String,
      stars: json['stargazers']['totalCount'] as int);

  final String name;
  final String description;
  final int stars;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RepositoryApi &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          description == other.description &&
          stars == other.stars;

  @override
  int get hashCode => name.hashCode ^ description.hashCode ^ stars.hashCode;
}

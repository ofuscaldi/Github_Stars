import 'package:github_stars/data/home/model/repo_api.dart';

class OwnerApi {
  OwnerApi(
      {this.login,
      this.email,
      this.url,
      this.avatarUrl,
      this.location,
      this.bio,
      this.starredRepos});

  factory OwnerApi.fromJson(Map<String, dynamic> json) => OwnerApi(
      login: json['login'] as String,
      email: json['email'] as String,
      url: json['url'] as String,
      avatarUrl: json['avatarUrl'] as String,
      location: json['location'] as String,
      bio: json['bio'] as String,
      starredRepos: (json['starredRepositories']['nodes'] as List)
          .map((dynamic e) =>
              e == null ? null : RepoApi.fromJson(e as Map<String, dynamic>))
          .toList());

  final String login;
  final String email;
  final String url;
  final String avatarUrl;
  final String location;
  final String bio;
  final List<RepoApi> starredRepos;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OwnerApi &&
          runtimeType == other.runtimeType &&
          login == other.login &&
          email == other.email &&
          url == other.url &&
          avatarUrl == other.avatarUrl &&
          location == other.location &&
          bio == other.bio &&
          starredRepos == other.starredRepos;

  @override
  int get hashCode =>
      login.hashCode ^
      email.hashCode ^
      url.hashCode ^
      avatarUrl.hashCode ^
      location.hashCode ^
      bio.hashCode ^
      starredRepos.hashCode;
}

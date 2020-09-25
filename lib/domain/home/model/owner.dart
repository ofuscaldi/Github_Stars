import 'package:flutter/foundation.dart';
import 'package:github_stars/domain/home/model/repo.dart';

class Owner {
  Owner({this.name, this.email, this.url, this.avatarUrl, this.location, this.bio,
    this.starredRepos});

  final String name;
  final String email;
  final String url;
  final String avatarUrl;
  final String location;
  final String bio;
  final List<Repo> starredRepos;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Owner &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          email == other.email &&
          url == other.url &&
          avatarUrl == other.avatarUrl &&
          location == other.location &&
          bio == other.bio &&
          listEquals(starredRepos, other.starredRepos);

  @override
  int get hashCode =>
      name.hashCode ^
      email.hashCode ^
      url.hashCode ^
      avatarUrl.hashCode ^
      location.hashCode ^
      bio.hashCode ^
      starredRepos.hashCode;
}
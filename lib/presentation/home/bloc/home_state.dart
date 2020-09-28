import 'package:flutter/material.dart';
import 'package:github_stars/domain/home/model/owner.dart';

abstract class HomeState {}

class HomeInitState extends HomeState {
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HomeInitState && runtimeType == other.runtimeType;

  @override
  int get hashCode => 0;
}

class HomeLoadingState extends HomeState {
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HomeLoadingState && runtimeType == other.runtimeType;

  @override
  int get hashCode => 0;
}

class HomeFailedState extends HomeState {
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HomeFailedState && runtimeType == other.runtimeType;

  @override
  int get hashCode => 0;
}

class ShowOwnerInfoState extends HomeState {
  ShowOwnerInfoState({@required this.owner});

  final Owner owner;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ShowOwnerInfoState &&
          runtimeType == other.runtimeType &&
          owner == other.owner;

  @override
  int get hashCode => owner.hashCode;
}

import 'package:flutter/cupertino.dart';

abstract class HomeEvent {}

class BuildHomeEvent extends HomeEvent {}

class SearchOwnerEvent extends HomeEvent {
  SearchOwnerEvent({@required this.owner});

  String owner;
}

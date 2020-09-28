import 'package:flutter/foundation.dart';
import 'package:github_stars/domain/home/model/owner.dart';

abstract class HomeRepository {
  Future<Owner> getOwner({@required String owner});
}

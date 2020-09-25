import 'package:github_stars/domain/home/model/owner.dart';

abstract class HomeRepository {

  Stream<Owner> getOwner();
}
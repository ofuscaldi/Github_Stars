import 'package:get_it/get_it.dart';
import 'package:github_stars/presentation/di/presentation_di.dart' as presentation_di;
import 'package:github_stars/domain/di/domain_di.dart' as domain_di;
import 'package:github_stars/data/di/data_di.dart' as data_di;

GetIt sl = GetIt.instance;

void setup(GetIt sl) {
  presentation_di.setup(sl);
  domain_di.setup(sl);
  data_di.setup(sl);
}
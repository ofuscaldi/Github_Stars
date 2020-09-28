import 'package:get_it/get_it.dart';
import 'package:github_stars/domain/home/contracts/home_repository.dart';
import 'package:github_stars/domain/home/use_cases/get_owner_use_case.dart';

void setup(GetIt sl) {
  sl.registerLazySingleton<GetOwnerUseCase>(
      () => GetOwnerUseCase(sl.get<HomeRepository>()));
}

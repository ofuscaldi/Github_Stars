import 'package:get_it/get_it.dart';
import 'package:github_stars/domain/home/use_cases/get_owner_use_case.dart';
import 'package:github_stars/presentation/home/home_bloc.dart';
import 'package:github_stars/presentation/home/navigation/home_navigator.dart';

void setup(GetIt sl) {
  sl.registerLazySingleton<HomeBloc>(() => HomeBloc(sl.get<GetOwnerUseCase>()));

  sl.registerLazySingleton<HomeNavigator>(() => HomeNavigator());
}
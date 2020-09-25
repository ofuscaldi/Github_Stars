import 'package:get_it/get_it.dart';
import 'package:github_stars/data/home/home_client.dart';
import 'package:github_stars/data/home/home_repository.dart';
import 'package:github_stars/data/infra/network_module.dart' as network_module;
import 'package:github_stars/domain/home/contracts/home_repository.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

void setup(GetIt sl) {
  sl.registerLazySingleton(() => network_module.provideGraphQLClient());

  sl.registerLazySingleton<HomeClient>(() => HomeClient(sl.get<GraphQLClient>()));

  sl.registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl(sl.get<HomeClient>()));
}
import 'package:flutter_test/flutter_test.dart';
import 'package:github_stars/core/di/service_locator.dart';
import 'package:github_stars/domain/home/use_cases/get_owner_use_case.dart';
import 'package:github_stars/domain/result/result.dart';
import 'package:github_stars/presentation/home/bloc/home_event.dart';
import 'package:github_stars/presentation/home/bloc/home_state.dart';
import 'package:github_stars/presentation/home/home_bloc.dart';
import 'package:mockito/mockito.dart';

import '../../domain/home/model/mock_valid_owner.dart';
import '../../parameters.dart';


class _MockGetOwnerUseCase extends Mock implements GetOwnerUseCase {}

void main() {
  GetOwnerUseCase _useCase;

  HomeBloc _bloc;

  setUp(() {
    setup(sl);

    _useCase = _MockGetOwnerUseCase();

    _bloc = HomeBloc(_useCase);
    resetMockitoState();

    sl.allowReassignment = true;
    sl.registerLazySingleton<GetOwnerUseCase>(() => _useCase);
  });

  test('Initial state of BLoC is correct', (){
    expect(_bloc.state, HomeInitState());
  });

  test('Result returning success properly', () {
    final owner = getValidOwner;
    when(_useCase.execute(owner: Parameters.owner))
        .thenAnswer((_) => Future.value(Result.success(data: owner)));
    
    expectLater(_bloc, emitsInOrder(<HomeState>[HomeLoadingState(), ShowOwnerInfoState(owner: owner)]));

    _bloc.add(SearchOwnerEvent(owner: Parameters.owner));
  });

  test('Result returning error properly', () {
    when(_useCase.execute(owner: Parameters.owner))
        .thenAnswer((_) => Future.value(Result.error()));

    expectLater(_bloc, emitsInOrder(<HomeState>[HomeLoadingState(), HomeFailedState()]));

    _bloc.add(SearchOwnerEvent(owner: Parameters.owner));
  });
}

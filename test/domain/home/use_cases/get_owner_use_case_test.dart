import 'package:flutter_test/flutter_test.dart';
import 'package:github_stars/domain/home/contracts/home_repository.dart';
import 'package:github_stars/domain/home/use_cases/get_owner_use_case.dart';
import 'package:github_stars/domain/result/result.dart';
import 'package:mockito/mockito.dart';

import '../../../parameters.dart';
import '../model/mock_valid_owner.dart';

class _MockHomeRepository extends Mock implements HomeRepository {}

void main() {
  HomeRepository _repository;
  GetOwnerUseCase _useCase;

  setUp(() {
    _repository = _MockHomeRepository();
    _useCase = GetOwnerUseCase(_repository);
  });

  test('Success return works', () async {
    final owner =  getValidOwner;
    final expected = Result.success(data: owner);

    when(_repository.getOwner(owner: anyNamed('owner')))
        .thenAnswer((_) => Future.value(owner));;

    expect(await _useCase.execute(owner: Parameters.owner), expected);
  });

  test('Error return works', () async {
    final exception = Exception();
    final expected = Result.error(exception: exception);

    when(_repository.getOwner(owner: anyNamed('owner')))
        .thenAnswer((_) => Future.error(exception));

    expect(await _useCase.execute(owner: Parameters.owner), expected);
  });
}

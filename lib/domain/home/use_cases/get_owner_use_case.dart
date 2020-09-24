import 'package:github_stars/domain/result/result.dart';

class GetOwnerUseCase {
  Stream<Result<bool>> execute() {
    return Stream.value(Result.success(data: true));
  }
}
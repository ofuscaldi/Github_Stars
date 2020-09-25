import 'package:github_stars/domain/home/model/owner.dart';
import 'package:github_stars/domain/result/result.dart';

class GetOwnerUseCase {
  Stream<Result<Owner>> execute() {
    return Stream.value(Result.success(
        data: Owner(
            name: 'Namerson',
            email: 'namerson@gmail.com',
            url: 'www.my-url.com',
            location: 'Brasil',
            bio: 'Any bio')));
  }
}

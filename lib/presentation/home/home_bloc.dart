import 'package:bloc/bloc.dart';
import 'package:github_stars/domain/home/model/owner.dart';
import 'package:github_stars/domain/home/use_cases/get_owner_use_case.dart';
import 'package:github_stars/domain/result/result.dart';
import 'package:github_stars/presentation/home/bloc/home_event.dart';
import 'package:github_stars/presentation/home/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(this._getOwnerUseCase) : super(HomeLoadedState());

  final GetOwnerUseCase _getOwnerUseCase;

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is SearchOwnerEvent) {
      print(event.owner);
      await for (final Result<Owner> result in _getOwnerUseCase.execute(owner: event.owner)) {
        if(result.succeeded()){
          final success = result as Success<Owner>;
          yield ShowOwnerInfoState(owner: success.data);
        } else {
          yield HomeFailedState();
        }
      }
    } else if (event is BuildHomeEvent) {
      yield HomeLoadedState();
    }
  }
}

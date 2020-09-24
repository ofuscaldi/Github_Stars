import 'package:bloc/bloc.dart';
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
      await for (final Result<bool> result in _getOwnerUseCase.execute()) {
        if(result.succeeded()){
          yield ShowOwnerInfoState();
        } else {
          yield HomeFailedState();
        }
      }
    } else if (event is BuildHomeEvent) {
      yield HomeLoadedState();
    }
  }
}

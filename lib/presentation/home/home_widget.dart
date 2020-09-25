import 'package:flutter/material.dart';
import 'package:github_stars/core/di/service_locator.dart';
import 'package:github_stars/presentation/home/bloc/home_event.dart';
import 'package:github_stars/presentation/home/bloc/home_state.dart';
import 'package:github_stars/presentation/home/home_bloc.dart';
import 'package:github_stars/presentation/home/owner_infos_widget.dart';
import 'package:github_stars/widgets/default_app_bar.dart';
import 'package:github_stars/widgets/loading_widget.dart';

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  HomeBloc _bloc;

  TextEditingController _ownerController = TextEditingController();

  @override
  void initState() {
    _bloc = sl.get<HomeBloc>();
    super.initState();
  }

  void initBloc() {
    _bloc.add(BuildHomeEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                    child: TextField(
                  controller: _ownerController,
                )),
                FlatButton(
                  child: Text('Search'),
                  onPressed: () {
                    _bloc.add(SearchOwnerEvent(owner: _ownerController.text));
                  },
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
          ),
          Expanded(
            child: StreamBuilder<HomeState>(
              initialData: HomeLoadedState(),
              stream: _bloc,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot is HomeFailedState) {
                  //TODO: Failed View
                  return Container();
                } else {
                  return buildLayout(snapshot.data);
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildLayout(HomeState state) {
    if (state is HomeLoadingState) {
      return LoadingWidget();
    } else if (state is ShowOwnerInfoState) {
      return OwnerInfosWidget(owner: state.owner,);
    }
    return Container(
      child: Center(child: Text('Enter the username in the field above')),
    );
  }
}

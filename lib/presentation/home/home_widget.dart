import 'package:flutter/material.dart';
import 'package:github_stars/core/di/service_locator.dart';
import 'package:github_stars/presentation/home/bloc/home_event.dart';
import 'package:github_stars/presentation/home/bloc/home_state.dart';
import 'package:github_stars/presentation/home/home_bloc.dart';
import 'package:github_stars/presentation/home/owner_infos_widget.dart';
import 'package:github_stars/widgets/default_app_bar.dart';
import 'package:github_stars/widgets/failed_request_widget.dart';
import 'package:github_stars/widgets/loading_widget.dart';

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  HomeBloc _bloc;
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _ownerController = TextEditingController();

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
                    child: Form(
                  key: _formKey,
                  child: TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'This field cannot be empty!';
                      } else {
                        return null;
                      }
                    },
                    decoration: const InputDecoration(labelText: 'Owner'),
                    controller: _ownerController,
                  ),
                )),
                FlatButton(
                  child: const Text('Search'),
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    if (_formKey.currentState.validate()) {
                      _bloc.add(SearchOwnerEvent(owner: _ownerController.text));
                    }
                  },
                )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8),
          ),
          Expanded(
            child: StreamBuilder<HomeState>(
              initialData: HomeLoadedState(),
              stream: _bloc,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                return buildLayout(snapshot.data);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildLayout(HomeState state) {
    if (state is HomeFailedState) {
      return FailedRequestWidget();
    } else if (state is HomeLoadingState) {
      return LoadingWidget();
    } else if (state is ShowOwnerInfoState) {
      return OwnerInfosWidget(
        owner: state.owner,
      );
    }
    return Container(
      child: const Center(child: Text('Enter the username in the field above')),
    );
  }
}

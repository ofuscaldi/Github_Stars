import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_stars/core/di/service_locator.dart';
import 'package:github_stars/presentation/home/bloc/home_event.dart';
import 'package:github_stars/presentation/home/bloc/home_state.dart';
import 'package:github_stars/presentation/home/home_bloc.dart';
import 'package:github_stars/presentation/home/owner_infos_widget.dart';
import 'package:github_stars/widgets/default_app_bar.dart';
import 'package:github_stars/widgets/failed_request_widget.dart';
import 'package:github_stars/widgets/loading_widget.dart';

class HomeWidget extends StatefulWidget {
  static const ownerTextField = Key('Owner_Text_Field');
  static const searchOwnerButton = Key('Search_Owner_Button');
  static const addOwnerTextKey = Key('Add_Owner_Text_Key');

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _ownerController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(title: 'GitHub Stars'),
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
                    key: HomeWidget.ownerTextField,
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
                  key: HomeWidget.searchOwnerButton,
                  child: const Text('Search'),
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    if (_formKey.currentState.validate()) {
                      sl
                          .get<HomeBloc>()
                          .add(SearchOwnerEvent(owner: _ownerController.text));
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
            child: BlocProvider(
              create: (_) => sl.get<HomeBloc>(),
              child: BlocBuilder<HomeBloc, HomeState>(
                buildWhen: (previousState, state) {
                  return state is HomeLoadingState ||
                      state is HomeInitState ||
                      state is ShowOwnerInfoState ||
                      state is HomeFailedState;
                },
                builder: (context, state) {
                  if (state is HomeFailedState) {
                    return FailedRequestWidget();
                  } else if (state is HomeLoadingState) {
                    return LoadingWidget();
                  } else if (state is ShowOwnerInfoState) {
                    return OwnerInfoWidget(
                      owner: state.owner,
                    );
                  }
                  return Container(
                    child: const Center(
                        child: Text(
                      'Enter the username in the field above',
                      key: HomeWidget.addOwnerTextKey,
                    )),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

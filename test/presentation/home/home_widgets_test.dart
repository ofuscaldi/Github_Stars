import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:github_stars/core/di/service_locator.dart';
import 'package:github_stars/presentation/home/bloc/home_state.dart';
import 'package:github_stars/presentation/home/home_bloc.dart';
import 'package:github_stars/presentation/home/home_widget.dart';
import 'package:github_stars/widgets/failed_request_widget.dart';
import 'package:github_stars/widgets/loading_widget.dart';
import 'package:mockito/mockito.dart';

import '../../parameters.dart';

class _MockHomeBloc extends Mock implements HomeBloc {}

void main() {
  Future<void> initializeWidget(WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: HomeWidget()));

    await tester.pump(Duration.zero);
  }

  HomeBloc _bloc;

  setUp(() {
    setup(sl);

    _bloc = _MockHomeBloc();
    resetMockitoState();

    sl.allowReassignment = true;
    sl.registerLazySingleton<HomeBloc>(() => _bloc);
  });

  testWidgets('Home loaded builds properly', (WidgetTester tester) async {
    when(_bloc.state).thenReturn(HomeInitState());

    await initializeWidget(tester);

    expect(find.byKey(HomeWidget.ownerTextField), findsOneWidget);
    expect(find.byKey(HomeWidget.searchOwnerButton), findsOneWidget);
    expect(find.byKey(HomeWidget.addOwnerTextKey), findsOneWidget);
  });

  testWidgets('Failed view works', (WidgetTester tester) async {
    when(_bloc.state).thenAnswer((_) {
      return HomeFailedState();
    });

    await initializeWidget(tester);
    await tester.enterText(find.byKey(HomeWidget.ownerTextField), Parameters.owner);
    await tester.tap(find.byKey(HomeWidget.searchOwnerButton));

    await tester.pump();
    expect(find.byKey(FailedRequestWidget.failedTextKey), findsOneWidget);
  });

  testWidgets('Loading view works', (WidgetTester tester) async {
    when(_bloc.state).thenAnswer((_) {
      return HomeLoadingState();
    });

    await initializeWidget(tester);
    await tester.enterText(find.byKey(HomeWidget.ownerTextField), Parameters.owner);
    await tester.tap(find.byKey(HomeWidget.searchOwnerButton));

    await tester.pump();
    expect(find.byKey(LoadingWidget.circularProgressIndicatorKey), findsOneWidget);
  });

  testWidgets('should be valid when text is not empty', (WidgetTester tester) async {
    await initializeWidget(tester);

    final ownerField = find.widgetWithText(TextFormField, 'Owner');
    final nameFormField = tester.widget<TextFormField>(ownerField);
    expect(nameFormField.validator(Parameters.owner), null);
  });

  testWidgets('should be failed when text is empty', (WidgetTester tester) async {
    await initializeWidget(tester);

    final ownerField = find.widgetWithText(TextFormField, 'Owner');
    final nameFormField = tester.widget<TextFormField>(ownerField);
    expect(nameFormField.validator(''), 'This field cannot be empty!');
  });
}

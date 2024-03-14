import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movieradar/blocs/theme_cubit.dart';
import 'package:movieradar/ui/screens/Settings/Tabs/settings_tab.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class MockHydratedStorage extends Mock implements HydratedStorage {}

void main() {
  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();

    // Initialize the HydratedStorage.
    final MockHydratedStorage mockStorage = MockHydratedStorage();
    when(() => mockStorage.write(any(), any())).thenAnswer((_) async {});
    HydratedBloc.storage = mockStorage;
  });

  testWidgets('Theme switch test', (WidgetTester tester) async {
    final ThemeCubit themeCubit = ThemeCubit();

    await tester.pumpWidget(
      BlocProvider<ThemeCubit>.value(
        value: themeCubit,
        child: MaterialApp(
          home: SettingsTab(),
        ),
      ),
    );

    // Test for light theme
    await tester.tap(find.text('Light'));
    await tester.pumpAndSettle();
    expect(themeCubit.state, ThemeMode.light);

    // Test for dark theme
    await tester.tap(find.text('Dark'));
    await tester.pumpAndSettle();
    expect(themeCubit.state, ThemeMode.dark);

    // Test for system theme
    await tester.tap(find.text('System'));
    await tester.pumpAndSettle();
    expect(themeCubit.state, ThemeMode.system);
  });
}

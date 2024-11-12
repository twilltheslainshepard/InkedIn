import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:inked_in/flutter_flow/flutter_flow_drop_down.dart';
import 'package:inked_in/flutter_flow/flutter_flow_icon_button.dart';
import 'package:inked_in/flutter_flow/flutter_flow_widgets.dart';
import 'package:inked_in/flutter_flow/flutter_flow_theme.dart';
import 'package:inked_in/index.dart';
import 'package:inked_in/main.dart';
import 'package:inked_in/flutter_flow/flutter_flow_util.dart';

import 'package:inked_in/backend/firebase/firebase_config.dart';
import 'package:inked_in/auth/firebase_auth/auth_util.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    await initFirebase();
  });

  setUp(() async {
    await authManager.signOut();
  });

  testWidgets('Golden Path - Start Screen Test', (WidgetTester tester) async {
    _overrideOnError();

    await tester.pumpWidget(MyApp());

    await tester.enterText(
        find.byKey(ValueKey('LoginEmail_orrf')), 'artistAccount@email.com');
    await tester.enterText(
        find.byKey(ValueKey('LoginPassword_00at')), 'hellohello');
    await tester.tap(find.byKey(ValueKey('Button_2wtk')));
    await tester.pumpAndSettle(Duration(milliseconds: 3000));
    expect(find.text('Dummy Page'), findsOneWidget);
  });
}

// There are certain types of errors that can happen during tests but
// should not break the test.
void _overrideOnError() {
  final originalOnError = FlutterError.onError!;
  FlutterError.onError = (errorDetails) {
    if (_shouldIgnoreError(errorDetails.toString())) {
      return;
    }
    originalOnError(errorDetails);
  };
}

bool _shouldIgnoreError(String error) {
  // It can fail to decode some SVGs - this should not break the test.
  if (error.contains('ImageCodecException')) {
    return true;
  }
  // Overflows happen all over the place,
  // but they should not break tests.
  if (error.contains('overflowed by')) {
    return true;
  }
  // Sometimes some images fail to load, it generally does not break the test.
  if (error.contains('No host specified in URI') ||
      error.contains('EXCEPTION CAUGHT BY IMAGE RESOURCE SERVICE')) {
    return true;
  }
  // These errors should be avoided, but they should not break the test.
  if (error.contains('setState() called after dispose()')) {
    return true;
  }

  return false;
}

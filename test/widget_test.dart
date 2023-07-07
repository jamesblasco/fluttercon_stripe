// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

// ignore: avoid_web_libraries_in_flutter
import 'dart:html';

import 'package:flutter_test/flutter_test.dart';
import 'package:fluttercon_stripe/alert.dart';

/// flutter test --platform=chrome
void main() {
 // setUp(() {
 //   document.head!.append(
 //     ScriptElement()..text = 'var version = 1;',
 //   );
 // });

  test('can read version', () {
    expect(version, 1);
  });
}

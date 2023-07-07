import 'package:js/js.dart';

@JS()
external int get version;

@JS()
external String get url;

@JS()
external set callback(Function value);

@JS()
external void createAlert(String message);

@JS()
@staticInterop
external void alert(String message);

@JS()
@staticInterop
external Window get window;

@JS()
@staticInterop
class Window {}

extension WindowX on Window {
  external Location get location;
}

@JS()
@staticInterop
class Location {}

extension LocationX on Location {
  external String get href;
}

@JS()
@anonymous
class User {
  external factory User({String id, String email});
  external String get id;
  external String get email;
  external set id(String value);
  external set email(String value);
}

extension UserX on User {}

@JS()
external void welcomeUser(User user);

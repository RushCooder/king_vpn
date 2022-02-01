part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const HOME = _Paths.HOME;
  static const SERVER = _Paths.SERVER;
  static const SPEED = _Paths.SPEED;
  static const ONBORDING = _Paths.ONBORDING;
}

abstract class _Paths {
  static const HOME = '/home';
  static const SERVER = '/server';
  static const SPEED = '/speed';
  static const ONBORDING = '/onbording';
}

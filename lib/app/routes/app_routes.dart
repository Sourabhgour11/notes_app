part of 'app_pages.dart';

abstract class Routes {
  static const login = '/login';
  static const home = '/home';
  static const addNote = '/add';
  static const noteDetail = '/detail';

  // Choose which screen to show first (login/home)
  static String get initial => login;
}

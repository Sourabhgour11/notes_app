import 'package:hive/hive.dart';
import '../models/note.dart';

class HiveService {
  static const notesBoxName = 'notes_box';
  static const settingsBoxName = 'settings_box'; // theme/auth helpers

  static late Box<Note> notesBox;
  static late Box settingsBox;

  static Future<void> init() async {
    notesBox = await Hive.openBox<Note>(notesBoxName);
    settingsBox = await Hive.openBox(settingsBoxName);
  }

  // Settings helpers
  static bool? getBool(String key) => settingsBox.get(key) as bool?;
  static Future<void> setBool(String key, bool value) => settingsBox.put(key, value);

  static String? getString(String key) => settingsBox.get(key) as String?;
  static Future<void> setString(String key, String value) => settingsBox.put(key, value);
}

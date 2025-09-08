import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'app/data/services/hive_services.dart';
import 'app/routes/app_pages.dart';
import 'app/theme/theme_controller.dart';
import 'app/data/models/note.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(NoteAdapter().typeId)) {
    Hive.registerAdapter(NoteAdapter());
  }
  await HiveService.init(); // open boxes early

  final themeController = Get.put(ThemeController(), permanent: true);

  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Notes',
    initialRoute: Routes.initial,
    getPages: AppPages.pages,
    theme: themeController.lightTheme,
    darkTheme: themeController.darkTheme,
    themeMode: themeController.themeMode,
  ));
}

import 'package:get/get.dart';
import '../modules/auth/views/login_view.dart';
import '../modules/home/views/home_view.dart';
import '../modules/add_note/views/add_note_view.dart';
import '../modules/note_detail/views/note_detail_view.dart';

part 'app_routes.dart';

class AppPages {
  static final pages = <GetPage>[
    GetPage(name: Routes.login, page: () => LoginView()),
    GetPage(name: Routes.home, page: () => HomeView()),
    GetPage(name: Routes.addNote, page: () => AddNoteView()),
    GetPage(name: Routes.noteDetail, page: () => NoteDetailView()),
  ];
}

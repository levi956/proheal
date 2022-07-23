import 'package:firebase_core/firebase_core.dart';
import 'package:proheal/app/services/http_service/api.dart';
import 'package:proheal/core/firebase/firebase_options.dart';
import 'package:proheal/core/system/set_potrait.dart';

import '../../app/services/database/create.dart';

// goal of the repository is to make on instance accessible
// everwhere in the application

class Repository {
  static HttpClient httpClient = HttpClient();
  static DatabaseCreate databaseCreate = DatabaseCreate();

  static Repository? _instance;
  static Repository get instance => _instance ??= Repository();

  static Future<void> init() async {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
    SetPotrait.init();

    // logic also to check the app state sha
    // assign a uuid value to the key firstLanuch
    // check condition and satisfy with bool condition
  }
}

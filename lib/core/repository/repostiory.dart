import 'package:proheal/app/services/http_service/api.dart';
import 'package:proheal/core/system/set_potrait.dart';

// goal of the repository is to make on instance accessible
// everwhere in the application

class Repository {
  static HttpClient httpClient = HttpClient();

  static Repository? _instance;
  static Repository get instance => _instance ??= Repository();

  static void init() {
    // setup services like firebase and the rest here
    // seems to work now
    SetPotrait.init();
  }
}

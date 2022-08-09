import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';

import 'core/env.dart';
import 'data/api/api_provider.dart';
import 'data/providers/http_api_provider.dart';

class DependencyInjection {
  static bootstrap() async {
    GetIt.I.registerSingleton<ApiProvider>(HttpApiProvider());
    GetIt.I.registerSingleton<Env>(kDebugMode ? Developemt() : Production());
    await GetIt.instance.allReady();
  }
}

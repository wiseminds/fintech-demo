import 'package:example/data/api/api_provider.dart';
import 'package:get_it/get_it.dart';

abstract class BaseApiService {
  ApiProvider get provider => GetIt.I<ApiProvider>();
}

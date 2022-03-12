import 'package:example/constants/api_urls.dart';

abstract class Env {
  /// auth token
  String get token;

  /// auth sourceappid
  String get sourceappid;

  /// API base url
  String get baseUrl;
}

class Developemt extends Env {
  @override
  String get token =>
      'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIyMzQ4OTkzOTQ5NjMzIiwiaWF0IjoxNjQ2OTk4MzgwLCJleHAiOjE2NDcwODQ3ODB9.iLzStUQEOsde38vGwHT5AT6nb0f63PGGkgVUrgcfcQBq16qTzdotWd-JCl1QM7budyav5tX2ufA0JZoEfwtw6Q';

  @override
  String get sourceappid => 'ckpu7zo0p0000gg5436coo7xs';

  @override
  String get baseUrl => ApiUrls.baseUrl;
}

class Production extends Env {
  @override
  String get token =>
      'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIyMzQ4OTkzOTQ5NjMzIiwiaWF0IjoxNjQ2OTk4MzgwLCJleHAiOjE2NDcwODQ3ODB9.iLzStUQEOsde38vGwHT5AT6nb0f63PGGkgVUrgcfcQBq16qTzdotWd-JCl1QM7budyav5tX2ufA0JZoEfwtw6Q';

  @override
  String get sourceappid => 'ckpu7zo0p0000gg5436coo7xs';

  @override
  String get baseUrl => ApiUrls.baseUrl;
}

class Test extends Env {
  @override
  String get token =>
      'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIyMzQ4OTkzOTQ5NjMzIiwiaWF0IjoxNjQ2OTk4MzgwLCJleHAiOjE2NDcwODQ3ODB9.iLzStUQEOsde38vGwHT5AT6nb0f63PGGkgVUrgcfcQBq16qTzdotWd-JCl1QM7budyav5tX2ufA0JZoEfwtw6Q';

  @override
  String get sourceappid => 'ckpu7zo0p0000gg5436coo7xs';

  @override
  String get baseUrl => ApiUrls.baseUrl;
}

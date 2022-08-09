import 'dart:async';

import 'package:example/core/utils/exception_formater.dart';
import 'package:flutter/foundation.dart';

import 'api_response.dart';
import 'remote_repository.dart';

typedef NetworkCall<T> = Future<T> Function();

abstract class DataRepository with ExceptionFormater {
  // final LocalRepository _localRepository = GetIt.I<LocalRepository>();
  final RemoteRepository _remoteRepository = RemoteRepository();

  /// manages fetching data, decides where to fetch data from
  Future<ApiResponse<ResultType, Item>> handleRequest<ResultType, Item>(
      NetworkCall<ApiResponse<ResultType, Item>> networkCall,
      {
      // CacheDescription? cache,
      int timeout = 50,
      bool retryWithCache = false,
      bool retry = false}) async {
    // bool _useCache = await shouldUseCache(cache);

    /// fetches data from cache if a valid cached data exists
    // if (_useCache) {
    //   if (kDebugMode) print('fetching data from cache');
    //   var data = await _localRepository.getData(cache!.key);
    //   data = JsonInterceptor.convertFromJson<ResultType, Item>(data);
    //   // print('${data != null && data is ResultType}');
    //   // if (kDebugMode) print('fetching data from cache $data');
    //   if (data != null && data is ResultType) {
    //     return ApiResponse<ResultType, Item>(
    //         request: ApiRequest.dummy(),
    //         bodyString: data.toString(),
    //         body: data,
    //         headers: {},
    //         statusCode: 210);
    //   }
    // }

    /// else fetches data from the remote source
    ApiResponse<ResultType, Item> response = await _remoteRepository
        .handleRequest<ResultType, Item>(networkCall, timeout: timeout);

    // print('headers: ${response.request.headers}');

    if (!response.isSuccessful) {
      response = _remoteRepository.handleError(response);
      // if (retryWithCache && cache != null) {
      //   return handleRequest(networkCall,
      //       cache: cache.copyWith(overrideTime: true));
      // }
    }

    if (kDebugMode) print(response.error);
    if (kDebugMode) print(' finished request');

    // if (cache != null &&
    //     !cache.ignoreSave &&
    //     cache.key.isNotEmpty &&
    //     response.body != null) {
    //   var data = validateData<ResultType, Item>(response);
    //   if (data != null) {
    //     String json = JsonInterceptor.convertToJson(data);
    //     _localRepository.saveData(cache.key, json);
    //     _localRepository.saveTime(
    //         cache.key,
    //         DateTime.now()
    //             .add(Duration(milliseconds: cache.lifeSpan))
    //             .millisecondsSinceEpoch);
    //   }
    // }
    return response;
  }

  /// validate data to be saved to cache is not an empty list
  // ResultType? validateData<ResultType, Item>(
  //     ApiResponse<ResultType, Item> response) {
  //   dynamic data = response.body;
  //   if (ResultType is BuiltList<Item>) {
  //     if ((data as BuiltList).isEmpty) return null;
  //   }
  //   return data;
  // }

  // Future<bool> shouldUseCache(CacheDescription? cache) async {
  //   if (kDebugMode) ('cache $cache ${cache?.key} ${cache?.lifeSpan}');
  //   if (cache == null || cache.key.isEmpty) return false;
  //   if (cache.invalidateCache) return false;
  //   if (cache.overrideTime) return true;
  //   return await _localRepository.checkCache(cache.key);
  // }
}

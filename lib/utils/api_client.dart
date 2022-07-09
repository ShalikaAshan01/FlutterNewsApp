import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class ApiClient {

  static String baseUrl = 'https://newsapi.org/v2';

  static Future<Response<dynamic>?> call(
    String endpoint,
    ApiMethod method, {
    FormData? formData,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParams,
    bool errorToast = true,
    bool successToast = false,
    int successCode = 200,
    String? overrideUrl,
  }) async {
    try {
      final BaseOptions dioOpt = BaseOptions(
          receiveDataWhenStatusError: true,
          connectTimeout: 15 * 1000, // 60 seconds
          receiveTimeout: 15 * 1000 // 60 seconds
          );
      final Dio dio = Dio(dioOpt);

      final Options options = Options(
          followRedirects: false,
          validateStatus: (int? status) {
            return true;
          },
          headers: <String, dynamic>{}
          // headers: headers,
      );

      final String uri = '${overrideUrl ?? baseUrl}$endpoint';
      dynamic tempFormData = data;
      if (formData != null) {
        tempFormData = formData;
        final Map<String, dynamic> temp = <String, dynamic>{};
        for (final MapEntry<String, String> e in formData.fields) {
          temp[e.key] = e.value;
        }
      }
      queryParams = queryParams ?? {};
      queryParams['apiKey'] = _getApiKey();

      if (data != null) {
        tempFormData = jsonEncode(data);
        options.headers?.putIfAbsent(
            HttpHeaders.contentTypeHeader, () => 'application/json');
      }
      Response<dynamic> response;

      switch (method) {
        case ApiMethod.get:
          response = await dio.get(uri,
              options: options, queryParameters: queryParams);
          break;
        case ApiMethod.post:
          // FormData temp = formData??FormData.fromMap(data);
          response = await dio.post(uri, data: tempFormData, options: options);
          break;
        case ApiMethod.put:
        // FormData temp = formData??FormData.fromMap(data);
          response = await dio.put(uri, data: tempFormData, options: options);
          break;
        case ApiMethod.delete:
          response =
              await dio.delete(uri, data: tempFormData, options: options);
          break;
      }
      debugPrint('URL: ${response.realUri.toString()}');
      final dynamic result = response.data;

      // print(result);
      // print(uri);

      if (response.statusCode != successCode) {
        //debugPrint(result);
        if (errorToast) {
          if (result == null || result.toString().isEmpty) {
            // EasyLoading.showToast('Invalid api response',
            //     toastPosition: EasyLoadingToastPosition.bottom);
          } else {
            final dynamic message =
                result == null ? '' : result?['message'] ?? '';
            if (message.toString().isNotEmpty) {
              debugPrint(message);
              // EasyLoading.showToast(message,
              //     toastPosition: EasyLoadingToastPosition.bottom);
            }
          }
        }
      } else {
        if (successToast) {
          EasyLoading.showToast(result['message'],
              toastPosition: EasyLoadingToastPosition.bottom);
        }
      }
      return response;
    } on Exception catch (_) {
      return null;
    }
  }

  static String _getApiKey() {
    List<String> apiKeys = [
      '70683de12f864660ba8da0274d4d89e1',
      '1bd2801954ef4585b3742d07cbb47c33'
    ];
    return apiKeys[1];
  }
}

enum ApiMethod { get, post, put, delete }
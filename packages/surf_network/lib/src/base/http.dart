// Copyright (c) 2019-present,  SurfStudio LLC
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'dart:io';

import 'response.dart';

///Фасад над работой с сетью
abstract class Http {
  ///GET- request
  Future<Response<T>> get<T>(
    String url, {
    Map<String, Object> query,
    Map<String, String> headers,
    String contentType,
  });

  ///POST-request
  Future<Response<T>> post<T>(
    String url, {
    Map<String, Object> query,
    Map<String, String> headers,
    Map<String, Object> body,
    String contentType,
  });

  ///PUT -request
  Future<Response<T>> put<T>(
    String url, {
    Map<String, Object> query,
    Map<String, String> headers,
    Map<String, Object> body,
    String contentType,
  });

  ///DELETE -request
  Future<Response<T>> delete<T>(
    String url, {
    Map<String, Object> query,
    Map<String, String> headers,
    Map<String, Object> body,
    String contentType,
  });

  ///PATCH -request
  Future<Response<T>> patch<T>(
    String url, {
    Map<String, Object> query,
    Map<String, String> headers,
    Map<String, Object> body,
    String contentType,
  });

  ///HEAD - request
  Future<Response<T>> head<T>(
    String url,
    Map<String, Object> query,
    Map<String, String> headers, {
    String contentType,
  });

  /// Multipart request
  Future<Response<T>> multipart<T>(
    String url, {
    Map<String, String> headers,
    File body,
    String contentType,
  });
}

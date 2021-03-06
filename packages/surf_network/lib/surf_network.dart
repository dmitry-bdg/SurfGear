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

library surf_network;

///base
export 'package:surf_network/src/base/config/config.dart';
export 'package:surf_network/src/base/config/log_config.dart';
export 'package:surf_network/src/base/error/http_codes.dart';
export 'package:surf_network/src/base/error/http_exceptions.dart';
export 'package:surf_network/src/base/headers.dart';
export 'package:surf_network/src/base/http.dart';
export 'package:surf_network/src/base/response.dart';
export 'package:surf_network/src/base/status_mapper.dart';

///implementations

///default
export 'package:surf_network/src/impl/default/default_http.dart';

///dio
export 'package:surf_network/src/impl/dio/dio_http.dart';
export 'package:surf_network/src/impl/dio/interceptor/dio_interceptor.dart';

///rx support
export 'package:surf_network/src/rx/rx_http.dart';
export 'package:surf_network/src/rx/rx_http_delegate.dart';

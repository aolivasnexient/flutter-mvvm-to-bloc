// Mocks generated by Mockito 5.2.0 from annotations
// in betterhodl_flutter/test/view_models/market_coin_view_models_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i6;
import 'dart:convert' as _i7;
import 'dart:typed_data' as _i8;

import 'package:betterhodl_flutter/core/network/socket_service.dart' as _i10;
import 'package:http/src/base_request.dart' as _i9;
import 'package:http/src/client.dart' as _i5;
import 'package:http/src/response.dart' as _i2;
import 'package:http/src/streamed_response.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;
import 'package:web_socket_channel/web_socket_channel.dart' as _i4;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeResponse_0 extends _i1.Fake implements _i2.Response {}

class _FakeStreamedResponse_1 extends _i1.Fake implements _i3.StreamedResponse {
}

class _FakeWebSocketChannel_2 extends _i1.Fake implements _i4.WebSocketChannel {
}

/// A class which mocks [Client].
///
/// See the documentation for Mockito's code generation for more information.
class MockClient extends _i1.Mock implements _i5.Client {
  MockClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i2.Response> head(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#head, [url], {#headers: headers}),
              returnValue: Future<_i2.Response>.value(_FakeResponse_0()))
          as _i6.Future<_i2.Response>);
  @override
  _i6.Future<_i2.Response> get(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#get, [url], {#headers: headers}),
              returnValue: Future<_i2.Response>.value(_FakeResponse_0()))
          as _i6.Future<_i2.Response>);
  @override
  _i6.Future<_i2.Response> post(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i7.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#post, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i2.Response>.value(_FakeResponse_0()))
          as _i6.Future<_i2.Response>);
  @override
  _i6.Future<_i2.Response> put(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i7.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#put, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i2.Response>.value(_FakeResponse_0()))
          as _i6.Future<_i2.Response>);
  @override
  _i6.Future<_i2.Response> patch(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i7.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#patch, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i2.Response>.value(_FakeResponse_0()))
          as _i6.Future<_i2.Response>);
  @override
  _i6.Future<_i2.Response> delete(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i7.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#delete, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i2.Response>.value(_FakeResponse_0()))
          as _i6.Future<_i2.Response>);
  @override
  _i6.Future<String> read(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#read, [url], {#headers: headers}),
          returnValue: Future<String>.value('')) as _i6.Future<String>);
  @override
  _i6.Future<_i8.Uint8List> readBytes(Uri? url,
          {Map<String, String>? headers}) =>
      (super.noSuchMethod(
              Invocation.method(#readBytes, [url], {#headers: headers}),
              returnValue: Future<_i8.Uint8List>.value(_i8.Uint8List(0)))
          as _i6.Future<_i8.Uint8List>);
  @override
  _i6.Future<_i3.StreamedResponse> send(_i9.BaseRequest? request) =>
      (super.noSuchMethod(Invocation.method(#send, [request]),
              returnValue:
                  Future<_i3.StreamedResponse>.value(_FakeStreamedResponse_1()))
          as _i6.Future<_i3.StreamedResponse>);
  @override
  void close() => super.noSuchMethod(Invocation.method(#close, []),
      returnValueForMissingStub: null);
}

/// A class which mocks [SocketService].
///
/// See the documentation for Mockito's code generation for more information.
class MockSocketService extends _i1.Mock implements _i10.SocketService {
  MockSocketService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.WebSocketChannel get channel =>
      (super.noSuchMethod(Invocation.getter(#channel),
          returnValue: _FakeWebSocketChannel_2()) as _i4.WebSocketChannel);
  @override
  set channel(_i4.WebSocketChannel? _channel) =>
      super.noSuchMethod(Invocation.setter(#channel, _channel),
          returnValueForMissingStub: null);
  @override
  dynamic connectAndListen(
          {Uri? uri, Function? callback, Function? errorCallBack}) =>
      super.noSuchMethod(Invocation.method(#connectAndListen, [],
          {#uri: uri, #callback: callback, #errorCallBack: errorCallBack}));
}

// Mocks generated by Mockito 5.3.2 from annotations
// in betterhodl_flutter/test/app/presentation/screens/market_list_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i7;

import 'package:betterhodl_flutter/app/logic/market_coin_bloc/market_coin_bloc.dart'
    as _i5;
import 'package:betterhodl_flutter/data/adapters/rest_adapter.dart' as _i2;
import 'package:betterhodl_flutter/data/services/socket_service/socket_service.dart'
    as _i3;
import 'package:betterhodl_flutter/domain/models/market_coin.dart' as _i6;
import 'package:betterhodl_flutter/domain/repositories/marketcoin_repository.dart'
    as _i4;
import 'package:flutter_bloc/flutter_bloc.dart' as _i8;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeRestAdapter_0 extends _i1.SmartFake implements _i2.RestAdapter {
  _FakeRestAdapter_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeSocketService_1 extends _i1.SmartFake implements _i3.SocketService {
  _FakeSocketService_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeMarketCoinRepository_2 extends _i1.SmartFake
    implements _i4.MarketCoinRepository {
  _FakeMarketCoinRepository_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeMarketCoinState_3 extends _i1.SmartFake
    implements _i5.MarketCoinState {
  _FakeMarketCoinState_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [MarketCoinRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockMarketCoinRepository extends _i1.Mock
    implements _i4.MarketCoinRepository {
  MockMarketCoinRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  Map<String, _i6.MarketCoin> get marketCoinMap => (super.noSuchMethod(
        Invocation.getter(#marketCoinMap),
        returnValue: <String, _i6.MarketCoin>{},
      ) as Map<String, _i6.MarketCoin>);
  @override
  set marketCoinMap(Map<String, _i6.MarketCoin>? _marketCoinMap) =>
      super.noSuchMethod(
        Invocation.setter(
          #marketCoinMap,
          _marketCoinMap,
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i2.RestAdapter get restAdapter => (super.noSuchMethod(
        Invocation.getter(#restAdapter),
        returnValue: _FakeRestAdapter_0(
          this,
          Invocation.getter(#restAdapter),
        ),
      ) as _i2.RestAdapter);
  @override
  _i3.SocketService get socketService => (super.noSuchMethod(
        Invocation.getter(#socketService),
        returnValue: _FakeSocketService_1(
          this,
          Invocation.getter(#socketService),
        ),
      ) as _i3.SocketService);
  @override
  _i7.Future<List<_i6.MarketCoin>> fethAllMarketCoin(String? url) =>
      (super.noSuchMethod(
        Invocation.method(
          #fethAllMarketCoin,
          [url],
        ),
        returnValue: _i7.Future<List<_i6.MarketCoin>>.value(<_i6.MarketCoin>[]),
      ) as _i7.Future<List<_i6.MarketCoin>>);
  @override
  _i7.Stream<List<_i6.MarketCoin>> dataBaseStream(dynamic url) =>
      (super.noSuchMethod(
        Invocation.method(
          #dataBaseStream,
          [url],
        ),
        returnValue: _i7.Stream<List<_i6.MarketCoin>>.empty(),
      ) as _i7.Stream<List<_i6.MarketCoin>>);
  @override
  _i7.Future<void> stopStream() => (super.noSuchMethod(
        Invocation.method(
          #stopStream,
          [],
        ),
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);
  @override
  List<_i6.MarketCoin> reverseOrder() => (super.noSuchMethod(
        Invocation.method(
          #reverseOrder,
          [],
        ),
        returnValue: <_i6.MarketCoin>[],
      ) as List<_i6.MarketCoin>);
}

/// A class which mocks [MarketCoinBloc].
///
/// See the documentation for Mockito's code generation for more information.
class MockMarketCoinBloc extends _i1.Mock implements _i5.MarketCoinBloc {
  MockMarketCoinBloc() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.MarketCoinRepository get marketCoinRepository => (super.noSuchMethod(
        Invocation.getter(#marketCoinRepository),
        returnValue: _FakeMarketCoinRepository_2(
          this,
          Invocation.getter(#marketCoinRepository),
        ),
      ) as _i4.MarketCoinRepository);
  @override
  _i5.MarketCoinState get state => (super.noSuchMethod(
        Invocation.getter(#state),
        returnValue: _FakeMarketCoinState_3(
          this,
          Invocation.getter(#state),
        ),
      ) as _i5.MarketCoinState);
  @override
  _i7.Stream<_i5.MarketCoinState> get stream => (super.noSuchMethod(
        Invocation.getter(#stream),
        returnValue: _i7.Stream<_i5.MarketCoinState>.empty(),
      ) as _i7.Stream<_i5.MarketCoinState>);
  @override
  bool get isClosed => (super.noSuchMethod(
        Invocation.getter(#isClosed),
        returnValue: false,
      ) as bool);
  @override
  dynamic requestEventController(
    _i5.RequestMarketCoinsEvent? event,
    _i8.Emitter<_i5.MarketCoinState>? emit,
  ) =>
      super.noSuchMethod(Invocation.method(
        #requestEventController,
        [
          event,
          emit,
        ],
      ));
  @override
  dynamic sortEventController(
    _i5.SortMarketCoinsEvent? event,
    _i8.Emitter<_i5.MarketCoinState>? emit,
  ) =>
      super.noSuchMethod(Invocation.method(
        #sortEventController,
        [
          event,
          emit,
        ],
      ));
  @override
  dynamic setLiveController(
    _i5.SetLivePrincingEvent? event,
    _i8.Emitter<_i5.MarketCoinState>? emit,
  ) =>
      super.noSuchMethod(Invocation.method(
        #setLiveController,
        [
          event,
          emit,
        ],
      ));
  @override
  void add(_i5.MarketCoinEvent? event) => super.noSuchMethod(
        Invocation.method(
          #add,
          [event],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void onEvent(_i5.MarketCoinEvent? event) => super.noSuchMethod(
        Invocation.method(
          #onEvent,
          [event],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void emit(_i5.MarketCoinState? state) => super.noSuchMethod(
        Invocation.method(
          #emit,
          [state],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void on<E extends _i5.MarketCoinEvent>(
    _i8.EventHandler<E, _i5.MarketCoinState>? handler, {
    _i8.EventTransformer<E>? transformer,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #on,
          [handler],
          {#transformer: transformer},
        ),
        returnValueForMissingStub: null,
      );
  @override
  void onTransition(
          _i8.Transition<_i5.MarketCoinEvent, _i5.MarketCoinState>?
              transition) =>
      super.noSuchMethod(
        Invocation.method(
          #onTransition,
          [transition],
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i7.Future<void> close() => (super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);
  @override
  void onChange(_i8.Change<_i5.MarketCoinState>? change) => super.noSuchMethod(
        Invocation.method(
          #onChange,
          [change],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void addError(
    Object? error, [
    StackTrace? stackTrace,
  ]) =>
      super.noSuchMethod(
        Invocation.method(
          #addError,
          [
            error,
            stackTrace,
          ],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void onError(
    Object? error,
    StackTrace? stackTrace,
  ) =>
      super.noSuchMethod(
        Invocation.method(
          #onError,
          [
            error,
            stackTrace,
          ],
        ),
        returnValueForMissingStub: null,
      );
}

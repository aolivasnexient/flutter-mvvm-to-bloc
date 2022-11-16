
import 'package:betterhodl_flutter/app/logic/market_coin_bloc/market_coin_bloc.dart';
import 'package:betterhodl_flutter/domain/models/market_coin.dart';
import 'package:betterhodl_flutter/domain/repositories/marketcoin_repository.dart';
import 'package:betterhodl_flutter/helpers/url_helper.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'marketcoin_bloc_test.mocks.dart';

@GenerateMocks([MarketCoinRepository, MarketCoin])

void main() {
  
  final MockMarketCoinRepository mockMarketCoinRepository = MockMarketCoinRepository();
  late MarketCoinState initState;
  setUp(() {
    initState = const MarketCoinState(isError: false, isLoading: false, isLivePricing: false, marketCoins: []);
  },);
  group("Market Bloc -", () {
    
    blocTest(
      "nothing event -> nothing state" , 
      build: () => MarketCoinBloc(mockMarketCoinRepository),
      expect: () => [],
    );
  
    blocTest<MarketCoinBloc, MarketCoinState>(
      "RequestMarketCoinEvent -> Emits [MarketCoin]" , 
      build: () => MarketCoinBloc(mockMarketCoinRepository),
      act: (bloc) {
        when(
          mockMarketCoinRepository.fethAllMarketCoin(UrlHelper.marketUrl)
        ).thenAnswer((_) async => []);
        bloc.add(RequestMarketCoinsEvent());
      },
      expect: () {
        final state1 = initState.copyWith(isLoading: true);
        final state2 = state1.copyWith(isLoading: false, marketCoins: []);
        return[state1,state2];
      },
    );

    blocTest<MarketCoinBloc, MarketCoinState>(
      "RequestMarketCoinEvent -> Emits state with Error", 
      build: () => MarketCoinBloc(mockMarketCoinRepository),
      act: (bloc) {
        when(
          mockMarketCoinRepository.fethAllMarketCoin(UrlHelper.marketUrl)
          ).thenAnswer((_) => throw Exception());

        bloc.add(RequestMarketCoinsEvent());
      },
      expect: () {
        final state1 = initState.copyWith(isLoading: true);
        final state2 = state1.copyWith(isLoading: false, isError: true, errorMsg: "Exception");
        return [state1, state2];
      },
    );

    final List<MarketCoin> mockCoins = [MockMarketCoin(), MockMarketCoin()];
    blocTest<MarketCoinBloc, MarketCoinState>(
      "SortMarketCoinsEvent -> Emits [MarketCoin]", 
      build: () => MarketCoinBloc(mockMarketCoinRepository),
      act: (bloc) {
        when(
          mockMarketCoinRepository.reverseOrder()
          ).thenAnswer((_) => mockCoins );

        bloc.add(SortMarketCoinsEvent());
      },
      expect: () {
        final state1 = initState.copyWith(marketCoins: mockCoins);
        return [state1];
      },
    );

    group("market coin stream -", () {
      
        
      final data = [
        [MockMarketCoin()], 
        [MockMarketCoin(),MockMarketCoin()] 
      ];

      final fakeStream = Stream.fromIterable(data);
      blocTest<MarketCoinBloc, MarketCoinState>(
        "turn on live coin price", 
        build: () => MarketCoinBloc(mockMarketCoinRepository),
        act: (bloc) {
          when(
            mockMarketCoinRepository.dataBaseStream(UrlHelper.livePriceWss),
          ).thenAnswer((_) => fakeStream);
          bloc.add(SetLivePrincingEvent(true));
        },
        expect: () {
          final state1 = initState.copyWith(isLivePricing: true);
          final state2 = state1.copyWith(marketCoins: data.first);
          final state3 = state2.copyWith(marketCoins: data.last);
          return [state1,state2,state3];
        },
      );

      blocTest<MarketCoinBloc, MarketCoinState>(
        "turn off live coin price", 
        build: () => MarketCoinBloc(mockMarketCoinRepository),
        act: (bloc) {
          when(
            mockMarketCoinRepository.dataBaseStream(UrlHelper.livePriceWss),
          ).thenAnswer((_) => fakeStream);
          bloc.add(SetLivePrincingEvent(false));
        },
        expect: () {
          final state = initState.copyWith(isLivePricing: false);
          return [state];
        },
      );

    },);

  },);



}


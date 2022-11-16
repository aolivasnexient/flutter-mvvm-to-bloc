import 'package:betterhodl_flutter/app/logic/market_coin_bloc/market_coin_bloc.dart';
import 'package:betterhodl_flutter/domain/models/market_coin.dart';
import 'package:betterhodl_flutter/app/presentation/screens/market_list.dart';
import 'package:betterhodl_flutter/domain/repositories/marketcoin_repository.dart';
import 'package:betterhodl_flutter/helpers/url_helper.dart';
import 'package:betterhodl_flutter/view_models/market_coins_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'market_list_test.mocks.dart';

var marketCoin = MarketCoin(
    id: 'bitcoin',
    symbol: 'btc',
    name: 'Bitcoin',
    image:
        'https://assets.coingecko.com/coins/images/8029/large/1_0YusgngOrriVg4ZYx4wOFQ.png?1553483622',
    currentPrice: 21000.00,
    marketCap: 60000000000.00,
    marketCapRank: 1,
    high24h: 21500.00,
    low24h: 20500.00,
    priceChange24h: 1000.00,
    priceChangePercentage24h: 10.0,
    ath: 69000.00,
    athChangePercentage: 69.23,
    athDate: DateTime.now(),
    atl: 300.00,
    atlChangePercentage: -234.00,
    atlDate: DateTime.now());

//class MockMarketListViewModel extends Mock implements MarketCoinsViewModel {}

@GenerateMocks([MarketCoinsViewModel, MarketCoinRepository, MarketCoinBloc])
void main() {
  testWidgets('MarketCap sort Button', (WidgetTester tester) async {

    final mockMarketCoinRepository = MockMarketCoinRepository();

    when(mockMarketCoinRepository.fethAllMarketCoin(UrlHelper.marketUrl)).thenAnswer((_) async => <MarketCoin>[]);
    when(mockMarketCoinRepository.reverseOrder()).thenAnswer((_) => <MarketCoin>[]);

    const testKey = Key('K');

    final widgetUnderTest = BlocProvider(
      create: (context) => MarketCoinBloc(mockMarketCoinRepository),
      child: const MaterialApp(
        key: testKey,
        home: Scaffold(
          body: CoinTable(),
        ),
      ),
    );

    
    await tester.pumpWidget(widgetUnderTest);

    final Finder marketCapButton = find.byKey(const ValueKey('market_list_market_cap_button'));

    await tester.tap(marketCapButton);
    await tester.pump();

    verify(mockMarketCoinRepository.fethAllMarketCoin(UrlHelper.marketUrl)).called(1);
    verify(mockMarketCoinRepository.reverseOrder()).called(1);
  });

  testWidgets('Live Princing Button', (WidgetTester tester) async {

    final mockMarketCoinRepository = MockMarketCoinRepository();
    
    when(
      mockMarketCoinRepository.dataBaseStream(UrlHelper.livePriceWss)
    ).thenAnswer((_) => Stream.fromIterable(<List<MarketCoin>>[]));

    const testKey = Key('K');

    final widgetUnderTest = BlocProvider(
      create: (context) => MarketCoinBloc(mockMarketCoinRepository),
      child: const MaterialApp(
        key: testKey,
        home: Scaffold(
          body: CoinAppBar(),
        ),
      ),
    );

    
    await tester.pumpWidget(widgetUnderTest);

    final Finder marketCapButton = find.byKey(const ValueKey('live_pricing_button'));

    await tester.tap(marketCapButton);
    await tester.pump();

    verify(mockMarketCoinRepository.dataBaseStream(UrlHelper.livePriceWss)).called(1);
  });


}

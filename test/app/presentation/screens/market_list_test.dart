import 'package:betterhodl_flutter/app/logic/market_coin_bloc/market_coin_bloc.dart';
import 'package:betterhodl_flutter/domain/models/market_coin.dart';
import 'package:betterhodl_flutter/app/presentation/screens/market_list.dart';
import 'package:betterhodl_flutter/domain/repositories/marketcoin_repository.dart';
import 'package:betterhodl_flutter/helpers/url_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../logic/market_coin_bloc/marketcoin_bloc_test.mocks.dart';



@GenerateMocks([MarketCoinRepository, MarketCoinBloc])
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

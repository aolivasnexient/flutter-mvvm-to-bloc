import 'package:betterhodl_flutter/core/components/app_loading.dart';
import 'package:betterhodl_flutter/screens/coin_detail.dart';
import 'package:betterhodl_flutter/screens/market_list_card.dart';
import 'package:betterhodl_flutter/view_models/market_coins_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MarketList extends StatelessWidget {
  const MarketList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MarketCoinsViewModel marketCoinViewModels =
        context.watch<MarketCoinsViewModel>();
    return Scaffold(
        appBar: AppBar(
          title: const Text('BetterHodl'),
          actions: [
            IconButton(
                onPressed: () {
                  marketCoinViewModels.toggleLivePricing();
                },
                icon: const Icon(Icons.add_alert))
          ],
        ),
        body: Center(child: buildUI(marketCoinViewModels)));
  }

  buildUI(MarketCoinsViewModel marketCoinsViewModel) {
    if (marketCoinsViewModel.loading) {
      return const AppLoading();
    }
    return Column(children: [
      Row(children: [
        const Expanded(flex: 10, child: Text('Rank')),
        const Expanded(
            flex: 9,
            child:
                Align(alignment: Alignment.centerRight, child: Text('Coin'))),
        const Expanded(
            flex: 32,
            child:
                Align(alignment: Alignment.centerRight, child: Text('Price'))),
        const Expanded(
            flex: 20,
            child: Align(alignment: Alignment.centerRight, child: Text('24H'))),
        Expanded(
            flex: 30,
            child: Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                    key: const ValueKey('market_list_market_cap_button'),
                    child: const Text('Market Cap'),
                    onPressed: () {
                      marketCoinsViewModel.sortOrder =
                          marketCoinsViewModel.sortOrder ==
                                  SortOrders.marketCapDesc
                              ? SortOrders.marketCapAsc
                              : SortOrders.marketCapDesc;
                      marketCoinsViewModel.sort();
                    })))
      ]),
      Expanded(
          child: ListView.builder(
              itemCount: marketCoinsViewModel.marketCoins.length,
              itemBuilder: (context, index) {
                final marketCoin = marketCoinsViewModel.marketCoins[index];
                return GestureDetector(
                    child: MarketListCard(marketCoin: marketCoin),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CoinDetail(marketCoin)));
                    });
              }))
    ]);
  }
}

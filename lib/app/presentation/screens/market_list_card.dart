import 'package:betterhodl_flutter/domain/models/market_coin.dart';
import 'package:betterhodl_flutter/app/screens/screen_utils.dart';
import 'package:flutter/material.dart';

class MarketListCard extends StatelessWidget {
  final MarketCoin marketCoin;

  const MarketListCard({Key? key, required this.marketCoin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final percentColor = marketCoin.priceChangePercentage24h > 0 ? Colors.green.shade300 : Colors.red.shade400;
    return Row(children: [
      Expanded(
          flex: 7,
          child: Center(child: Text(marketCoin.marketCapRank.toString()))),
      Expanded(
          flex: 20,
          child: Column(children: [
            Image.network(marketCoin.image, width: 15, height: 15),
            Text(marketCoin.symbol)
          ])),
      Expanded(
          flex: 20,
          child: Align(
              alignment: Alignment.centerRight,
              child: Text(formatCurrency(marketCoin.currentPrice)))),
      Expanded(
          flex: 25,
          child: Align(
              alignment: Alignment.centerRight,
              child: Text(formatPercent(marketCoin.priceChangePercentage24h), style: TextStyle(color: percentColor),))),
      Expanded(
          flex: 30,
          child: Align(
              alignment: Alignment.centerRight,
              child: Text(formatCompactCurrency(marketCoin.marketCap))))
    ]);
  }
}

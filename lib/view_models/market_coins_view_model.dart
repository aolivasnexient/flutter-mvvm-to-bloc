import 'dart:convert';

import 'package:betterhodl_flutter/data/services/rest_service/api_status.dart';
import 'package:betterhodl_flutter/data/services/rest_service/rest_service.dart';
import 'package:betterhodl_flutter/data/services/socket_service/socket_service.dart';
import 'package:betterhodl_flutter/domain/models/market_coin.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

enum SortOrders { marketCapDesc, marketCapAsc }

class MarketCoinsViewModel extends ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;
  bool _livePricingEnabled = false;
  List<MarketCoin> _marketCoins = [];
  List<MarketCoin> get marketCoins => _marketCoins;
  Map<String, MarketCoin> marketCoinMap = {};
  final http.Client client;
  final SocketService socketService;
  var sortOrder = SortOrders.marketCapDesc;
  static const marketUrl =
      'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false';
  static const livePriceWss = 'wss://ws.coincap.io/prices?assets=';

  MarketCoinsViewModel(this.client, this.socketService);

  setLoading(bool loading) {
    _loading = loading;
    notifyListeners();
  }

  sort() {
    switch (sortOrder) {
      case SortOrders.marketCapDesc:
        _marketCoins.sort((a, b) => a.marketCapRank.compareTo(b.marketCapRank));
        break;
      case SortOrders.marketCapAsc:
        _marketCoins.sort((a, b) => b.marketCapRank.compareTo(a.marketCapRank));
        break;
      default:
    }
    notifyListeners();
  }

  toggleLivePricing() {
    if (_livePricingEnabled) {
      stopLivePrices();
    } else {
      listenForLivePrices();
    }
    _livePricingEnabled = !_livePricingEnabled;
  }

  getMarketCoins() async {
    setLoading(true);
    RestService restService = RestService(client);
    var response = await restService.get(marketUrl, marketCoinsFromJson);
    if (response is Success) {
      _marketCoins = response.response;
      for (var marketCoin in _marketCoins) {
        marketCoinMap[marketCoin.name.toLowerCase()] = marketCoin;
      }
    }
    setLoading(false);
  }

  listenForLivePrices() {
    var query = _getLivePriceQuery();
    socketService.connectAndListen(
        uri: Uri.parse(query),
        callback: livePriceUpdate,
        errorCallBack: livePriceError);
  }

  stopLivePrices() {
    socketService.stopListening();
  }

  livePriceUpdate(dynamic event) {
    print(event);
    updateMarketCoin(json.decode(event));
  }

  livePriceError(dynamic error) {
    // handle this
  }

  updateMarketCoin(Map<String, dynamic> priceData) {
    priceData.forEach((key, value) {
      marketCoinMap[key]?.currentPrice = double.parse(value);
    });
    notifyListeners();
  }

  String _getLivePriceQuery() {
    var buffer = StringBuffer(livePriceWss);
    var first = true;
    for (var marketCoin in _marketCoins) {
      if (!first) {
        buffer.write(',');
      }
      buffer.write(marketCoin.name.toLowerCase());
      first = false;
    }
    return buffer.toString();
  }
}

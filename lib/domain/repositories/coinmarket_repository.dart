import 'dart:convert';

import 'package:betterhodl_flutter/data/adapters/rest_adapter.dart';
import 'package:betterhodl_flutter/data/services/socket_service/socket_service.dart';

import '../models/market_coin.dart';

class CoinMarketRepository {

  Map<String, MarketCoin> marketCoinMap = {};

  final RestAdapter restAdaptar;
  final SocketService socketService;

  CoinMarketRepository(this.restAdaptar, this.socketService);

  Future<List<MarketCoin>> fethAllMarketCoin(String url) async {
    // TODO : HERE NEED TO CREATE APP LAYER
    final data = await restAdaptar.get(url);
    final marketCoins =  _decodeData(data);
    for (var marketCoin in marketCoins) {
      marketCoinMap[marketCoin.name] = marketCoin; 
    }
    return marketCoins;
  
  }

  List<MarketCoin> _decodeData(String data){

    final decodeData = json.decode(data);
    final models = (decodeData as List<Map>).map((e) => MarketCoin.fromJson(e));
    return models.toList();

  }
}





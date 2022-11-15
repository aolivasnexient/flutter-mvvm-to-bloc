import 'package:betterhodl_flutter/data/adapters/rest_adapter.dart';
import 'package:betterhodl_flutter/data/services/socket_service/socket_service_v2.dart';

import '../models/market_coin.dart';

class MarketCoinRepository {

  Map<String, MarketCoin> marketCoinMap = {};

  final RestAdapter restAdapter;
  final SocketServiceV2 socketService;

  MarketCoinRepository(this.restAdapter, this.socketService);

  Future<List<MarketCoin>> fethAllMarketCoin(String url) async {
    final data = (await restAdapter.get(url)) as List;
    final marketCoins =  data.map((e) => MarketCoin.fromJson(e)).toList();
    for (var marketCoin in marketCoins) {
      marketCoinMap[marketCoin.name.toLowerCase()] = marketCoin;
    }
    return marketCoins;
  
  }

  Stream<List<MarketCoin>> dataBaseStream(url) {
    final streamDb =  socketService.connectAndListen<Map>(uri: Uri.parse(url));
    return streamDb.map((event){
      final mapEntries = event.entries;
      for (var entry in mapEntries) {
        marketCoinMap.update(
          entry.key, 
          (coin) => coin.copyFrom(newCurrentPrice: double.parse(entry.value as String))
        );
      }
      return marketCoinMap.values.toList();
    });
  }

  Future<void> stopStream()async {
    await socketService.stopListening();
  }

}





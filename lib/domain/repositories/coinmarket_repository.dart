import 'package:betterhodl_flutter/data/services/rest_service/rest_service.dart';
import 'package:betterhodl_flutter/data/services/socket_service/socket_service.dart';

import '../models/market_coin.dart';

class CoinMarketRepository {

  Map<String, MarketCoin> marketCoinMap = {};

  final RestService restService;
  final SocketService socketService;

  CoinMarketRepository(this.restService, this.socketService);

  Future<List<MarketCoin>> fethAllMarketCoin() async{
    return[];
  }

}





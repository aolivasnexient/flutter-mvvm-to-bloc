
import 'package:betterhodl_flutter/data/services/rest_service/rest_service_v2.dart';
import 'package:betterhodl_flutter/data/services/socket_service/socket_service_v2.dart';
import 'package:betterhodl_flutter/domain/models/market_coin.dart';
import 'package:betterhodl_flutter/domain/repositories/marketcoin_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'marketcoin_repository_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<RestServiceV2>(),
  MockSpec<SocketServiceV2>()
])
void main() {
  
  late MarketCoinRepository marketCoinRepository;
  final socketService =  MockSocketServiceV2();
  final restAdapter = MockRestServiceV2();
  const url = 'https://nexient.com';
  setUpAll(() => marketCoinRepository = MarketCoinRepository(restAdapter, socketService));

  final List<Map> dataFromService = [
  {
    "id": "bitcoin",
    "symbol": "btc",
    "name": "Bitcoin",
    "image": "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579",
    "current_price": 23338,
    "market_cap": 445841127198,
    "market_cap_rank": 1,
    "high_24h": 27811,
    "low_24h": 22726,
    "price_change_24h": -4473.47338182243,
    "price_change_percentage_24h": -16.08514,
    "ath": 69045,
    "ath_change_percentage": -72.05881,
    "ath_date": "2021-11-10T14:24:11.849Z",
    "atl": 67.81,
    "atl_change_percentage": 28350.39313,
    "atl_date": "2013-07-06T00:00:00.000Z"},
  {
    "id":"theta-fuel",
    "symbol":"tfuel",
    "name":"Theta Fuel",
    "image":"https://assets.coingecko.com/coins/images/8029/large/1_0YusgngOrriVg4ZYx4wOFQ.png?1553483622",
    "current_price":0.0445775,
    "market_cap":1886178774,
    "market_cap_rank":31,
    "fully_diluted_valuation":null,
    "total_volume":12405517,
    "high_24h":0.04801865,
    "low_24h":0.04353184,
    "price_change_24h":0.00077699,
    "price_change_percentage_24h":1.77392,
    "market_cap_change_24h":49552231,
    "market_cap_change_percentage_24h":2.698,
    "circulating_supply":0.0,
    "total_supply":5301200000.0,
    "max_supply":null,"ath":0.68159,
    "ath_change_percentage":-93.38616,
    "ath_date":"2021-06-09T06:50:55.818Z",
    "atl":0.00090804,
    "atl_change_percentage":4864.46391,
    "atl_date":"2020-03-13T02:30:37.972Z",
    "roi":null,
    "last_updated":"2022-06-16T19:53:23.628Z"}];

  
  final rawDataStream = [
    {"bitcoin":"16538.73"},
    {"bitcoin":"16538.56"},
    {"bitcoin":"16538.60"},
  ];

  group("CoinMarket Repository -", () {
    
    test("model from json", () async {
      final models = dataFromService.map((e) => MarketCoin.fromJson(e),).toList();
      expect(models, isA<List<MarketCoin>>());
    },);

    test("fetching all marketcoins", () async{
      when(restAdapter.get(url)).thenAnswer(( _ ) async => dataFromService );
      final result = await marketCoinRepository.fethAllMarketCoin(url);
      expect(result, isList );
      expect(result.length, dataFromService.length );
      expect(marketCoinRepository.marketCoinMap.length, dataFromService.length);
      for (var coin in result) {
        expect(marketCoinRepository.marketCoinMap.containsKey(coin.name.toLowerCase()), true);
        expect(marketCoinRepository.marketCoinMap.containsValue(coin), true);
      }
    },);

    test("Stream Coin", () async {

      final marketCoinRepo = MarketCoinRepository(restAdapter, socketService);
      final dataStream = Stream.fromIterable(rawDataStream);
      
      when(restAdapter.get(url)).thenAnswer(( _ ) async => dataFromService );
      when(socketService.connectAndListen(uri: Uri.parse(url))).thenAnswer((_) => dataStream);
      
      await marketCoinRepo.fethAllMarketCoin(url);
      final streamResult = marketCoinRepo.dataBaseStream(url);

      final currentCoin = marketCoinRepo.marketCoinMap[rawDataStream.first.keys.first]!;
      final currentValue = double.parse(rawDataStream.first.values.first);

      expect(
        currentCoin.currentPrice != currentValue, 
        true
      );
      final coinsEmitted = await streamResult.first;
      expect(
        currentCoin.currentPrice == currentValue, 
        true
      );

      expect(coinsEmitted.first.currentPrice == currentValue, true);

      final result = await streamResult.toList();
      expect(dataStream, emitsInOrder(rawDataStream));
      expect(result.length, rawDataStream.length);

    },);



  },);


}










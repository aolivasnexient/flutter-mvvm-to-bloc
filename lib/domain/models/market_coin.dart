import 'dart:convert';

List<MarketCoin> marketCoinsFromJson(String str) =>
    List<MarketCoin>.from(json.decode(str).map((x) => MarketCoin.fromJson(x)));

class MarketCoin {
  final String id;
  final String symbol;
  final String name;
  final String image;
  double currentPrice;
  final double marketCap;
  final int marketCapRank;
  final double high24h;
  final double low24h;
  final double priceChange24h;
  final double priceChangePercentage24h;
  final double ath;
  final double athChangePercentage;
  final DateTime athDate;
  final double atl;
  final double atlChangePercentage;
  final DateTime atlDate;

  MarketCoin(
      {required this.id,
      required this.symbol,
      required this.name,
      required this.image,
      required this.currentPrice,
      required this.marketCap,
      required this.marketCapRank,
      required this.high24h,
      required this.low24h,
      required this.priceChange24h,
      required this.priceChangePercentage24h,
      required this.ath,
      required this.athChangePercentage,
      required this.athDate,
      required this.atl,
      required this.atlChangePercentage,
      required this.atlDate});

  factory MarketCoin.fromJson(Map json) {
    return MarketCoin(
      id: json['id'] as String,
      symbol: json['symbol'] as String,
      name: json['name'] as String,
      image: json['image'] as String,
      currentPrice: toDouble(json['current_price']),
      marketCap: toDouble(json['market_cap']),
      marketCapRank: json['market_cap_rank'] as int,
      high24h: toDouble(json['high_24h']),
      low24h: toDouble(json['low_24h']),
      priceChange24h: toDouble(json['price_change_24h']),
      priceChangePercentage24h: toDouble(json['price_change_percentage_24h']),
      ath: toDouble(json['ath']),
      athChangePercentage: toDouble(json['ath_change_percentage']),
      athDate: toDate(json['ath_date']),
      atl: toDouble(json['atl']),
      atlChangePercentage: toDouble(json['atl_change_percentage']),
      atlDate: toDate(json['atl_date']),
    );
  }

  toJson() => {
    "id":id,
    "symbol":symbol,
    "name":name,
    "image":image,
    "current_price":currentPrice,
    "market_cap":marketCap,
    "market_cap_rank":marketCapRank,
    "high_24h":high24h,
    "low_24h":low24h,
    "price_change_24h":priceChange24h,
    "price_change_percentage_24h": priceChangePercentage24h,
    "ath": ath,
    "ath_change_percentage": ath,
    "ath_date": athDate.toString(),
    "atl": atl,
    "atl_change_percentage": atlChangePercentage,
    "atl_date": atlDate.toString()};

  // market data is inconsistent between int and double values
  static double toDouble(dynamic value) {
    if (value != null) {
      if (value is int) return value.toDouble();
    } else {
      return 0.0;
    }
    return value;
  }

  static DateTime toDate(String value) {
    return DateTime.parse(value);
  }
}

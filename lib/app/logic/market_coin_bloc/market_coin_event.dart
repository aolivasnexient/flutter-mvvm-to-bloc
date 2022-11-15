part of 'market_coin_bloc.dart';

@immutable
abstract class MarketCoinEvent {}

class SetLivePrincingEvent extends MarketCoinEvent{
  final bool isLivePricing;
  SetLivePrincingEvent(this.isLivePricing);
}

class RequestMarketCoinsEvent extends MarketCoinEvent{}
class SortMarketCoinsEvent extends MarketCoinEvent{}

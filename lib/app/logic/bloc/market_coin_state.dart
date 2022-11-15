part of 'market_coin_bloc.dart';

class MarketCoinState extends Equatable{

  final bool isLoading;
  final bool isError;
  final String? errorMsg;
  final bool isLivePricing;
  final List<MarketCoin> marketCoins;
  
  const MarketCoinState({
    required this.isError,
    this.errorMsg,
    required this.isLoading, 
    required this.isLivePricing, 
    required this.marketCoins}
  );

  @override
  List<Object?> get props => [isLoading, isError,isLivePricing,marketCoins, errorMsg];

  MarketCoinState copyWith({
    bool? isLoading,
    bool? isError,
    String? errorMsg,
    bool? isLivePricing,
    List<MarketCoin>? marketCoins,
  }) => MarketCoinState(
    isLoading : isLoading ?? this.isLoading,
    isError: isError ?? this.isError,
    errorMsg: errorMsg,
    isLivePricing : isLivePricing ?? this.isLivePricing, 
    marketCoins : marketCoins ?? this.marketCoins
  );

}


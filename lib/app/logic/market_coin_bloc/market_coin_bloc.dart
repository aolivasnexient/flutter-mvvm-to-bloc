import 'package:betterhodl_flutter/domain/repositories/marketcoin_repository.dart';
import 'package:betterhodl_flutter/helpers/url_helper.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';

import '../../../domain/models/market_coin.dart';

part 'market_coin_event.dart';
part 'market_coin_state.dart';

class MarketCoinBloc extends Bloc<MarketCoinEvent, MarketCoinState> {

  final MarketCoinRepository marketCoinRepository;
  

  MarketCoinBloc(this.marketCoinRepository) : super(
    const MarketCoinState(isLoading: false , isError: false, isLivePricing: false, marketCoins: [])
    ) {
    on<RequestMarketCoinsEvent>(requestEventController);
    on<SortMarketCoinsEvent>(sortEventController);
    on<SetLivePrincingEvent>(setLiveController);

  }


  requestEventController(RequestMarketCoinsEvent event , Emitter<MarketCoinState> emit)async{

    emit(state.copyWith(isLoading: true));
    try {
      final resp = await marketCoinRepository.fethAllMarketCoin(UrlHelper.marketUrl);
      emit(state.copyWith(isLoading: false, marketCoins: resp));
    } catch (e) {
      emit(state.copyWith(isError: true, isLoading: false, errorMsg: e.toString()));
    }
  
  }

  sortEventController(SortMarketCoinsEvent event , Emitter<MarketCoinState> emit)async{
    final reversedData = marketCoinRepository.reverseOrder();
    emit(state.copyWith(marketCoins: reversedData, isLoading: false));
  }

  setLiveController(SetLivePrincingEvent event , Emitter<MarketCoinState> emit)async{
    if(!event.isLivePricing){
      await marketCoinRepository.stopStream();
      emit(state.copyWith(isLivePricing: false));
      return;
    } 
    emit(state.copyWith(isLivePricing: true));
    await emit.forEach<List<MarketCoin>>( // <----- HERE STREAM ENDS
      marketCoinRepository.dataBaseStream(_getLivePriceQuery()), 
      onError: (error, stackTrace) => state.copyWith(isError: true,errorMsg: error.toString()),
      onData: (data) => state.copyWith(marketCoins: data ,isError: false)
    );
  }


  String _getLivePriceQuery() {
    var buffer = StringBuffer(UrlHelper.livePriceWss);
    var first = true;
    for (var marketCoin in state.marketCoins) {
      if (!first) {
        buffer.write(',');
      }
      buffer.write(marketCoin.name.toLowerCase());
      first = false;
    }
    return buffer.toString();
  }

}

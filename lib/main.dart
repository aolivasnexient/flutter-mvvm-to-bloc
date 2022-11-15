import 'package:betterhodl_flutter/data/services/socket_service/socket_service.dart';
import 'package:betterhodl_flutter/app/screens/market_list.dart';
import 'package:betterhodl_flutter/data/services/socket_service/socket_service_v2.dart';
import 'package:betterhodl_flutter/domain/repositories/marketcoin_repository.dart';
import 'package:betterhodl_flutter/view_models/market_coins_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import 'data/services/rest_service/rest_service_v2.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final marketCoinViewModels =
      MarketCoinsViewModel(http.Client(), SocketService());
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    marketCoinViewModels.getMarketCoins();
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: ( _ ) => MarketCoinRepository(RestServiceV2(http.Client()), SocketServiceV2()),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData.dark(),
        home: const MarketList(),
      ),
    );
  }
}

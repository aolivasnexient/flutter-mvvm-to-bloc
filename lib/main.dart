import 'package:betterhodl_flutter/data/services/socket_service/socket_service.dart';
import 'package:betterhodl_flutter/app/screens/market_list.dart';
import 'package:betterhodl_flutter/view_models/market_coins_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

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
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => marketCoinViewModels)
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData.dark(),
          home: const MarketList(),
        ));
  }
}

import 'package:betterhodl_flutter/app/presentation/widgets/app_loading.dart';
import 'package:betterhodl_flutter/app/presentation/screens/coin_detail.dart';
import 'package:betterhodl_flutter/app/presentation/screens/market_list_card.dart';
import 'package:betterhodl_flutter/domain/repositories/marketcoin_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/market_coin_bloc/market_coin_bloc.dart';
import '../widgets/socket_button.dart';

class MarketList extends StatelessWidget {
  const MarketList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MarketCoinBloc(RepositoryProvider.of<MarketCoinRepository>(context)),
      child: const Scaffold(
          appBar: CoinAppBar(),
          body: Center(child: CoinTable()),
    ));
  }
}



class CoinAppBar extends StatelessWidget with PreferredSizeWidget {
  const CoinAppBar({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('BetterHodl'),
      actions: [
        BlocBuilder<MarketCoinBloc, MarketCoinState>(
          buildWhen: (previous, current) => previous.isLivePricing != current.isLivePricing,
          builder: (context, state) {
            final isLiveActive = state.isLivePricing;
            return SocketButton(
              isActive: isLiveActive,
              onPressed: () => context.read<MarketCoinBloc>().add(SetLivePrincingEvent(!isLiveActive)), 
            );
          },
        )
      ],
    );
  }
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

}


class CoinTable extends StatelessWidget {
  const CoinTable({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<MarketCoinBloc>(context, listen: false).add(RequestMarketCoinsEvent());
    return BlocBuilder<MarketCoinBloc, MarketCoinState>(
      builder: (context, state) {

        if (state.isLoading) {
          return const AppLoading();
        }

        return Column(children: [
          Row(children: [
            Expanded(
              flex: 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('Rank'),
                  Text('Coin'),
                  SizedBox(
                    width: 25,
                  ),
                  Text('Price'),
                  SizedBox(
                    width: 20,
                  ),
                  Text('24H'),
                  SizedBox(),
                ],
              ),
            ),

            Expanded(
              child: TextButton(
                  key: const ValueKey('market_list_market_cap_button'),
                  child: const Text('Market Cap'),
                  onPressed: () {
                    context.read<MarketCoinBloc>().add(SortMarketCoinsEvent());      
                  }),
            )
          ]),


          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => const Divider(),
              itemCount: state.marketCoins.length,
              itemBuilder: (context, index) {
                final marketCoin = state.marketCoins[index];
                return GestureDetector(
                  child: MarketListCard(marketCoin: marketCoin),
                  onTap: () {
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CoinDetail(marketCoin)));
                   }
                );
              },
            )
          )

        ]);
      },
    );
  }
}

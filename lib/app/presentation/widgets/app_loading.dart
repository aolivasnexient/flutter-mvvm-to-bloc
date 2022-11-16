import 'package:flutter/cupertino.dart';

class AppLoading extends StatelessWidget {
  const AppLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const Center(
      child: CupertinoActivityIndicator(),
  );

}

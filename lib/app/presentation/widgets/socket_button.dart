import 'package:flutter/material.dart';

class SocketButton extends StatelessWidget {
  const SocketButton({
    Key? key,
    required this.onPressed,
    required this.isActive
  }) : super(key: key);

  final void Function()? onPressed;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    final icon  = isActive ? Icons.flash_on : Icons.flash_off;
    final color = isActive ? Colors.green : Colors.red;
    return IconButton(
      key: const Key('live_pricing_button'),
      onPressed: onPressed,
      icon: Icon(icon, color: color)
    );
  }
}
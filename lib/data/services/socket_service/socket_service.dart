import 'dart:convert';

import 'package:web_socket_channel/web_socket_channel.dart';

class SocketService {
  late WebSocketChannel channel;

  SocketService();

  Stream<T> connectAndListen<T>({required Uri uri,}) {
    channel = WebSocketChannel.connect(uri);
    return channel.stream.map<T>((event) => json.decode(event)
  );
  }

  Future<void> stopListening() async{
    await channel.sink.close();
  }
}

import 'dart:convert';

import 'package:web_socket_channel/web_socket_channel.dart';

class SocketService {
  late WebSocketChannel channel;

  SocketService();

  Stream<T> connectAndListen<T>({required Uri uri,}) {
    channel = WebSocketChannel.connect(uri);
    return channel.stream.map<T>((event) => json.decode(event));
  }

  stopListening() {
    channel.sink.close();
  }
}
/*
{"bitcoin":"16538.73","ethereum":"1234.94","monero":"127.94","klaytn":"0.181026"}
{"bitcoin":"16538.56","tron":"0.048814","quant":"107.68"}
{"bitcoin":"16538.60","ethereum":"1234.93"}
{"bitcoin":"16538.68","1inch":"0.506782"}
{"bitcoin":"16538.74","xrp":"0.341196","dogecoin":"0.085102","cardano":"0.326901","solana":"13.64","algorand":"0.252939","vechain":"0.018916","fantom":"0.177108"}
{"polygon":"0.908349"}
{"bitcoin":"16538.73","xrp":"0.341197","tron":"0.048815","avalanche":"13.05","stellar":"0.087322"}
*/

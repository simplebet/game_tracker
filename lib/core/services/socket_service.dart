import 'dart:async';
import 'dart:developer';

import 'package:game_tracker/init_params.dart';
import 'package:phoenix_socket/phoenix_socket.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'socket_service.g.dart';

@Riverpod(keepAlive: false)
Future<SocketService> socketService(SocketServiceRef ref) async {
  const localApiKey = String.fromEnvironment('api_key');
  const localPartnerOrigin = String.fromEnvironment('partner_origin');
  const socketUrl = String.fromEnvironment('socket_url');
  final apiKey = getParameterValue('api_key') ?? localApiKey;
  final partnerOrigin =
      getParameterValue('partner_origin') ?? localPartnerOrigin;

  final socketParams = {
    'api_key': apiKey,
    'partner_origin': partnerOrigin,
  };

  final socket = PhoenixSocket(
    socketUrl,
    socketOptions: PhoenixSocketOptions(params: socketParams),
  );
  final socketService = SocketService(socket: socket);
  await socketService.connect();

  return socketService;
}

class SocketService {
  SocketService({required PhoenixSocket socket}) {
    _socket = socket;
  }
  late PhoenixSocket _socket;

  Future<void> refresh() async {
    if (!_socket.isConnected) {
      await connect();
    }
  }

  Future<void> connect() async {
    try {
      await _socket.connect();
    } catch (e, stackTrace) {
      // TODO: log connection error, attempt retrying with a backup strategy
      log(e.toString(), stackTrace: stackTrace);
    }
  }

  PhoenixSocket get socket => _socket;

  void disconnect() {
    _socket.close();
  }

  PhoenixChannel addChannel({
    required String topic,
    Map<String, dynamic> parameters = const {},
  }) {
    return _socket.addChannel(topic: topic, parameters: parameters);
  }

  void leaveChannel(String topic) {
    final channel = _socket.channels[topic];

    if (channel != null) {
      _socket.removeChannel(channel);
    }
  }
}

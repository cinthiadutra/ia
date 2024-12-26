import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:bkopen/app/core/data/ex_co_notification_dto.dart';
import 'package:bkopen/app/services/local_storage/local_storage.dart';
import 'package:bkopen/notifications/data/models/ex_co_websoxket_dto.dart';
import 'package:get/get.dart';
import 'package:web_socket_channel/io.dart';

class WebSocketService extends GetxController {
  IOWebSocketChannel? channel;
  Rx<List<ExCoNotificationDto>> messageList = Rx([]);
  RxList<String> receivedMessages = <String>[].obs;

  final storage = Get.find<LocalStorage>();

  bool isConnected = false;
  Timer? pingTimer;

  Future<void> initConnection() async {
    // Usando RetryOptions para tentativa de reconexão
    try {
      var token = await storage.get('token');
      final url =
          'wss://api.hmg-bkhub.bkopen.com/ws/appfoundation/cowebsocket/?Authorization=$token';

      channel = IOWebSocketChannel.connect(
        Uri.parse(url),
        headers: {
          "origin": "https://hmg-bkhub.bkopen.com",
        },
      );
      listenToMessages();

      if (channel != null && channel?.sink != null) {
        log('Conexão WebSocket ativa');

        // channel?.sink.add(jsonPayload);
      } else {
        log('Conexão WebSocket inativa');
        isConnected = false;
      }
    } catch (e) {
      log('Erro ao inicializar conexão: $e');
    }
  }

  void reconnect() {
    if (!isConnected) {
      log('Tentando reconectar...');
      Future.delayed(const Duration(seconds: 5), () {
        initConnection();
      });
    }
  }

  void listenToMessages() {
    channel?.stream.listen(
      (data) {
        log('Mensagem recebida: $data');
        if (data != null && data.isNotEmpty) {
          try {
            final Map<String, dynamic> json = jsonDecode(data);
            final payload = json['payload'];

            // Verificar se há um erro na mensagem
            if (payload['withError'] == true) {
              log('Erro na mensagem recebida: ${payload['comessageList']}');
              // Pode optar por exibir um alerta ou mensagem de erro na interface, ou apenas logar
              channel?.sink.close();
              isConnected = false;
              return reconnect();
            }

            final newMessage = ExCoNotificationDto.fromMap(payload);
            if (!messageList.value.any((msg) => msg == newMessage)) {
              messageList.value.add(newMessage);

              update();
              // Rolar automaticamente para a última mensagem
            }
            isConnected = true;
          } catch (e) {
            log('Erro ao decodificar a mensagem: $e');
            isConnected = false;
          }
        } else {
          reconnect();
        }
      },
      onDone: () {
        log('Conexão WebSocket fechada.');
        isConnected = false;
        reconnect();
      },
      onError: (error) {
        isConnected = false;
        reconnect(); // Tentativa de reconexão
        log('Erro no WebSocket: $error');
      },
    );
  }

  Future<void> sendMesssage(
      {required String message,
      required int sPersonaId,
      required int sMindId}) async {
    if (!isConnected || channel == null) {
      log('Não conectado, não é possível enviar a mensagem.');
      isConnected = false;
      reconnect();
    } else if (isConnected && channel != null) {
      final msg = ExCoWebSocketDto(
          classname: 'ExCoWebSocketDTO',
          type: "Notification",
          payload: {
            'message': message,
          });
      final jsonPayload = jsonEncode(msg.toMap());
      try {
        channel?.sink.add(jsonPayload);
        log('Mensagem enviada: $jsonPayload');
      } catch (e) {
        log('Erro ao enviar mensagem: $e');
        isConnected = false;
        reconnect(); // Tentar reconectar se necessário
      }
    } else {
      log('Não conectado, não é possível enviar a mensagem.');
      reconnect(); // Tentar reconectar se necessário
    }
  }

  void stopPing() {
    pingTimer?.cancel();
    pingTimer = null;
  }

  void closeConnection() {
    channel?.sink.close();
    isConnected = false;
    stopPing();
    log('Conexão WebSocket fechada.');
  }

  // void startPing() {
  //   stopPing();
  //   pingTimer = Timer.periodic(const Duration(seconds: 30), (timer) {
  //     if (isConnected) {
  //       log('Enviando ping...');
  //       channel?.sink.add('ping');
  //     }
  //   });
  // }
}

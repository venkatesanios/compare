import 'dart:async';
import 'dart:developer';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

class MqttService {
  late MqttServerClient client;
  StreamSubscription? mqttListen;

  MqttService._();

  static final MqttService _instance = MqttService._();

  factory MqttService() {
    return _instance;
  }

  Future<void> initMqtt() async {
    client = MqttServerClient('192.168.1.141', 'local ubuntu')
      ..logging(on: false)
      ..port = 1883
      ..keepAlivePeriod = 60
      ..logging(on: false)
      ..onDisconnected = _onDisconnected
      ..onSubscribed = _onSubscribed
      ..onConnected = _onConnected
      ..onUnsubscribed = _onUnsubscribed
      ..onSubscribeFail = _onSubscribeFail;

    final mqttMsg = MqttConnectMessage()
        .withWillMessage('connection-failed')
        .withWillTopic('willTopic')
        .startClean()
        .withWillQos(MqttQos.atLeastOnce)
        .withWillTopic('failed');
    client.connectionMessage = mqttMsg;
    await _connectMqtt();
  }

  void _onConnected() {
    log('Connected');
    // listenMqtt();
  }

  void _onDisconnected() {
    log('Disconnected');
  }

  void _onSubscribed(String? topic) {
    log('Subscribed to topic: $topic');
  }

  void _onUnsubscribed(String? topic) {
    log('Unsubscribed from topic: $topic');
  }

  void _onSubscribeFail(String? topic) {
    log('Failed to subscribe to topic: $topic');
  }

  Future<void> _connectMqtt() async {
    if (client.connectionStatus!.state != MqttConnectionState.connected) {
      try {
        await client.connect();
      } catch (e) {
        log('Connection failed: $e');
      }
    } else {
      log('MQTT Server already connected');
    }
  }

  Future<void> disconnectMqtt() async {
    if (client.connectionStatus!.state == MqttConnectionState.connected) {
      try {
        client.disconnect();
      } catch (e) {
        log('Disconnection failed: $e');
      }
    } else {
      log('MQTT Server already disconnected');
    }
  }

  void subscribeTopic(String topic) {
    final state = client.connectionStatus?.state;
    if (state == MqttConnectionState.connected) {
      client.subscribe(topic, MqttQos.atLeastOnce);
    } else {
      log('Cannot subscribe to topic: $topic. MQTT Server not connected');
    }
  }

  void publish(String topic, String message, {bool retain = false}) {
    final builder = MqttClientPayloadBuilder();
    builder.addString(message);
    client.publishMessage(topic, MqttQos.atLeastOnce, builder.payload!, retain: retain);
    builder.clear();
  }

  void unSubscribeTopic(String topic) {
    final state = client.connectionStatus?.state;
    if (state == MqttConnectionState.connected) {
      client.unsubscribe(topic);
    } else {
      log('Cannot unsubscribe from topic: $topic. MQTT Server not connected');
    }
  }

  void listenMqtt(Function(String) callback) {
    mqttListen = client.updates!.listen((dynamic t) {
      MqttPublishMessage recMessage = t[0].payload;
      final message =
      MqttPublishPayload.bytesToStringAsString(recMessage.payload.message);
      callback(message);
      log(message);
    });

  }}

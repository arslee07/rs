import 'dart:io' show Platform;

import 'package:rs/rs.dart';
import 'package:volt/volt.dart';

import 'commands/general.dart';
import 'commands/latest.dart';
import 'commands/randoms.dart';

Future<void> main() async {
  if (Platform.environment['RS_TOKEN'] == null) {
    return print('The token is not exported! Export it using this command:\n'
        'export RS_TOKEN=<TOKEN>');
  }

  final bot = Volt(Platform.environment['RS_TOKEN']!);
  final rs = RevoltSocial();

  // General
  bot.onMessageReceived
      .where((event) => event.message.content == 'rs.help')
      .listen((event) => helpCommand(event.message));

  // Random
  bot.onMessageReceived
    ..where((event) => event.message.content == 'rs.random')
        .listen((event) => randomCommand(event.message))
    ..where((event) => event.message.content == 'rs.random bot')
        .listen((event) => randomBotCommand(event.message, rs))
    ..where((event) => event.message.content == 'rs.random server')
        .listen((event) => randomServerCommand(event.message, rs));

  // Latest
  bot.onMessageReceived
    ..where((event) => event.message.content == 'rs.latest')
        .listen((event) => latestCommand(event.message))
    ..where((event) => event.message.content == 'rs.latest bot')
        .listen((event) => latestBotCommand(event.message, rs))
    ..where((event) => event.message.content == 'rs.latest server')
        .listen((event) => latestServerCommand(event.message, rs));
}

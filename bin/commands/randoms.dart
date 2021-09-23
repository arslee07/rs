import 'package:rs/rs.dart';
import 'package:volt/volt.dart';

import '../utlis/strings.dart';

Future<void> randomCommand(Message message) =>
    message.reply(MessageBuilder.content(randomHelp));

Future<void> randomBotCommand(Message message, RevoltSocial rs) async {
  await message.reply(MessageBuilder.content(
    botInfo(((await rs.fetchBots())..shuffle()).first),
  ));
}

Future<void> randomServerCommand(Message message, RevoltSocial rs) async {
  await message.reply(MessageBuilder.content(
    serverInfo(((await rs.fetchServers())..shuffle()).first),
  ));
}

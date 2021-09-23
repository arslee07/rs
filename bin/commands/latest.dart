import 'package:rs/rs.dart';
import 'package:volt/volt.dart';

import '../utlis/strings.dart';

Future<void> latestCommand(Message message) =>
    message.reply(MessageBuilder.content(latestHelp));

Future<void> latestBotCommand(Message message, RevoltSocial rs) async {
  final bots = await rs.fetchBots()
    ..sort((a, b) => b.issueId.compareTo(a.issueId));

  await message.reply(MessageBuilder.content(botInfo(bots.first)));
}

Future<void> latestServerCommand(Message message, RevoltSocial rs) async {
  final servers = await rs.fetchServers()
    ..sort((a, b) => b.issueId.compareTo(a.issueId));

  await message.reply(MessageBuilder.content(serverInfo(servers.first)));
}

import 'package:rs/rs.dart';

const help = '''
  ### General:
  > `rs.help` - this commands
  ****
  ### Random:
  > `rs.random bot` - show a random bot
  > `rs.random server` - show a random server
  ****
  ### Latest:
  > `rs.latest bot` - show the latest bot added to revolt.social
  > `rs.latest server` - show the latest server added to revolt.social
  ''';

const latestHelp = '''
  Use one of theese commands:
  > `rs.latest bot` - show the latest bot added to revolt.social
  > `rs.latest server` - show the latest server added to revolt.social
  ''';

const randomHelp = '''
  Use one of theese commands:
  > `rs.random bot` - show a random bot
  > `rs.random server` - show a random server
  ''';

String botInfo(Bot bot) => '''
  > ## **[${bot.name}](${bot.inviteUrl})**
  > **Description**: ${bot.longDescription}
  > **Tags**: ${bot.tags.join(", ")}
  > **Prefix**: ${bot.prefix} (${bot.helpCommand})
  > **Owner**: ${bot.ownerName}
  ''';

String serverInfo(Server server) => '''
  > ## **[${server.name}](${server.inviteUrl})**
  > **Description**: ${server.longDescription}
  > **Tags**: ${server.tags.join(", ")}
  > **Owner**: ${server.ownerName}
  ''';

import 'package:volt/volt.dart';

import '../utlis/strings.dart';

Future<void> helpCommand(Message message) =>
    message.reply(MessageBuilder.content(help));

/// A tiny revolt.social wrapper.
library rs;

import 'dart:convert' show utf8, jsonDecode;
import 'package:http/http.dart' show get;

typedef RawApiMap = Map<String, dynamic>;

/// revolt.social server.
class Server {
  final int issueId;
  final String name;
  final String id;
  final String shortDescription;
  final String longDescription;
  final List<String> tags;
  final String ownerName;
  final String ownerId;
  final String inviteUrl;
  final int users;
  final String avatarUrl;

  Server._new(RawApiMap raw)
      : issueId = raw['issue_id'] as int,
        name = raw['name'] as String,
        id = raw['id'] as String,
        shortDescription = raw['short'] as String,
        longDescription = raw['long'] as String,
        tags = [for (final tag in raw['tags'] as List) tag as String],
        ownerName = raw['owner_name'] as String,
        ownerId = raw['owner_id'] as String,
        inviteUrl = raw['invite'] as String,
        users = raw['users'] as int,
        avatarUrl = raw['avatar'] as String;
}

/// revolt.social bot.
class Bot {
  final int issueId;
  final String name;
  final String id;
  final String shortDescription;
  final String longDescription;
  final List<String> tags;
  final String ownerName;
  final String ownerId;
  final String botId;
  final String inviteUrl;
  final String supportUrl;
  final String prefix;
  final String helpCommand;
  final String library;
  final int servers;
  final String avatarUrl;

  Bot._new(RawApiMap raw)
      : issueId = raw['issue_id'] as int,
        name = raw['name'] as String,
        id = raw['id'] as String,
        shortDescription = raw['short'] as String,
        longDescription = raw['long'] as String,
        tags = [for (final tag in raw['tags'] as List) tag as String],
        ownerName = raw['owner_name'] as String,
        ownerId = raw['owner_id'] as String,
        botId = raw['bot_id'] as String,
        inviteUrl = raw['invite'] as String,
        supportUrl = raw['support'] as String,
        prefix = raw['prefix'] as String,
        helpCommand = raw['help'] as String,
        library = raw['library'] as String,
        servers = raw['servers'] as int,
        avatarUrl = raw['avatar'] as String;
}

/// A tiny revolt.social wrapper.
class RevoltSocial {
  static final botsUrl = Uri.parse(
      'https://raw.githubusercontent.com/RevoltSocial/lists/main/bots.json');
  static final serversUrl = Uri.parse(
      'https://raw.githubusercontent.com/RevoltSocial/lists/main/servers.json');

  Future<List<Bot>> fetchBots() async => List<Bot>.from(
      (jsonDecode(utf8.decode((await get(botsUrl)).bodyBytes)) as List)
          .map((e) => Bot._new(e as RawApiMap)));

  Future<List<Server>> fetchServers() async => List<Server>.from(
      (jsonDecode(utf8.decode((await get(serversUrl)).bodyBytes)) as List)
          .map((e) => Server._new(e as RawApiMap)));
}

import 'dart:convert';

import 'package:flagsmith/flagsmith.dart';

class ConfigService {
  static const _apikey = 'RtHZzkdFU4hTMnAaVpjupy';

  late final FlagsmithClient _flagsmithClient;

  late final String _apphudKey;

  late final String _privacyLink;
  late final String _termsLink;

  Future<ConfigService> init() async {
    _flagsmithClient = await FlagsmithClient.init(
      apiKey: _apikey,
      config: const FlagsmithConfig(
        caches: true,
      ),
    );
    await _flagsmithClient.getFeatureFlags(reload: true);

    final config =
        jsonDecode(await _flagsmithClient.getFeatureFlagValue(ConfigKey.config.name) ?? '')
            as Map<String, dynamic>;

    _apphudKey = config[ConfigKey.apphudKey.name] as String;
    _privacyLink = config[ConfigKey.privacyLink.name] as String;
    _termsLink = config[ConfigKey.termsLink.name] as String;
    return this;
  }

  void closeClient() => _flagsmithClient.close();

  String get apphudKey => _apphudKey;

  String get privacyLink => _privacyLink;

  String get termsLink => _termsLink;
}

enum ConfigKey { config, apphudKey, privacyLink, termsLink }

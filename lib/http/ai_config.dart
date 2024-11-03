import 'package:openai_flutter/http/ai_exception.dart';

class AIConfigBuilder {
  String? _apiKey;
  String? _proxy;
  String? _organization;
  late String _chatUrl;
  static final AIConfigBuilder _instance = AIConfigBuilder._();

  static void init(String apiKey,
      {String? proxy,
      String? organization,
      String chatUrl = "https://api.openai.com/v1/chat/completions"}) {
    _instance._apiKey = apiKey;
    _instance._proxy = proxy;
    _instance._organization = organization;
    _instance._chatUrl = chatUrl;
  }

  static AIConfigBuilder get instance {
    if(_instance._apiKey == null) {
      throw AIException("Please call AIConfigBuilder.init() first");
    }
    return _instance;
  }

  Map<String, String> headers() {
    final Map<String, String> headers = <String, String> {
      "Content-Type": "application/json",
    };
    assert(_apiKey != null, "需要设置API Key才能发送请求");
    if (_organization != null) {
      headers["OpenAI-Organization"] = _organization!;
    }
    if(_apiKey?.startsWith("Bearer ") ?? false) {
      headers["Authorization"] = _apiKey!;
    } else {
      headers["Authorization"] = "Bearer $_apiKey";
    }
    return headers;
  }

  String get chatUrl => _chatUrl;

  String? get proxy => _proxy;

  void setProxy(String proxy) {
    _proxy = proxy;
  }

  AIConfigBuilder._();
}

import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:openai_flutter/core/ai_completion.dart';
import 'package:openai_flutter/http/ai_config.dart';

// const apiKey = "";
const proxy = "192.168.1.8:7890";

void main() {
  test('test createChat', () async {
    AIConfigBuilder.init(apiKey, proxy: proxy);
    var response = await AICompletion().createChat(prompt: "讲个笑话", maxTokens: 1000);
    var choices = response.choices?.first;
    expect(choices?.message?.content, isNotEmpty);
    debugPrint(choices?.message?.content ?? "");
  });
}

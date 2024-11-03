import 'package:openai_flutter/core/interfaces/ai_create.dart';
import 'package:openai_flutter/http/ai_config.dart';
import 'package:openai_flutter/http/ai_http.dart';
import 'package:openai_flutter/models/ai_response.dart';

class AICompletion implements AICreateInterface {
  @override
  Future<AIResponse> createChat(
      {String model = "gpt-3.5-turbo",
      prompt,
      int? maxTokens = 200,
      double? temperature,
      double? topP,
      int? n,
      String? stop,
      String? user}) async {
    assert(prompt is String, "prompt field must be a String");
    return await AIHttp.post(
        url: AIConfigBuilder.instance.chatUrl,
        onSuccess: (Map<String, dynamic> response) {
          return AIResponse.fromJson(response);
        },
        body: {
          "model": model,
          if (prompt != null)
            "messages": [
              {
                "role": "user",
                "content": prompt,
              }
            ],
          if (maxTokens != null) "max_tokens": maxTokens,
          if (temperature != null) "temperature": temperature,
          if (topP != null) "top_p": topP,
          if (n != null) "n": n,
          if (stop != null) "stop": stop,
          if (user != null) "user": user
        });
  }
}

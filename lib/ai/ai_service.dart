import 'dart:convert';
import 'package:http/http.dart' as http;

class AIService {

  static const String apiKey = "YOUR_OPENROUTER_API_KEY";

  static Future<String> generateLyrics({
    required String title,
    required String genre,
    required String mood,
    required String artist,
    required String prompt,
  }) async {

    final response = await http.post(

      Uri.parse("https://openrouter.ai/api/v1/chat/completions"),

      headers: {

        "Authorization": "Bearer $apiKey",

        "Content-Type": "application/json",

      },

      body: jsonEncode({

        "model": "openai/gpt-4.1-mini",

        "messages": [

          {

            "role":"user",

            "content":

            """
Write a complete song.

Title: $title

Genre: $genre

Mood: $mood

Artist Style: $artist

Description:

$prompt

Generate verses, chorus and bridge.

"""

          }

        ]

      }),

    );

    if(response.statusCode==200){

      final data=jsonDecode(response.body);

      return data["choices"][0]["message"]["content"];

    }

    return "Failed to generate lyrics.";

  }

}

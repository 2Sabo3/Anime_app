import 'dart:convert';

import 'package:apiproject/Services/anime.dart';
import 'package:http/http.dart' as http;

class AnimeApi {
  static var client = http.Client();

  static Future<Anime> fetchdata() async {
    var animeModel;
    final url = Uri.parse('https://api.aniapi.com/v1/anime');
    var reponse = await client.get(url);
    if (reponse.statusCode == 200) {
      var jsonString = reponse.body;
      var data = jsonDecode(jsonString);
      var animeModel = Anime.fromJson(data);

      return animeModel;
    } else {}
    return animeModel;
  }
}

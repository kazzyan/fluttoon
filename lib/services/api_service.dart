import 'dart:convert';

import 'package:fluttoon/models/detail_model.dart';
import 'package:fluttoon/models/episode_model.dart';
import 'package:fluttoon/models/webtoon_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl =
      "https://webtoon-crawler.nomadcoders.workers.dev";
  static const String today = "today";

  static Future<List<WebtoonModel>> getTodaysToons() async {
    final url = Uri.parse("$baseUrl/$today");
    final response = await http.get(url);
    List<WebtoonModel> todaysWebtoonsInstance = [];

    if (response.statusCode == 200) {
      final webtoons = jsonDecode(response.body);
      for (var webtoon in webtoons) {
        todaysWebtoonsInstance.add(WebtoonModel.fromJson(webtoon));
      }

      return todaysWebtoonsInstance;
    }
    throw Error();
  }

  static Future<DetailModel> getToonById(String id) async {
    final url = Uri.parse("$baseUrl/$id");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final detail = jsonDecode(response.body);

      return DetailModel.fromJson(detail);
    }
    throw Error();
  }

  static Future<List<EpisodeModel>> getLatestEpisodesById(String id) async {
    final url = Uri.parse("$baseUrl/$id/episodes");
    final response = await http.get(url);
    List<EpisodeModel> episodesInstance = [];

    if (response.statusCode == 200) {
      final episodes = jsonDecode(response.body);
      for (var episode in episodes) {
        episodesInstance.add(EpisodeModel.fromJson(episode));
      }
      return episodesInstance;
    }
    throw Error();
  }
}

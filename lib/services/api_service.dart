//Apiで　データをfetchしてJSONになったデータを　dart classにかえて　あと
//全てのclassを　Listに入れて　そのListを変換した。

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:webtoon/models/webtoon_,model.dart';
import 'package:webtoon/models/webtoon_detail_model.dart';
import 'package:webtoon/models/webtoon_episode_model.dart';

class ApiService{
  static const String baseUrl =  "https://webtoon-crawler.nomadcoders.workers.dev";
  static const today = "today";

  static Future<List<WebtoonModel>> getTodaysToons() async{
    List<WebtoonModel> webtoonInstances = [];

    final url = Uri.parse('$baseUrl/$today');
    final response = await http.get(url);
    if(response.statusCode == 200){//200じゃなかったら　throw Error
      final webtoons = jsonDecode(response.body);

      for(var webtoon in webtoons){
        final instance = WebtoonModel.fromJson(webtoon);
        webtoonInstances.add(instance);
      }//responseのbody サーバに送る　データがある
      return webtoonInstances;
    }
    throw Error();
  }

  static Future<WebtoonDetailModel> getToonById(String id) async{
    final url = Uri.parse('$baseUrl/$id');
    final response = await http.get(url);
    if(response.statusCode == 200){
      final webtoon = jsonDecode(response.body);
      return WebtoonDetailModel.fromJson(webtoon);
    }
    throw Error();
  }

  static Future<List<WebtoonEpisodeModel>> getLatestEpisodesById(String id) async{
    List<WebtoonEpisodeModel> episodesInstances = [];
    final url = Uri.parse('$baseUrl/$id/episodes');
    final response = await http.get(url);
    if(response.statusCode == 200){
      final episodes = jsonDecode(response.body);
      for(var episode in episodes){
        episodesInstances.add(WebtoonEpisodeModel.fromJson(episode));
      }
      return episodesInstances;
    }
    throw Error();
  }
}

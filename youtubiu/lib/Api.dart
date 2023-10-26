import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:youtubiu/Video.dart';

String CHAVE_YOUTUBE = 'XXXXXXXXXXXXXXXXXXXXXXXXXX';
String ID_CHANNEL = 'UCI7xQjmExvmlf8nRdPLw1TA';
String URL = 'https://www.googleapis.com/youtube/v3/search';

class Api {
  Future<List<Video>> pesquisar(String pesquisa) async {
    http.Response resposta = await http.get(
      Uri.parse(
        URL+"?part=snippet&type=video&maxResults=75&order=date&channelId=$ID_CHANNEL&key=$CHAVE_YOUTUBE&q=$pesquisa",
      )
    );
    if (resposta.statusCode == 200) {
      Map<String,dynamic> dadosJson = json.decode(resposta.body);
      //print("dados-->"+dadosJson['items'][0]['snippet']['title']);
      List<Video> listaVideos = dadosJson['items'].map<Video>(
        (map){
          return Video.fromJson(map);
        }
      ).toList();
      for (var v in listaVideos) {
        print(v.titulo);
      }
      return listaVideos;
    } else {
      print("Erro ao buscar videos");
      return List.empty();
    }
  }
}

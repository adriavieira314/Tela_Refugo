import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tela_refugo_tv/main.dart';
import 'package:tela_refugo_tv/utils/constants.dart';

import '../model/dados_maquina.dart';

class DadosMaquinaDao {
  Future<DadosMaquina> dadosMaquina() async {
    final String maquinas;
    if (prefs.getString("maquinas") == null) {
      maquinas = "";
    } else {
      maquinas = prefs.getString("maquinas")!;
    }
    print(serverURL);
    print(maquinas);

    final response = await http.post(
      Uri.parse(
        '$serverURL/idw/rest/injet/monitorizacao/refugoshora?listaMaquinasSel=$maquinas',
        // 'http://localhost:8000/getDados',
      ),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    ).timeout(
      Duration(seconds: tempoDeEspera),
      onTimeout: () {
        return http.Response(
          'Tempo de espera de resposta da URL excedeu',
          408,
        ); // Request Timeout response status code
      },
    );

    if (response.statusCode == 200) {
      print('mandando resposta lista_refugo_dao');
      // print(response.body);

      return DadosMaquina.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
    } else {
      print('response.erro dados maquina');
      print(response.body);
      throw Exception('Failed to load dados maquina. ${response.body}');
    }
  }
}

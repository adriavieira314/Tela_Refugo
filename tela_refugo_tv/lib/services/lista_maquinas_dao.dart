import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tela_refugo_tv/model/lista_maquinas.dart';
import 'package:tela_refugo_tv/utils/constants.dart';

class ListaMaquinasDao {
  Future<ListaMaquinas> listaMaquinas() async {
    final response = await http.get(
      Uri.parse(
        '$serverURL/idw/rest/injet/monitorizacao/listamaquinasativasinjet',
      ),
    );

    if (response.statusCode == 200) {
      print('mandando resposta listamaquina');
      // print(response.body);

      return ListaMaquinas.fromJson(
          jsonDecode(utf8.decode(response.bodyBytes)));
    } else {
      print('response.erro listamaquina');
      print(response.body);
      throw Exception('Failed to listamaquina');
    }
  }
}

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final ListaMaquinasDao _daoListaMaquinas = ListaMaquinasDao();
  late Future<ListaMaquinas> _getListaMaquina;

  @override
  void initState() {
    super.initState();
    _getListaMaquina = _daoListaMaquinas.listaMaquinas();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<ListaMaquinas>(
            future: _getListaMaquina,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data!.maquinasAtivas!.length.toString());
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}

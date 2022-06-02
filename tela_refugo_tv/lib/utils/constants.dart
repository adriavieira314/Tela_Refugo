import 'package:shared_preferences/shared_preferences.dart';

String serverURL = "";
String maquinasString = "";
Exception mensagemErro = Exception();
int tempoDeEspera = 30;
int tempoPaginacao = 15;

void getServer() async {
  final prefs = await SharedPreferences.getInstance();
  String? server;
  String? port;

  if (prefs.getString('server') == null) {
    server = "";
    port = "";
  } else {
    server = prefs.getString('server');
    port = prefs.getString('port');
    server = server!.trim();
    port = port!.trim();
    serverURL = "http://$server:$port";
  }
}

void getMaquinasSalvas() async {
  final prefs = await SharedPreferences.getInstance();

  if (prefs.getString('maquinas') == null) {
    maquinasString = "";
  } else {
    maquinasString = prefs.getString('maquinas')!;
  }
}

void tempoDePaginacao() async {
  final prefs = await SharedPreferences.getInstance();

  if (prefs.getString('tempo') == null) {
    tempoPaginacao = 15;
  } else {
    tempoPaginacao = int.parse(prefs.getString('tempo')!);
  }
}

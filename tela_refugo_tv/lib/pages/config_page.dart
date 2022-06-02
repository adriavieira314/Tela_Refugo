import 'package:flutter/material.dart';
import 'package:tela_refugo_tv/main.dart';
import 'package:tela_refugo_tv/pages/graph_page.dart';
import 'package:tela_refugo_tv/utils/constants.dart';

class ConfigPage extends StatefulWidget {
  const ConfigPage({Key? key}) : super(key: key);

  @override
  ConfigPageState createState() => ConfigPageState();
}

class ConfigPageState extends State<ConfigPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController serverController = TextEditingController();
  final TextEditingController portController = TextEditingController();
  final TextEditingController maquinasController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tela Refugo - PAM Plásticos'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.35,
          height: MediaQuery.of(context).size.height * 0.7,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(50.0, 10.0, 50.0, 10.0),
            child: Center(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextFormField(
                      controller: serverController,
                      keyboardType: TextInputType.text,
                      style: const TextStyle(color: Colors.blue, fontSize: 15),
                      decoration: const InputDecoration(
                        labelText: "Servidor",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Campo obrigatório.';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: portController,
                      keyboardType: TextInputType.number,
                      style: const TextStyle(color: Colors.blue, fontSize: 15),
                      decoration: const InputDecoration(
                        labelText: "Porta",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Campo obrigatório.';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: maquinasController,
                      keyboardType: TextInputType.number,
                      style: const TextStyle(color: Colors.blue, fontSize: 15),
                      decoration: const InputDecoration(
                        labelText: 'Máquina(s)',
                        hintText: '10,20,30,106',
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, escolha a(s) máquina(s)';
                        }
                        return null;
                      },
                    ),
                    ElevatedButton(
                      onPressed: () => {
                        if (_formKey.currentState!.validate())
                          {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text(
                                  'Confirme as informações abaixo',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                content: conteudoAlerta(),
                              ),
                            ),
                          }
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            vertical: 25.0, horizontal: 30.0),
                        elevation: 5,
                      ),
                      child: const Text(
                        "Enviar",
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    // ignore: deprecated_member_use
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  conteudoAlerta() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  text: 'Servidor: ',
                  style: const TextStyle(color: Colors.black, fontSize: 20.0),
                  children: [
                    TextSpan(
                      text: serverController.text,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                  text: 'Porta: ',
                  style: const TextStyle(color: Colors.black, fontSize: 20.0),
                  children: [
                    TextSpan(
                      text: portController.text,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                  text: 'Maquinas: ',
                  style: const TextStyle(color: Colors.black, fontSize: 20.0),
                  children: [
                    TextSpan(
                      text: maquinasController.text,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () => Navigator.pop(context, 'Cancel'),
                child: const Text(
                  'Cancelar',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                  padding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 25.0),
                  elevation: 5,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  _formKey.currentState!.save();
                  prefs.setString('server', serverController.text);
                  prefs.setString('port', portController.text);
                  prefs.setString(
                    'maquinas',
                    maquinasController.text.replaceAll(' ', ''),
                  );
                  getMaquinasSalvas();
                  getServer();
                  // navega para pagina
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const GraphPage(),
                    ),
                  );
                },
                child: const Text(
                  'Confirmar',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
                ),
                style: ElevatedButton.styleFrom(
                  // primary: Colors.red,
                  padding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 25.0),
                  elevation: 5,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

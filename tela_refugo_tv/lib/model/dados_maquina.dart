class DadosMaquina {
  List<Graficos>? graficos;

  DadosMaquina({this.graficos});

  DadosMaquina.fromJson(Map<String, dynamic> json) {
    if (json['graficos'] != null) {
      graficos = <Graficos>[];
      json['graficos'].forEach((v) {
        graficos!.add(Graficos.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (graficos != null) {
      data['graficos'] = graficos!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Graficos {
  String? cdMaquina;
  String? cdProduto;
  String? dsProduto;
  List<Horas>? horas;

  Graficos({
    this.cdMaquina,
    this.cdProduto,
    this.dsProduto,
    this.horas,
  });

  Graficos.fromJson(Map<String, dynamic> json) {
    cdMaquina = json['cdMaquina'];
    cdProduto = json['cdProduto'];
    dsProduto = json['dsProduto'];
    if (json['horas'] != null) {
      horas = <Horas>[];
      json['horas'].forEach((v) {
        horas!.add(Horas.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cdMaquina'] = cdMaquina;
    data['cdProduto'] = cdProduto;
    data['dsProduto'] = dsProduto;
    if (horas != null) {
      data['horas'] = horas!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Horas {
  String? dthrIniHora;
  String? dthrFimHora;
  int? prodBruta;
  int? prodLiquida;
  int? prodRefugada;
  int? metaHora;

  Horas({
    this.dthrIniHora,
    this.dthrFimHora,
    this.prodBruta,
    this.prodLiquida,
    this.prodRefugada,
    this.metaHora,
  });

  Horas.fromJson(Map<String, dynamic> json) {
    dthrIniHora = json['dthrIniHora'];
    dthrFimHora = json['dthrFimHora'];
    prodBruta = json['prodBruta'];
    prodLiquida = json['prodLiquida'];
    prodRefugada = json['prodRefugada'];
    metaHora = json['metaHora'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['dthrIniHora'] = dthrIniHora;
    data['dthrFimHora'] = dthrFimHora;
    data['prodBruta'] = prodBruta;
    data['prodLiquida'] = prodLiquida;
    data['prodRefugada'] = prodRefugada;
    data['metaHora'] = metaHora;
    return data;
  }
}

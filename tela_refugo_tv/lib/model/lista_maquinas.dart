class ListaMaquinas {
  List<MaquinasAtivas>? maquinasAtivas;

  ListaMaquinas({maquinasAtivas});

  ListaMaquinas.fromJson(Map<String, dynamic> json) {
    if (json['maquinasAtivas'] != null) {
      maquinasAtivas = <MaquinasAtivas>[];
      json['maquinasAtivas'].forEach((v) {
        maquinasAtivas!.add(MaquinasAtivas.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (maquinasAtivas != null) {
      data['maquinasAtivas'] = maquinasAtivas!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MaquinasAtivas {
  int? idMaquina;
  String? cdMaquina;
  String? cdIdentificacao;
  int? sessaoProducao;
  bool? requerFerramenta;
  bool? requerEstrutura;
  bool? requerProduto;
  bool? requerQuantidade;
  bool? requerCDM;
  bool? requerOP;
  int? tipoParPam;
  int? statusFuncionamento;

  MaquinasAtivas({
    this.idMaquina,
    this.cdMaquina,
    this.cdIdentificacao,
    this.sessaoProducao,
    this.requerFerramenta,
    this.requerEstrutura,
    this.requerProduto,
    this.requerQuantidade,
    this.requerCDM,
    this.requerOP,
    this.tipoParPam,
    this.statusFuncionamento,
  });

  MaquinasAtivas.fromJson(Map<String, dynamic> json) {
    idMaquina = json['idMaquina'];
    cdMaquina = json['cdMaquina'];
    cdIdentificacao = json['cdIdentificacao'];
    sessaoProducao = json['sessaoProducao'];
    requerFerramenta = json['requerFerramenta'];
    requerEstrutura = json['requerEstrutura'];
    requerProduto = json['requerProduto'];
    requerQuantidade = json['requerQuantidade'];
    requerCDM = json['requerCDM'];
    requerOP = json['requerOP'];
    tipoParPam = json['tipoParPam'];
    statusFuncionamento = json['statusFuncionamento'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['idMaquina'] = idMaquina;
    data['cdMaquina'] = cdMaquina;
    data['cdIdentificacao'] = cdIdentificacao;
    data['sessaoProducao'] = sessaoProducao;
    data['requerFerramenta'] = requerFerramenta;
    data['requerEstrutura'] = requerEstrutura;
    data['requerProduto'] = requerProduto;
    data['requerQuantidade'] = requerQuantidade;
    data['requerCDM'] = requerCDM;
    data['requerOP'] = requerOP;
    data['tipoParPam'] = tipoParPam;
    data['statusFuncionamento'] = statusFuncionamento;
    return data;
  }
}

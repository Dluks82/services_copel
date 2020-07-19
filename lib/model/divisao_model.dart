class Divisao {
  final String id, sigla, descricao;
  final bool ativo;

  Divisao({this.id, this.sigla, this.descricao, this.ativo});

  Divisao.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        sigla = json['sigla'],
        descricao = json['descricao'],
        ativo = json['ativo'];

  Map<String, dynamic> toJson() =>
      {'id': id, 'sigla': sigla, 'descricao': descricao, 'ativo': ativo};
}

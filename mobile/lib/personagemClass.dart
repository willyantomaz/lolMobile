class Personagem {
  final int id;
  final String name;
  final String local;

  Personagem({
    required this.id,
    required this.name,
    required this.local,
  });

  factory Personagem.fromJson(Map<String, dynamic> json) {
    return Personagem(
      id: json['id'],
      name: json['name'],
      local: json['local'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'local': local,
    };
  }
}

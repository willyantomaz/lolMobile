class Personagem {
  final String id;
  final String nome;
  final String title;
  final String tags;
  final String icon;
  final String description;

  Personagem({
    required this.id,
    required this.nome,
    required this.title,
    required this.tags,
    required this.icon,
    required this.description,
  });

  factory Personagem.fromJson(Map<String, dynamic> json) {
    return Personagem(
      id: json['id'] as String,
      nome: json['nome'] as String,
      title: json['title'] as String,
      tags: json['tags'] as String,
      icon: json['icon'] as String,
      description: json['description'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': nome,
      'title': title,
      'tags': tags,
      'icon': icon,
      'description': description
    };
  }
}

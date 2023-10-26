class Video {
  String id;
  String titulo;
  String descricao;
  String canal;
  String imagem;

  Video(this.id, this.titulo, this.descricao, this.canal, this.imagem);

  factory Video.fromJson(Map<String,dynamic> json) {
    return Video(
      json['id']['videoId'],
      json['snippet']['title'],
      json['snippet']['description'],
      json['snippet']['thumbnails']['high']['url'],
      json['snippet']['channelTitle']
    );
  }
}
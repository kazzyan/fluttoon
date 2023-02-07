class WebtoonModel {
  final String title, thumb, id;

/*
  Webtoon({
    required this.title,
    required this.thumb,
    required this.id,
  });
*/

  WebtoonModel.fromJson(Map<String, dynamic> json)
      : title = json["title"],
        thumb = json["thumb"],
        id = json["id"];
}

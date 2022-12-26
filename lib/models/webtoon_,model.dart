

class WebtoonModel{
  final String title, thumb,id;

  //named constructor
  WebtoonModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        thumb = json['thumb'],
        id = json['id'];

    /*required this.title,
    required this.thumb,
    required this.id*/

}
class Planetary {
  String copyright;
  String explanation;
  String title;
  String media_type;
  String date;
  String hdurl;
  String url;
  String service_version;

  Planetary({
    required this.copyright,
    required this.date,
    required this.explanation,
    required this.title,
    required this.hdurl,
    required this.media_type,
    required this.service_version,
    required this.url,
  });

  factory Planetary.fromJson(Map<dynamic, dynamic> json) {
    return Planetary(
      copyright: json['copyright'],
      date: json['date'],
      explanation: json['explanation'],
      title: json['title'],
      hdurl: json['hdurl'],
      media_type: json['media_type'],
      service_version: json['service_version'],
      url: json['url'],
    );
  }
}

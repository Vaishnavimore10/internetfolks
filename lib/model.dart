// To parse this JSON data, do
//
//     final post = postFromJson(jsonString);

import 'dart:convert';

Post postFromJson(String str) => Post.fromJson(json.decode(str));

String postToJson(Post data) => json.encode(data.toJson());

class Post {
  Post({
    required this.content,
    required this.status,
  });

  Content content;
  bool status;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
    content: Content.fromJson(json["content"]),
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "content": content.toJson(),
    "status": status,
  };
}

class Content {
  Content({
    required this.data,
    required this.meta,
  });

  List<Datum> data;
  Meta meta;

  factory Content.fromJson(Map<String, dynamic> json) => Content(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    meta: Meta.fromJson(json["meta"]),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "meta": meta.toJson(),
  };
}

class Datum {
  Datum({
    required this.id,
    required this.title,
    required this.description,
    required this.bannerImage,
    required this.dateTime,
    required this.organiserName,
    required this.organiserIcon,
    required this.venueName,
    required this.venueCity,
    required this.venueCountry,
  });

  int id;
  String title;
  String description;
  String bannerImage;
  DateTime dateTime;
  String organiserName;
  String organiserIcon;
  String venueName;
  String venueCity;
  String venueCountry;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    title: json["title"],
    description: json["description"],
    bannerImage: json["banner_image"],
    dateTime: DateTime.parse(json["date_time"]),
    organiserName: json["organiser_name"],
    organiserIcon: json["organiser_icon"],
    venueName: json["venue_name"],
    venueCity: json["venue_city"],
    venueCountry: json["venue_country"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
    "banner_image": bannerImage,
    "date_time": dateTime.toIso8601String(),
    "organiser_name": organiserName,
    "organiser_icon": organiserIcon,
    "venue_name": venueName,
    "venue_city": venueCity,
    "venue_country": venueCountry,
  };
}

class Meta {
  Meta({
    required this.total,
  });

  int total;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "total": total,
  };
}

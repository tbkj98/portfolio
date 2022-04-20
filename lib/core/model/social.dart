import 'dart:convert';

Social socialFromJson(String str) => Social.fromJson(json.decode(str));

String socialToJson(Social data) => json.encode(data.toJson());

class Social {
  Social({
    required this.image,
    required this.text,
    required this.url,
  });

  final String image;
  final String text;
  final String url;

  Social copyWith({
    String? image,
    String? text,
    String? url,
  }) =>
      Social(
        image: image ?? this.image,
        text: text ?? this.text,
        url: url ?? this.url,
      );

  factory Social.fromJson(Map<String, dynamic> json) => Social(
        image: json["image"],
        text: json["text"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "text": text,
        "url": url,
      };
}

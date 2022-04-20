import 'dart:convert';

List<Skill> skillsFromJson(String str) => List<Skill>.from(
      json.decode(str).map((x) => Skill.fromJson(x)),
    );

String skillsToJson(List<Skill> data) => json.encode(
      List<dynamic>.from(data.map((x) => x.toJson())),
    );

class Skill {
  Skill({
    required this.title,
    required this.experience,
    required this.imageUrl,
  });

  final String title;
  final String experience;
  final String imageUrl;

  Skill copyWith({
    String? title,
    String? experience,
    String? imageUrl,
  }) =>
      Skill(
        title: title ?? this.title,
        experience: experience ?? this.experience,
        imageUrl: imageUrl ?? this.imageUrl,
      );

  factory Skill.fromJson(Map<String, dynamic> json) => Skill(
        title: json["title"],
        experience: json["Experience"],
        imageUrl: json["image_url"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "Experience": experience,
        "image_url": imageUrl,
      };
}

import 'dart:convert';

import 'education.dart';
import 'social.dart';

Profile profileFromJson(String str) => Profile.fromJson(json.decode(str));

String profileToJson(Profile data) => json.encode(data.toJson());

class Profile {
  Profile({
    required this.tagline,
    required this.name,
    required this.image,
    required this.about,
    required this.social,
    required this.education,
  });

  final String name;
  final String image;
  final String about;
  final String tagline;
  final List<Social> social;
  final List<Education> education;

  Profile copyWith({
    String? name,
    String? image,
    String? about,
    String? tagline,
    List<Social>? social,
    List<Education>? education,
  }) =>
      Profile(
        name: name ?? this.name,
        image: image ?? this.image,
        about: about ?? this.about,
        social: social ?? this.social,
        education: education ?? this.education,
        tagline: tagline ?? this.tagline,
      );

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        name: json['name'],
        image: json['image'],
        about: json['about'],
        tagline: json['tagline'],
        social: List<Social>.from(
          json['social'].map((x) => Social.fromJson(x)),
        ),
        education: List<Education>.from(
          json['education'].map((x) => Education.fromJson(x)),
        ),
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'image': image,
        'about': about,
        'social': List<dynamic>.from(social.map((x) => x.toJson())),
        'education': List<dynamic>.from(education.map((x) => x.toJson())),
      };

  factory Profile.initial() => Profile(
        name: '',
        image: '',
        about: '',
        tagline: '',
        social: [],
        education: [],
      );
}

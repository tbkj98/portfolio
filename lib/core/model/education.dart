import 'dart:convert';

Education educationFromJson(String str) => Education.fromJson(json.decode(str));

String educationToJson(Education data) => json.encode(data.toJson());

class Education {
  Education({
    required this.course,
    required this.college,
    required this.stream,
    required this.marks,
  });

  final String course;
  final String college;
  final String stream;
  final double marks;

  Education copyWith({
    String? course,
    String? college,
    String? stream,
    double? marks,
  }) =>
      Education(
        course: course ?? this.course,
        college: college ?? this.college,
        stream: stream ?? this.stream,
        marks: marks ?? this.marks,
      );

  factory Education.fromJson(Map<String, dynamic> json) => Education(
        course: json["course"],
        college: json["college"],
        stream: json["stream"],
        marks: json["marks"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "course": course,
        "college": college,
        "stream": stream,
        "marks": marks,
      };
}

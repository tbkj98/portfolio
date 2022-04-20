import 'package:flutter/services.dart';

import '../model/profile.dart';
import '../model/skill.dart';

class MainService {
  // Future<Profile> getProfile() async {
  //   final uri = Uri.parse('${AppConfig.baseUrl}/profile.json');
  //   final response = await http.get(uri);
  //   return profileFromJson(response.body);
  // }

  Future<Profile> getProfile() async {
    final data = await rootBundle.loadString('data/profile.json');
    await Future.delayed(const Duration(seconds: 2));
    return profileFromJson(data);
  }

  Future<List<Skill>> getSkills() async {
    final data = rootBundle.loadString('data/skills.json');
    await Future.delayed(const Duration(seconds: 2));
    return skillsFromJson(data.toString());
  }

  // Future<List<Skill>> getSkills() async {
  //   final uri = Uri.parse('${AppConfig.baseUrl}/skills.json');
  //   final response = await http.get(uri);
  //   return skillsFromJson(response.body);
  // }
}

import 'package:get_it/get_it.dart';
import 'package:portfolio/core/controller/base_controller.dart';
import 'package:portfolio/core/service/main_service.dart';

import '../../../core/model/skill.dart';

var locator = GetIt.I;

class SkillController extends BaseController {
  final service = locator.get<MainService>();

  List<Skill> skills = <Skill>[];

  Future<void> loadSkills() async {
    skills = await getSkills();
  }

  Future<List<Skill>> getSkills() async {
    try {
      loading();
      final skills = await service.getSkills();
      idle();
      return skills;
    } on Exception {
      error('Failed to load skills');
      return [];
    }
  }
}

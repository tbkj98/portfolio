import 'dart:developer';

import 'package:get_it/get_it.dart';
import 'package:portfolio/core/controller/base_controller.dart';
import 'package:portfolio/core/enum/controller_state.dart';
import 'package:portfolio/core/service/main_service.dart';

import '../../../core/model/profile.dart';

var locator = GetIt.I;

class ProfileController extends BaseController {
  final errorMessage = 'Failed to fetch profile data.';
  final _service = locator.get<MainService>();

  Profile profile = Profile.initial();
  ProfileController() : super(state: ControllerState.loading) {
    loadProfile();
  }

  Future<void> loadProfile() async {
    profile = await getProfile();
  }

  Future<Profile> getProfile() async {
    try {
      loading();
      final profile = await _service.getProfile();
      idle();
      return profile;
    } on Exception catch (e) {
      log(e.toString());
      error(errorMessage);
      return Profile.initial();
    }
  }
}

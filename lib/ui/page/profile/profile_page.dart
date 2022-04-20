import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/core/enum/controller_state.dart';
import 'package:portfolio/core/widget/loader.dart';
import 'package:portfolio/ui/page/profile/profile_controller.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProfileController(),
      child: Consumer<ProfileController>(
        builder: (_, data, __) {
          if (data.state == ControllerState.loading) {
            return const Center(
              child: Loader(),
            );
          }

          if (data.state == ControllerState.error) {
            return Center(
              child: Text(data.message ?? data.errorMessage),
            );
          }
          return _ProfileWidget(data);
        },
      ),
    );
  }
}

class _ProfileWidget extends StatefulWidget {
  final ProfileController controller;
  const _ProfileWidget(this.controller, {Key? key}) : super(key: key);

  @override
  State<_ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<_ProfileWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  late final Animation<double> animation;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    animation = Tween(begin: 0.0, end: 1.0).animate(controller);
    super.initState();
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    final nameStyle = Theme.of(context).textTheme.headline2;
    final descriptionStyle = Theme.of(context).textTheme.headline4;

    return FadeScaleTransition(
      animation: animation,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Name
            Text(widget.controller.profile.name, style: nameStyle),
            const SizedBox(height: 20),
            // Any tagline
            Text(widget.controller.profile.tagline, style: descriptionStyle),
          ],
        ),
      ),
    );
  }
}

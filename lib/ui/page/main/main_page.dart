import 'package:flutter/material.dart';
import 'package:portfolio/ui/page/contact/contact_page.dart';
import 'package:portfolio/ui/page/profile/profile_page.dart';
import 'package:portfolio/ui/page/skill/skill_page.dart';

class MainPage extends StatefulWidget {
  final _pageCount = 3;
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  double _offset = 0;
  int visiblePage = 0;

  double _getFirstPageOffset(double height) => -.25 * _offset;

  double _getSecondPageTopOffset(double height) {
    var result = 0.0;
    if (visiblePage == 0) result = height - _offset;
    if (visiblePage == 1 || visiblePage == 2) result = .25 * (height - _offset);
    return result;
  }

  double _getThirdPageTopOffset(double height) {
    var result = 0.0;
    if (visiblePage == 0) result = height;
    if (visiblePage == 1) result = (widget._pageCount - 1) * height - _offset;
    if (visiblePage == 2) {
      result = .25 * ((widget._pageCount - 1) * height - _offset);
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Material(
      child: NotificationListener<ScrollNotification>(
        // When user scrolls, this will trigger onNotification.
        // updateOffsetAccordingToScroll updates the offset
        onNotification: (notification) => updateOffset(
          notification,
          height,
        ),
        // ScrollConfiguration sets the scroll glow behaviour
        child: ScrollConfiguration(
          behavior: NoScrollGlow(),
          child: Stack(
            children: <Widget>[
              SingleChildScrollView(
                child: Column(
                  children: List.generate(
                    widget._pageCount,
                    (index) => SizedBox(
                      height: height,
                      width: width,
                    ),
                  ),
                ),
              ),
              Positioned(
                // The hero image will be pushed up once user scrolls up
                // That is why it is multiplied negatively.
                top: _getFirstPageOffset(height),
                child: SizedBox(
                  height: height,
                  width: width,
                  child: const ProfilePage(),
                ),
              ),
              Positioned(
                top: _getSecondPageTopOffset(height),
                child: SizedBox(
                  height: height,
                  width: width,
                  child: const SkillPage(),
                ),
              ),
              Positioned(
                top: _getThirdPageTopOffset(height),
                child: SizedBox(
                  height: height,
                  width: width,
                  child: const ContactPage(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Returns true to cancel the notification bubbling.
  bool updateOffset(ScrollNotification notification, double height) {
    visiblePage = _offset ~/ height;
    setState(() => _offset = notification.metrics.pixels);
    return true;
  }
}

class NoScrollGlow extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
    BuildContext context,
    Widget child,
    AxisDirection axisDirection,
  ) {
    return child;
  }
}

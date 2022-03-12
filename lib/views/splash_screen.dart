import 'package:example/constants/image_assets.dart';
import 'package:example/core/extensions/extensions/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spring/spring.dart';

import 'home_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // navigate after app setup
  Future _navigate(BuildContext c) async {
    Navigator.of(context).pushReplacement(
      CupertinoPageRoute(builder: (c) => const HomeView()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.backgroundColor,
      child: Center(
          child: _Logo(
              logo: Hero(
                  tag: const ValueKey('logo'),
                  child: SizedBox.square(
                      dimension: 100, child: Image.asset(ImageAssets.logo))),
              setUp: _navigate)),
    );
  }
}

class _Logo extends StatefulWidget {
  final Widget? logo;
  final Function(BuildContext) setUp;
  const _Logo({
    Key? key,
    required this.setUp,
    this.logo,
  }) : super(key: key);

  @override
  __LogoState createState() => __LogoState();
}

class __LogoState extends State<_Logo> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    _controller = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 1000),
        lowerBound: 0,
        upperBound: 1);
    super.initState();
    Future.delayed(const Duration(milliseconds: 700), _controller.forward);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Spring.shake(
      animStatus: (status) {
        if (status == AnimStatus.completed) {
          WidgetsBinding.instance?.addPostFrameCallback((timeStamp) async {
            widget.setUp(context);
          });
        }
      },
      delay: const Duration(milliseconds: 800),
      animDuration: const Duration(milliseconds: 400),
      child: ScaleTransition(
        scale: Tween<double>(begin: .3, end: 1).animate(
            CurvedAnimation(parent: _controller, curve: Curves.easeOutQuart)),
        child: Center(child: widget.logo),
      ),
    );
  }
}

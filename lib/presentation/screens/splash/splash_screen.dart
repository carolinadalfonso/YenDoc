import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'package:yendoc/core/framework/size_config/size_config.dart';
import 'package:yendoc/core/framework/theme/theme_manager.dart';
import 'package:yendoc/core/framework/util/general_navigator.dart';
import 'package:yendoc/presentation/screens/login/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    _waitAndGoHome(context, const Duration(seconds: 4));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              ThemeManager.kPrimaryColor,
              const Color(0xFF082478),
            ],
          ),
        ),
        // color: ThemeManager.kPrimaryColor,
        child: Stack(
          children: [
            ShowUpAnimation(
              direction: Direction.horizontal,
              animationDuration: const Duration(milliseconds: 2000),
              curve: Curves.decelerate,
              offset: -0.05,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 250, 20, 20),
                child: Image.asset(
                  "assets/images/logo.png",
                  color: Colors.white,
                ),
              ),
            ),
            ShowUpAnimation(
              delayStart: const Duration(milliseconds: 1500),
              animationDuration: const Duration(milliseconds: 1000),
              direction: Direction.vertical,
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  width: SizeConfig.screenWidth,
                  height: 120,
                  alignment: Alignment.bottomLeft,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.elliptical(300, 100),
                      topRight: Radius.elliptical(900, 330),
                    ),
                    color: Colors.white,
                  ),
                  padding: const EdgeInsets.only(left: 30, bottom: 30),
                  child: Text(
                    "La solución integral\npara médicos a domicilio",
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 18,
                      color: ThemeManager.kPrimaryColor,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _waitAndGoHome(BuildContext context, Duration waitToHome) {
    return WidgetsBinding.instance.addPostFrameCallback(
      (_) => Future.delayed(
        waitToHome,
        () async {
          GeneralNavigator.pushReplacement(const LoginScreen(), transitionType: PageTransitionType.rightToLeft);
        },
      ),
    );
  }
}

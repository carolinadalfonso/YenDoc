import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:global_configuration/global_configuration.dart';
import '../../../core/framework/localization/localization.dart';
import '../../../core/framework/size_config/size_config.dart';
import '../../../core/framework/theme/theme_manager.dart';
import '../../../core/framework/util/util.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        foregroundColor: ThemeManager.kPrimaryColor,
        backgroundColor: Colors.transparent,
        title: Text(
          Localization.xDrawer.about,
          style: TextStyle(color: ThemeManager.kPrimaryColor),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/about.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.8),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 30, left: 30, top: 170),
                  child: Column(
                    children: [
                      Image.asset("assets/images/logo.png"),
                      const SizedBox(height: 20),
                      Text(
                        "Versión 1.0.0",
                        style: TextStyle(color: Colors.grey[600]!),
                      ),
                    ],
                  ),
                ),
                DefaultTextStyle(
                  style: TextStyle(
                    fontFamily: "Montserrat",
                    color: Colors.black,
                    shadows: [
                      Shadow(color: Colors.grey[400]!, offset: const Offset(1.5, 1.5), blurRadius: 4),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "💻 ${Localization.xAbout.developedBy}",
                      ),
                      const SizedBox(height: 40),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 3),
                        child: Text(
                          "Carolina Andrea D'Alfonso",
                          style: TextStyle(),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 3),
                        child: Text("Josefina Celeste García Sardella"),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 3),
                        child: Text("Maximiliano Sebastián Quiroga"),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 3),
                        child: Text("Tadeo Germán Granese"),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 3),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 8),
                        child: Text(
                          "Visitanos en",
                        ),
                      ),
                      Tooltip(
                        message: "Visitanos en GitHub",
                        child: GestureDetector(
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/images/github.png',
                                width: SizeConfig.blockSizeVertical * 4,
                                height: SizeConfig.blockSizeVertical * 4,
                                filterQuality: FilterQuality.high,
                                color: Colors.black,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text(
                                "GitHub",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Montserrat',
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          onTap: () => Util.launchURL(GlobalConfiguration().getValue<String>("github_app"), context),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: SizeConfig.blockSizeVertical * 5,
                    decoration: BoxDecoration(
                      color: Colors.blueGrey[900],
                      border: Border.all(color: Colors.blueGrey[800]!, width: 0),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "HECHO EN 🇦🇷 CON 💙 EN ",
                          style: TextStyle(
                            fontSize: SizeConfig.blockSizeVertical * 1.8,
                            fontFamily: 'Montserrat',
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            shadows: const [
                              Shadow(
                                blurRadius: 5,
                                color: Colors.black87,
                                offset: Offset(0, 0),
                              ),
                            ],
                          ),
                        ),
                        Image.asset('assets/images/flutter.png',
                            width: SizeConfig.blockSizeVertical * 2, height: SizeConfig.blockSizeVertical * 2, filterQuality: FilterQuality.high),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

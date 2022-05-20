import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yendoc/controllers/about_controller.dart';
import 'package:yendoc/core/framework/localization/localization.dart';
import 'package:yendoc/core/framework/theme/theme_manager.dart';

class AboutScreen extends GetView<AboutController> {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        foregroundColor: ThemeManager.kPrimaryColor,
        backgroundColor: Colors.white,
        title: Text(
          Localization.xDrawer.about,
          style: TextStyle(color: ThemeManager.kPrimaryColor),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Image.asset("assets/images/logo.png"),
          ),
          Column(
            children: [
              Text(Localization.xAbout.developedBy),
              const SizedBox(height: 40),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 3),
                child: Text("Carolina Andrea D'Alfonso"),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 3),
                child: Text("Josefina Celeste Garcia Sardella"),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 3),
                child: Text("Maximiliano Sebastián Quiroga"),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 3),
                child: Text("Tadeo German Granese"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

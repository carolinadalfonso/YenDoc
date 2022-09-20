import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:text_scroll/text_scroll.dart';
import '../../../../core/framework/util/general_navigator.dart';
import '../../../../core/framework/localization/localization.dart';
import '../../../../core/framework/theme/theme_manager.dart';
import '../../../../core/framework/util/cool_dialog.dart';
import '../../../../core/framework/util/util_preferences.dart';
import '../../../screens/about/about_screen.dart';
import '../../../screens/change_password/change_password.dart';
import '../../../screens/home/home_screen.dart';
import '../../../screens/login/login_screen.dart';
import '../../../screens/report/report_screen.dart';
import '../list_item.dart';

part 'header/drawer_header.dart';
part 'body/drawer_body.dart';
part 'footer/drawer_footer.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: const [
          _DrawerHeader(),
          _DrawerBody(),
          _DrawerFooter(),
        ],
      ),
    );
  }
}

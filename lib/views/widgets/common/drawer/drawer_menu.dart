import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:text_scroll/text_scroll.dart';
import 'package:yendoc/controllers/login_controller.dart';
import 'package:yendoc/core/framework/localization/localization.dart';
import 'package:yendoc/core/framework/theme/theme_manager.dart';
import 'package:yendoc/core/framework/util/cool_dialog.dart';
import 'package:yendoc/views/screens/about/about_screen.dart';
import 'package:yendoc/views/screens/home/home_screen.dart';
import 'package:yendoc/views/widgets/common/list_item.dart';

import '../simple_button.dart';

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

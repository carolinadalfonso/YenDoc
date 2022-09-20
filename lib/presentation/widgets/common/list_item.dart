import 'package:flutter/material.dart';
import '../../../core/framework/size_config/size_config.dart';
import '../../../core/framework/theme/theme_manager.dart';

class ListItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const ListItem({
    Key? key,
    required this.title,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        highlightColor: ThemeManager.kPrimaryColor50,
        splashColor: ThemeManager.kPrimaryColor100,
      ),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
            color: ThemeManager.kPrimaryColor,
            fontFamily: 'Poppins',
            fontSize: SizeConfig.blockSizeVertical * 1.8,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Icon(
            icon,
            color: ThemeManager.kPrimaryColor,
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}

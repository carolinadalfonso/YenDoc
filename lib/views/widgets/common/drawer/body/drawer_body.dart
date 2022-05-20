part of '../drawer_menu.dart';

class _DrawerBody extends StatelessWidget {
  const _DrawerBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListItem(
          title: Localization.xDrawer.visits,
          icon: FontAwesomeIcons.houseChimney,
          onTap: () => {},
        ),
        ListItem(
          title: Localization.xDrawer.about,
          icon: FontAwesomeIcons.circleInfo,
          onTap: () => Get.to(() => const AboutScreen()),
        ),
      ],
    );
  }
}

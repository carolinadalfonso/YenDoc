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
          onTap: () => Get.to(() => const HomeScreen()),
        ),
        ListItem(
          title: Localization.xDrawer.report,
          icon: FontAwesomeIcons.chartColumn,
          onTap: () => Get.to(() => const ReportScreen()),
        ),
        ListItem(
          title: Localization.xDrawer.changePassword,
          icon: FontAwesomeIcons.key,
          onTap: () => Get.to(() => const ChangePasswordScreen()),
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

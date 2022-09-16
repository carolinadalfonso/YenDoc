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
          onTap: () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen(datePick: DateTime.now()))),
        ),
        ListItem(
          title: Localization.xDrawer.report,
          icon: FontAwesomeIcons.chartColumn,
          onTap: () => GeneralNavigator.push(const ReportScreen()),
        ),
        ListItem(
          title: Localization.xDrawer.changePassword,
          icon: FontAwesomeIcons.key,
          onTap: () {
            Scaffold.of(context).closeDrawer();
            GeneralNavigator.push(const ChangePasswordScreen());
          },
        ),
        ListItem(
          title: Localization.xDrawer.about,
          icon: FontAwesomeIcons.circleInfo,
          onTap: () => GeneralNavigator.push(const AboutScreen()),
        ),
      ],
    );
  }
}

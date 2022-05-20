part of '../drawer_menu.dart';

class _DrawerFooter extends StatelessWidget {
  const _DrawerFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Divider(),
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: ListItem(
                title: Localization.xDrawer.signOut,
                icon: FontAwesomeIcons.rightFromBracket,
                onTap: () => {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}

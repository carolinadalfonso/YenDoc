part of '../drawer_menu.dart';

class _DrawerHeader extends StatelessWidget {
  const _DrawerHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: double.infinity,
      color: ThemeManager.kPrimaryColor,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ThemeManager.kPrimaryColorLight,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(1.5),
                  child: CircleAvatar(
                    backgroundColor: ThemeManager.kPrimaryColor,
                    backgroundImage: const NetworkImage(
                      'https://avatars.githubusercontent.com/u/7302044?v=4',
                    ),
                  ),
                ),
              ),
            ),
            const Flexible(
              child: TextScroll(
                "Carolina Andrea D'Alfonso",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat',
                ),
                mode: TextScrollMode.bouncing,
                velocity: Velocity(pixelsPerSecond: Offset(15, 0)),
                delayBefore: Duration(seconds: 2),
                pauseBetween: Duration(seconds: 5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

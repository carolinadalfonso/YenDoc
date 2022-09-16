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
                    backgroundImage: Image.memory(base64.decode(UtilPreferences.prefs.getString(UtilPreferences.userAvatar)!)).image,
                  ),
                ),
              ),
            ),
            Flexible(
              child: TextScroll(
                UtilPreferences.prefs.getString(UtilPreferences.userFullName)!,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat',
                ),
                mode: TextScrollMode.bouncing,
                velocity: const Velocity(pixelsPerSecond: Offset(15, 0)),
                delayBefore: const Duration(seconds: 2),
                pauseBetween: const Duration(seconds: 5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

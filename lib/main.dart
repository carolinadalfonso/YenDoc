import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/framework/localization/localization.dart';
import 'core/framework/size_config/size_config.dart';
import 'core/framework/theme/theme_manager.dart';
import 'core/framework/util/util_preferences.dart';
import 'presentation/screens/login/login_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'core/framework/bloc/injection_container.dart' as injection;

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );

  UtilPreferences.prefs = await SharedPreferences.getInstance();
  await GlobalConfiguration().loadFromPath("assets/cfg/app_settings.json");
  await injection.init();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (_) => {
      runApp(
        const YenDocApp(),
      )
    },
  );
}

class YenDocApp extends StatelessWidget {
  const YenDocApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('es', 'ES'),
        Locale('en', 'EN'),
      ],
      translations: Localization(),
      locale: const Locale('es'),
      fallbackLocale: const Locale('en'),
      title: 'YenDoc',
      builder: (context, child) {
        SizeConfig().init(context);
        return MediaQuery(data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0), child: child!);
      },
      theme: ThemeManager.getTheme(),
      home: const LoginScreen(),
    );
  }
}

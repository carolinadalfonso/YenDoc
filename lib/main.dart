import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:yendoc/core/framework/injection_container.dart';
import 'package:yendoc/core/framework/localization/localization.dart';
import 'package:yendoc/core/framework/size_config/size_config.dart';
import 'package:yendoc/core/framework/theme/theme_manager.dart';
import 'package:yendoc/views/screens/login/login_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) => {runApp(const YenDocApp())});
}

class YenDocApp extends StatelessWidget {
  const YenDocApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: InjectionContainer(),
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

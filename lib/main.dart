import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:yendoc/core/framework/injection_container.dart';
import 'package:yendoc/views/screens/home/home_screen_x.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) => {runApp(const MyApp())});
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: InjectionContainer(),
      title: 'YenDoc',
      builder: (context, child) {
        return MediaQuery(data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0), child: child!);
      },
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const HomeScreenX(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:serasi/pages/pages.dart';
import 'package:serasi/cubit/cubit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  OneSignal.shared
      .init("ba80278b-2985-4811-808d-ca4e978183cd", iOSSettings: null);
  OneSignal.shared
      .setInFocusDisplayType(OSNotificationDisplayType.notification);
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(MaterialApp(
    theme: ThemeData.light(),
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => UserCubit()),
        // BlocProvider(create: (_) => AbsensiCubit()),
        BlocProvider(create: (_) => NilaiCubit()),
      ],
      child: GetMaterialApp(
        initialRoute: '/Splash',
        getPages: [
          GetPage(name: '/Splash', page: () => SplashPage()),
          GetPage(name: '/Welcome', page: () => WelcomePages()),
        ],
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

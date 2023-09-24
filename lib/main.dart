import 'package:beam_tv_1/Provider/gatepass_provider.dart';
import 'package:beam_tv_1/Provider/navbar_provider.dart';
import 'package:beam_tv_1/ViewModel/billing_view_model.dart';
import 'package:beam_tv_1/ViewModel/change_contact_view_modelhammad.dart';
import 'package:beam_tv_1/ViewModel/change_password_view_modelhammad.dart';
import 'package:beam_tv_1/ViewModel/generate_pass_alert_view_model.dart';
import 'package:beam_tv_1/ViewModel/generate_pass_view_model.dart';
import 'package:beam_tv_1/ViewModel/home_view_model.dart';
import 'package:beam_tv_1/ViewModel/login_view_model.dart';
import 'package:beam_tv_1/ViewModel/password_visibility_view_model.dart';
import 'package:beam_tv_1/ViewModel/tanker_alert_view_model.dart';
import 'package:beam_tv_1/resources/color.dart';
import 'package:beam_tv_1/resources/services/notification_services.dart';
import 'package:beam_tv_1/view/login_screen.dart';
import 'package:beam_tv_1/ViewModel/slider_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

bool notificationPermissionStatus = false;
String tokenId = "";

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await ScreenUtil.ensureScreenSize();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(MyApp());
}

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print(message.notification!.title.toString());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  NotificationServices notificationServices = NotificationServices();

  @override
  void initState() {
    notificationServices.requestNotificationPermission();
    // docDownload.getStoragePremission2();
    notificationServices.initFirebase();
    notificationServices.getDeviceToken().then((value) {
      tokenId = value;
      print("Device Token <<<<<<<<<<$tokenId>>>>>>>>>>>>");
    });
    notificationServices.isTokenRefresh();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => SliderProvider()),
          ChangeNotifierProvider(create: (_) => NavbarProvider()),
          ChangeNotifierProvider(create: (_) => GatePassProvider()),
          ChangeNotifierProvider(create: (_) => GeneratePassViewModel()),
          ChangeNotifierProvider(create: (_) => TankerAlertViewModel()),
          ChangeNotifierProvider(create: (_) => PasswordVisibilityViewModel()),
          ChangeNotifierProvider(create: (_) => HomeViewModel()),
          ChangeNotifierProvider(create: (_) => LoginViewModel()),
          ChangeNotifierProvider(create: (_) => ChangeContactViewModel()),
          ChangeNotifierProvider(create: (_) => ChangePasswordViewModel()),
          ChangeNotifierProvider(create: (_) => BillingViewModel()),
        ],
        child: Builder(builder: (BuildContext context) {
          return ScreenUtilInit(
            useInheritedMediaQuery: true,
            designSize: const Size(428, 926),
            // minTextAdapt: true,
            // splitScreenMode: true,
            builder: (context, child) {
              return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  // title: 'First Method',
                  // You can use the library anywhere in the app even in theme
                  theme: ThemeData(
                      // primarySwatch: Colors.blue,
                      fontFamily: "Rhizome",
                      scrollbarTheme: ScrollbarThemeData(
                        trackVisibility: MaterialStateProperty.all(true),
                        trackColor:
                            MaterialStateProperty.all(Color(0xffe2e2e2)),
                        thumbColor: MaterialStateProperty.all(primaryColor),
                        thickness: MaterialStateProperty.all(7.0),
                        radius: Radius.circular(30),
                        minThumbLength: 100,
                      )
                      //  fontFamily: GoogleFonts.lato().fontFamily
                      //  textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
                      ),
                  home: LoginScreen());
            },
          );
        }));
  }
}

import 'package:CommunityApp/Provider/gatepass_provider.dart';
import 'package:CommunityApp/Provider/navbar_provider.dart';
import 'package:CommunityApp/ViewModel/billing_view_model.dart';
import 'package:CommunityApp/ViewModel/change_contact_view_modelhammad.dart';
import 'package:CommunityApp/ViewModel/change_password_view_modelhammad.dart';
import 'package:CommunityApp/ViewModel/contact_us_view_model.dart';
import 'package:CommunityApp/ViewModel/edit_pofile_view_model.dart';
import 'package:CommunityApp/ViewModel/generate_pass_view_model.dart';
import 'package:CommunityApp/ViewModel/home_view_model.dart';
import 'package:CommunityApp/ViewModel/login_view_model.dart';
import 'package:CommunityApp/ViewModel/logout_view_model.dart';
import 'package:CommunityApp/ViewModel/password_visibility_view_model.dart';
import 'package:CommunityApp/ViewModel/slider_provider.dart';
import 'package:CommunityApp/ViewModel/tanker_alert_view_model.dart';
import 'package:CommunityApp/resources/color.dart';
import 'package:CommunityApp/resources/local_data.dart';
import 'package:CommunityApp/resources/services/notification_services.dart';
import 'package:CommunityApp/view/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';

bool notificationPermissionStatus = false;
String tokenId = "";

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await ScreenUtil.ensureScreenSize();
  LocalData ld = LocalData();
  await ld.getTokenLocally();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(MyApp());
}

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
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
          ChangeNotifierProvider(create: (_) => EditProfileViewModel()),
          ChangeNotifierProvider(create: (_) => ContactUsViewModel()),
          ChangeNotifierProvider(create: (_) => LogoutViewModel()),
        ],
        child: Builder(builder: (BuildContext context) {
          return ScreenUtilInit(
            useInheritedMediaQuery: true,
            designSize: const Size(428, 926),
            builder: (context, child) {
              return GetMaterialApp(
                  debugShowCheckedModeBanner: false,
                  theme: ThemeData(
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
                      ),
                  home: LoginScreen());
            },
          );
        }));
  }
}

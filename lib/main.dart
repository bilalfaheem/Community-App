import 'package:beam_tv_1/Provider/gatepass_provider.dart';
import 'package:beam_tv_1/Provider/image_provider.dart';
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
import 'package:beam_tv_1/view/login_screen.dart';
import 'package:beam_tv_1/ViewModel/slider_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

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
          ChangeNotifierProvider(create: (_) => ImageViewModel()),
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
            // child: LoginScreen()     //hammad
          );
        }));

    // ScreenUtilInit(
    //   builder: () => MaterialApp(
    //   home: LoginScreen(),
    // ),
    // designSize: Size(360,640),
    // );
  }
}
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ScreenUtilInit(
//       builder:()=> MaterialApp(
//           home: LoginScreen(),
//         );
//         designSize: const Size(360,640),
//     );
//   }
// }

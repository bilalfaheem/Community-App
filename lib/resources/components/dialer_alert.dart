
// import 'package:beam_tv_1/resources/app_url.dart';
// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';

// void launchDialer(BuildContext context, String phoneNumber) async {
//   final url = "AppUrl.contactUsUrl";
//   if (await canLaunch(AppUrl.contactUsUrl)) {
//     await launch(AppUrl.contactUsUrl);
//   } else {
//     // Handle the case where the user's device cannot open the dialer.
//     // You can display an error message or take appropriate action here.
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Error'),
//           content: Text('Unable to open the phone dialer.'),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: Text('OK'),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
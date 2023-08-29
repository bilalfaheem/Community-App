// import 'package:beam_tv_1/resources/color.dart';
// import 'package:beam_tv_1/resources/image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// Widget activeTankerWidget() {
//   return Container(
//     margin: EdgeInsets.symmetric(horizontal: 10.w),
//     padding: EdgeInsets.symmetric(horizontal: 10.w),
//     decoration: BoxDecoration(
//         color: greyLightBg, borderRadius: BorderRadius.circular(20)),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Container(
//           margin: EdgeInsets.symmetric(vertical: 7.5.h),
//           child: Text(
//             "Active Tanker",
//             style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
//           ),
//         ),
//         Container(
//           // height: 150.h,
//           margin: EdgeInsets.only(bottom: 15.h),
//           padding: EdgeInsets.all(20.w),
//           decoration: BoxDecoration(
//               color: primaryColor, borderRadius: BorderRadius.circular(20)),
//           child: Container(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       activeTankerRow(id, "Order Id", "3232"),
//                       Container(
//                         padding: EdgeInsets.symmetric(
//                             vertical: 8.h, horizontal: 21.w),
//                         decoration: BoxDecoration(
//                             color: greenColor,
//                             borderRadius: BorderRadius.circular(10)),
//                         child: Text(
//                           "Active",
//                           style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 15.sp,
//                               fontWeight: FontWeight.w500),
//                         ),
//                       ),
//                     ]),
//                 SizedBox(
//                   height: 13.h,
//                 ),
//                 activeTankerRow(tanker2, "Tanker", "Single"),
//                 SizedBox(
//                   height: 13.h,
//                 ),
//                 Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       activeTankerRow(clock, "Time", "2:43Pm"),
//                       activeTankerRow(calender, "Date", "Mon, Mar 20")
//                     ]),
//               ],
//             ),
//           ),
//         )
//       ],
//     ),
//   );
// }

// Widget activeTankerRow(icon, label, value) {
//   return Row(
//     crossAxisAlignment: CrossAxisAlignment.center,
//     children: [
//       Container(
//         padding: EdgeInsets.all(6.h),
//         decoration: BoxDecoration(
//             color: primaryShade1, borderRadius: BorderRadius.circular(10)),
//         child: Image.asset(
//           icon,
//           height: 18.h,
//           // width: 18.w,
//         ),
//       ),
//       Container(
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Container(
//               margin: EdgeInsets.only(top: 3),
//               child: Text(
//                 "   $label :  ",
//                 style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 16.sp,
//                     fontWeight: FontWeight.bold),
//               ),
//             ),
//             Text(
//               " $value",
//               style: TextStyle(
//                 color: Color.fromARGB(127, 255, 255, 255),
//                 fontSize: 15.sp,
//               ),
//             ),
//           ],
//         ),
//       ),
//     ],
//   );
// }

import 'dart:io';

import 'package:beam_tv_1/Provider/image_provider.dart';
import 'package:beam_tv_1/resources/components/cancel_button.dart';
import 'package:beam_tv_1/resources/image.dart';
import 'package:beam_tv_1/resources/local_data.dart';
import 'package:beam_tv_1/resources/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../data/response/status.dart';
import '../resources/color.dart';
import '../resources/components/header_widget.dart';
import '../resources/components/primary_button.dart';

class EditImageScreen extends StatefulWidget {
  EditImageScreen({Key? key}) : super(key: key);

  @override
  _EditImageScreenState createState() => _EditImageScreenState();
}

class _EditImageScreenState extends State<EditImageScreen> {
  File? _selectedImage;
  // ImageViewModel imageViewModel = ImageViewModel();
  // final _selectedImage = Widget.selectedImage;
  // final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final imageViewModel = Provider.of<ImageViewModel>(context);

    return Scaffold(
      body: Container(
        decoration:
            BoxDecoration(gradient: LinearGradient(colors: blueDarkGradient)),
        child: SafeArea(
          child: Column(
            children: [
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 10.w),
                  child:
                      headerTransparentWidget(context, 8, "Edit Photo", false)),
              SizedBox(
                height: 40,
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50.r),
                          topRight: Radius.circular(50.r))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(50.r),
                                  topRight: Radius.circular(50.r)),
                              child: Image.asset(patternBg1)),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              ImagePicker()
                                  .pickImage(source: ImageSource.gallery)
                                  .then((image) {
                                if (image != null) {
                                  setState(() {
                                    _selectedImage = File(image.path);
                                  });
                                }
                              });
                            },
                            child: Stack(children: [
                              Container(
                                // height: 250.h,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.orange,
                                ),
                                padding: EdgeInsets.all(2.h),
                                child: ClipOval(
                                  child: Container(
                                    clipBehavior: Clip.hardEdge,
                                    decoration: BoxDecoration(
                                      color: Colors.orange,
                                      shape: BoxShape.circle,
                                    ),
                                    child: _selectedImage != null
                                        ? Image.file(
                                            _selectedImage!,
                                            fit: BoxFit.cover,
                                            width: 250.w,
                                            height: 250.h,
                                            // height: 70,
                                          )
                                        : Image.asset(
                                            profileImage,
                                            fit: BoxFit.cover,
                                            width: 250.w,
                                            height: 250.h,
                                          ),
                                  ),
                                ),
                              ),
                              // Positioned(
                              //   right: 1,
                              //   bottom: 0,
                              //   child: Container(
                              //     // height: 100.h,
                              //     // margin: EdgeInsets.only(left: 150.h, ),
                              //     child: Image.asset(
                              //       addphoto,
                              //       // fit: BoxFit.fitWidth,
                              //       // height: 250.h,
                              //     ),
                              //   ),
                              // ),
                            ]),
                          ),
                          SizedBox(
                            height: 45.h,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 65.h, right: 65.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CancelButton(
                                  title: "Cancel",
                                  func: () {
                                    Navigator.pop(context);
                                  },
                                ),
                                PrimaryButton(
                                  title: "Confirm",
                                  loading: imageViewModel.loading,
                                  func: () {
                                    if (_selectedImage == null) {
                                      Utils.snackBar(
                                          "Please select a picture", context);
                                    } else if (_selectedImage != null) {
                                      // String imagePath = _selectedImage!.path;

                                       Map data = {
                                        "ID": "2",
                                        "User_Profile": _selectedImage!.path,
                                      };

                                      imageViewModel.fetchEditProfileList(
                                          context, data);
                                    }

                                  },
                                )
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

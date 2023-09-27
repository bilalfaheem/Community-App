import 'dart:io';

import 'package:beam_tv_1/Function/Navigation/navigate.dart';
import 'package:beam_tv_1/resources/color.dart';
import 'package:beam_tv_1/resources/image.dart';
import 'package:beam_tv_1/resources/local_data.dart';
import 'package:beam_tv_1/view/edit_image_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';

// class ImageProvider with ChangeNotifier {
//   File? _selectedImage;

//   File? get selectedImage => _selectedImage;

//   void setSelectedImage(File? image) {
//     _selectedImage = image;
//     notifyListeners();
//   }
// }

class ProfileInfoTile extends StatefulWidget {
  const ProfileInfoTile({Key? key}) : super(key: key);

  @override
  _ProfileInfoTileState createState() => _ProfileInfoTileState();
}

class _ProfileInfoTileState extends State<ProfileInfoTile> {
  @override
  Widget build(BuildContext context) {
    // final imageProvider = Provider.of<ImageProvider>(context);

    return Container(
      margin: EdgeInsets.symmetric(vertical: 35),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(55)),
        color: Colors.grey[200],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.orange,
                  ),
                  child: Container(
                      height: 80.h,
                      width: 80.h,
                      // clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(profileIcon),
                            fit: BoxFit.fitHeight),
                        shape: BoxShape.circle,
                      ),
                      child: LocalData.profile == ""
                          ? null
                          : Container(
                              height: 130.h,
                              width: 130.h,
                              decoration: BoxDecoration(
                                  color: orange, shape: BoxShape.circle),
                              clipBehavior: Clip.hardEdge,
                              child: Image.network(
                                LocalData.profile,
                                fit: BoxFit.cover,
                                height: 80.h,
                                width: 80.h,
                              )))),
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      LocalData.name.toString(),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      LocalData.address.toString(),
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              navigate(context, EditImageScreen());
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.all(Radius.circular(21)),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 7, 10, 9),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Image.asset(
                          addphoto,
                          height: 23.h,
                        ),
                        Text(
                          "Edit Photo",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

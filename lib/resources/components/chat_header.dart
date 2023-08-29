import 'package:beam_tv_1/resources/color.dart';
import 'package:beam_tv_1/resources/image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget chatHeader(context, title) {
  final size = MediaQuery.of(context).size;
  return SafeArea(
    child: Container(
      height: size.height * 0.045,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset(back, height: 15, width: 15)),
          Container(
            margin: EdgeInsets.only(right: 14, left: 14),
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: orangeDull,
            ),
            child: Image.asset(
              profile,
              color: orange,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title.toString(),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 19,
                    fontWeight: FontWeight.w500),
              ),
              // Container(
              //   margin: EdgeInsets.only(top: 4),
              //   child: Text(
              //     "Last seen 6:30pm",
              //     maxLines: 2,
              //     style: TextStyle(
              //         fontSize: 12,
              //         color: greyTextColor,
              //         fontWeight: FontWeight.w500),
              //   ),
              // ),
            ],
          ),
          Spacer(),
          Column(
            children: [
              // Container(
              //     padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              //     decoration: BoxDecoration(
              //         color: Colors.white.withOpacity(0.12),
              //         borderRadius: BorderRadius.circular(11)),
              //     child: Image.asset(
              //       search,
              //       height: 18,
              //     )),
            ],
          )
        ],
      ),
    ),
  );
}

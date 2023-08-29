import 'package:beam_tv_1/resources/color.dart';
import 'package:beam_tv_1/resources/image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Widget chatBubble(size, String msgType, String text, time) {
  return Container(
    margin: EdgeInsets.only(top: 10),
    padding: EdgeInsets.symmetric(horizontal: 10),
    child: Row(
      // mainAxisSize: MainAxisSize.min,
      mainAxisAlignment:
          msgType == "user" ? MainAxisAlignment.end : MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        msgType == "admin"
            ? Container(
                margin: EdgeInsets.only(right: 10, left: 0),
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                height: size.height * 0.05,
                width: size.height * 0.05,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: orangeDull,
                ),
                child: Image.asset(
                  profileIcon,
                  // color: orange,
                ),
              )
            : Container(),
        // Container(
        //     margin: EdgeInsets.symmetric(horizontal: 7),
        //     // margin: EdgeInsets.fromLTRB(size.width * 0.03,
        //     //     size.width * 0.027, size.width * 0.1, size.width * 0.027),
        //     padding: EdgeInsets.all(8),
        //     decoration: BoxDecoration(
        //         color: msgType == "admin" ? Colors.grey : Colors.transparent,
        //         shape: BoxShape.circle),
        //     child: Image.asset(zsz,
        //         height: 15,
        //         color: msgType == "admin" ? null : Colors.transparent,
        //         fit: BoxFit.contain)),
        Flexible(
          fit: FlexFit.loose,
          child: Container(
            margin: EdgeInsets.only(
                // bottom: 10,
                right: msgType == "admin" ? 30 : 0,
                left: msgType == "user" ? 30 : 0),
            // left: msgType == "user"?30:0),
            padding: EdgeInsets.all(13),
            decoration: BoxDecoration(
                color: msgType == "admin" ? primaryLightShade1 : primaryColor,
                borderRadius: BorderRadius.only(
                    bottomRight: msgType == "admin"
                        ? Radius.circular(20)
                        : Radius.circular(0),
                    bottomLeft: msgType == "user"
                        ? Radius.circular(20)
                        : Radius.circular(0),
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: Column(
              //  mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: Text(
                        "$text",
                        // maxLines: 5,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 17,
                          color:
                              msgType == "admin" ? Colors.black : greyLightBg,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 8),
                      child: Text(
                        DateFormat.jm().format(DateTime.parse(time)),
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          fontSize: 12,
                          color:
                              msgType == "admin" ? Colors.black : greyTileColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        msgType == "user"
            ? Container(
                margin: EdgeInsets.only(right: 0, left: 10),
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                height: size.height * 0.05,
                width: size.height * 0.05,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: greyTileColor,
                ),
                child: Image.asset(
                  profileIcon,
                  color: orange,
                ),
              )
            : Container(),
      ],
    ),
  );
}

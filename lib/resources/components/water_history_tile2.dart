import 'package:CommunityApp/Function/Navigation/navigate.dart';
import 'package:CommunityApp/Model/billing_data_model/water_billing_history.dart';
import 'package:CommunityApp/resources/utils.dart';
import 'package:CommunityApp/view/water_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../color.dart';

class WaterHistoryTile extends StatelessWidget {
  final WaterBillingHistory iteration;
  WaterHistoryTile({super.key, required this.iteration});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigate(
            context,
            WaterDetail(
              value: iteration,
            ));
      },
      child: Container(
        margin: EdgeInsets.only(top: 10, left: 10, right: 10),
        padding: EdgeInsets.symmetric(vertical: 2, horizontal: 25),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(255, 109, 107, 107).withOpacity(0.3),
                // spreadRadius: 4,
                // blurRadius: 2,
                offset: Offset(2, 2),
              )
            ],
            borderRadius: BorderRadius.circular(20.r)),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text.rich(TextSpan(
                      text: 'Month : ',
                      style: TextStyle(fontSize: 16),
                      children: <InlineSpan>[
                        TextSpan(
                          text: Utils.getMonth(iteration.createdAt.toString()),
                          style: TextStyle(fontSize: 16, color: greyTextLight),
                        )
                      ])),

                  // SizedBox(height: 12,),
                  Text.rich(TextSpan(
                      text: 'Bill Amount : ',
                      style: TextStyle(fontSize: 16),
                      children: <InlineSpan>[
                        TextSpan(
                          text: iteration.amount.toString(),
                          style: TextStyle(fontSize: 16, color: greyTextLight),
                        )
                      ]))
                ],
              ),
            ),
            Expanded(
              // flex: 2,
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                          height: 0,
                          margin: EdgeInsets.only(
                            bottom: 25,
                          ),
                          child: Icon(
                            Icons.arrow_forward,
                            size: 30,
                          )),

                      //   Text.rich(
                      // TextSpan(
                      //   text: ' Current Reading: ',
                      //   style: TextStyle(fontSize: 16),
                      //   children: <InlineSpan>[
                      //     TextSpan(
                      //       text: '205',
                      //       style: TextStyle(fontSize: 16,color:AppColors.greyTextLight),
                      //     )
                      //   ]
                      // )
                      // ),
                      // Container(
                      //   padding: EdgeInsets.symmetric(vertical: 3,horizontal: 10),
                      //   decoration: BoxDecoration(
                      //     color: AppColors.greyLightBg,
                      //     borderRadius: BorderRadius.circular(8)
                      //   ),
                      //   child: Text("Delivered",style: TextStyle(fontSize: 15),),
                      // )
                    ],
                  ),
                  // Text.rich(
                  // TextSpan(
                  //   text: 'Previuous Reading : ',
                  //   style: TextStyle(fontSize: 16),
                  //   children: <InlineSpan>[
                  //     TextSpan(
                  //       text: '250',
                  //       style: TextStyle(fontSize: 16,color: greyTextLight),
                  //     )
                  //   ]
                  // )
                  // )
                  // Container(
                  //   margin: EdgeInsets.only(left: 65),
                  //   child: Icon(Icons.arrow_forward, size: 30, )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

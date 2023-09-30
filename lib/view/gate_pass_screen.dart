import 'dart:io';

import 'package:beam_tv_1/ViewModel/pass_view_model.dart';
import 'package:beam_tv_1/data/response/status.dart';
import 'package:beam_tv_1/resources/components/content.dart';
import 'package:beam_tv_1/resources/components/gate_pass.dart';
import 'package:beam_tv_1/resources/components/gate_pass_history.dart';
import 'package:beam_tv_1/resources/components/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GatePassScreen extends StatefulWidget {
  const GatePassScreen({
    super.key,
  });

  @override
  State<GatePassScreen> createState() => _GatePassScreenState();
}

class _GatePassScreenState extends State<GatePassScreen> {
  PassViewModel passViewModel = PassViewModel();

  @override
  void initState() {
    passViewModel.fetchPassList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ChangeNotifierProvider(
              create: (BuildContext context) => passViewModel,
              child: Consumer<PassViewModel>(builder: (context, value, child) {
                switch (value.passList.status) {
                  case Status.INIT:
                                        return Container();
                  case Status.LOADING:
                    return Loading();
                  case Status.ERROR:
                    return Center(
                      child: Content(
                          data: value.passList.message.toString(), size: 18),
                    );
                  case Status.COMPLETED:
                    return Column(
                      children: [
                        GatePass(
                          eventList: value.passList.data!.eventList!,
                          typeList: value.passList.data!.typeList!,
                          visitorList: value.passList.data!.visitorList!,
                          validityList: value.passList.data!.validityList!,
                        ),
                        GatePassHistory(
                            activePassesList: value.passList.data!.activePass!,
                            scannedPassesList:
                                value.passList.data!.scannedPass!)
                      ],
                    );
                  case null:
                }
                return Container();
              }),
            )
          ],
        ),
      ),
    );
  }
}

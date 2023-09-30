import 'package:beam_tv_1/ViewModel/home_view_model.dart';
import 'package:beam_tv_1/data/response/status.dart';
import 'package:beam_tv_1/resources/components/appbar_main.dart';
import 'package:beam_tv_1/resources/components/home_grid.dart';
import 'package:beam_tv_1/resources/components/loading.dart';
import 'package:beam_tv_1/resources/components/recent_activity_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../resources/components/active_tanker.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeViewModel homeViewModel = HomeViewModel();

  @override
  void initState() {
    // TODO: implement initState
    homeViewModel.fetchHomeList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final homeViewModel = Provider.of<HomeViewModel>(context,listen: false);
    // homeViewModel.fetchTestList();
    // TestRepo testRepo = TestRepo();
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          AppBarMain(),
          ChangeNotifierProvider<HomeViewModel>(
              create: (BuildContext context) => homeViewModel,
              child: Consumer<HomeViewModel>(builder: (context, value, child) {
                print("Consumer build");
                switch (value.homeList.status) {
                  case Status.INIT:
                    return Container();
                  case Status.LOADING:
                    return Loading();
                  case Status.ERROR:
                    return Center(
                        child: Text(value.homeList.message.toString()));
                  case Status.COMPLETED:
                    print("complete");
                    final activeData = value.homeList.data!.active;
                    return
                        //  Container();
                        Column(children: [
                      activeData?.activeData!.activeData!.length == 1
                          ? ActiveTanker(
                              value: activeData!,
                              recent: true,
                            )
                          : Container(),
                      HomeGrid(),
                      RecentActivity(
                          value: value.homeList.data!.logsData,
                          activeTanker:
                              activeData?.activeData!.activeData!.length == 1)
                    ]);
                  case null:
                }
                return Container();
              })),
        ],
      )),
    );
  }
}

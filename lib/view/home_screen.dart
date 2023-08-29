import 'package:beam_tv_1/ViewModel/home_view_model.dart';
import 'package:beam_tv_1/data/response/status.dart';
import 'package:beam_tv_1/repo/test_repo.dart';
import 'package:beam_tv_1/resources/components/active_tanker.dart';
import 'package:beam_tv_1/resources/components/appbar_main.dart';
import 'package:beam_tv_1/resources/components/content.dart';
import 'package:beam_tv_1/resources/components/home_grid.dart';
import 'package:beam_tv_1/resources/components/loading.dart';
import 'package:beam_tv_1/resources/components/recent_activity_widget.dart';
import 'package:beam_tv_1/resources/local_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    homeViewModel.fetchTestList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final homeViewModel = Provider.of<HomeViewModel>(context,listen: false);
    // homeViewModel.fetchTestList();
    // TestRepo testRepo = TestRepo();
    LocalData ld = LocalData();
    print("local name home page${LocalData.name}");
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          AppBarMain(),
          // ChangeNotifierProvider(create: create)
          ChangeNotifierProvider<HomeViewModel>(
              create: (BuildContext context) => homeViewModel,
              child:
                  // Builder(builder: (BuildContext context){
                  Consumer<HomeViewModel>(builder: (context, value, child) {
                print("Consumer build");
                switch (value.testList.status) {
                  case Status.LOADING:
                    return
                        // GestureDetector(
                        //   onTap: (){
                        //     homeViewModel.fetchTestList();
                        //     // value.setSS(!value.ss);
                        //   },
                        //   child: Content(data: homeViewModel.testList.status.toString(), size: 12));
                        Loading();
                  case Status.ERROR:
                    return Center(
                        child: Text(value.testList.message.toString()));
                  case Status.COMPLETED:
                    print("complete");
                    return
                        //  Container();
                        Column(children: [
                      // ActiveTanker(),
                      // Content(
                      //     data: LocalData.name.toString(),
                      //     size: 20,
                      //     color: Colors.black),
                      // Content(
                      //     data: "  LocalData().name.toString()",
                      //     size: 20,
                      //     color: Colors.black),
                      HomeGrid(),
                      RecentActivity()
                    ]);
                }
                return Container();
              })),
          // FutureBuilder(
          //     future: testRepo.fetchtestList(),
          //     builder: (context, snapshot) {
          //       if (snapshot.connectionState == ConnectionState.waiting) {
          //         return const Loading();
          //       } else if (snapshot.hasData) {
          //         return Column(children: const [
          //           ActiveTanker(),
          //           HomeGrid(),
          //           RecentActivity()
          //         ]);
          //       } else {
          //         return Content(data: snapshot.error.toString(), size: 12);
          //       }
          //     }),
        ],
      )),
    );
  }
}

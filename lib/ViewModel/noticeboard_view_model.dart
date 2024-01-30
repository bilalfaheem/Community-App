import 'package:CommunityApp/Model/noticeboard_data_model/datum.dart';
import 'package:CommunityApp/Model/noticeboard_data_model/noticeboard_data_model.dart';
import 'package:CommunityApp/data/response/api_response.dart';
import 'package:CommunityApp/repo/noticeboard_repo.dart';
import 'package:flutter/material.dart';

class NoticeboardViewModel with ChangeNotifier {
  final _noticeRepo = NoticeboardRepo();

  ApiResponse<NoticeboardDataModel> _noticeboardList = ApiResponse.loading();
  ApiResponse<NoticeboardDataModel> get noticeboardList => _noticeboardList;

  setNoticeBoardList(ApiResponse<NoticeboardDataModel> response) {
    _noticeboardList = response;
    print(_noticeboardList);
    print("relaod");
    notifyListeners();
  }

  Future<void> fetchNoticeboardList() async {
    setNoticeBoardList(ApiResponse.loading());
    _noticeRepo.fetchNoticeboardList().then((value) {
      print(value);
      setNoticeBoardList(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setNoticeBoardList(ApiResponse.error(error.toString()));
    });
  }

  getNotice(String type) {
    if (_noticeboardList.data!.data != null) {
      for (Datum i in noticeboardList.data!.data!) {
        if (i.type == type) {
          return i;
        }
      }
    }
    return null;
  }
}

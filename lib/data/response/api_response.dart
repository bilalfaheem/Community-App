import 'package:beam_tv_1/data/response/status.dart';

class ApiResponse<T> {
  Status? status;
  T? data;
  String? message;

//Constructor
  ApiResponse(this.status, this.data, this.message);

  ApiResponse.loading() : status = Status.LOADING;
  ApiResponse.completed(this.data) : status = Status.COMPLETED;
  ApiResponse.error(this.message)
      : status = Status.ERROR; //app exception will handle that

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data: $data";
  }
}

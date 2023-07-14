import 'package:intl/intl.dart';

class HistoryUser {
  late String cameraId;
  late DateTime timeStamp;
  String? position;

  HistoryUser(cameraIp, timeStamp, position);

  HistoryUser.fromJson(Map<String, dynamic> json){
    cameraId = json["cameraId"] ?? "";
    timeStamp = DateTime.parse(json["timeStamp"]);
    if (json["position"] != null){
      position = json["position"];
    }
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = Map<String, dynamic>();
    data["cameraId"] = cameraId;
    data["timeStamp"] = timeStamp;
    data["position"] = position;
    return data;
  }
}
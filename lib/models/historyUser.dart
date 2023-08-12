import 'package:intl/intl.dart';

class HistoryUser {
  late String cameraId;
  late DateTime timeStamp;
  String? type;
  int? userId;
  String? id;
  String? position;

  HistoryUser(cameraIp, timeStamp, position, type, id, userId);

  HistoryUser.fromJson(Map<String, dynamic> json){
    cameraId = json["cameraId"] ?? "";
    timeStamp = DateTime.parse(json["timeStamp"]);
    if (json["position"] != null){
      position = json["position"];
    }
    if(json['type'] != null){
      type = json['type'];
    }
    if (json['userId'] != null){
      userId = json['userId'];
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
class HistoryUser {
  late String cameraId;
  late DateTime timeStamp;

  HistoryUser(cameraIp, timeStamp);

  HistoryUser.fromJson(Map<String, dynamic> json){
    cameraId = json["cameraId"] ?? "";
    timeStamp = DateTime.tryParse(json['timeStamp'])!;
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = new Map<String, dynamic>();
    data["cameraId"] = cameraId;
    data["timeStamp"] = timeStamp;
    return data;
  }
}
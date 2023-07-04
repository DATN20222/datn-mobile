class HistoryUser {
  late String cameraIp;
  late DateTime timeStamp;

  HistoryUser(cameraIp, timeStamp);

  HistoryUser.fromJson(Map<String, dynamic> json){
    cameraIp = json["cameraIp"];
    timeStamp = json["timeStamp"];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = new Map<String, dynamic>();
    data["cameraIp"] = cameraIp;
    data["timeStamp"] = timeStamp;
    return data;
  }
}
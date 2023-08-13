class CheckInModel {
  late String userId;
  late DateTime timeStamp;

  CheckInModel(userId, timeStamp);

  CheckInModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    timeStamp = DateTime.parse(json["timeStamp"]);
  }

}
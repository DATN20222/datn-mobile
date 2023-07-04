import 'package:datn/models/events.dart';

class CameraModel {
  String? id;
  late String name;
  late String ip;
  late String image;
  String? type;
  double? temperature;
  double? humidity;
  double? ppm;
  int? count;
  List<EventModel>? event;

  CameraModel({this.id, required this.name, required this.ip});

  CameraModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    name = json['name'];
    ip = json['ip'];
    image = json['image'];
    temperature = json['temperature'] ?? 0.0;
    humidity = json['humidity'];
    ppm = json['ppm'];
    type = json['type'];
    count = json['count'] ?? 8;
    if (json['event'] != null){
      List<EventModel> events = <EventModel>[];
      json['event'].forEach((element) {
        events.add(EventModel.fromJson(element));
      });
      event = events;
    }
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};

    data['ip'] = ip;
    data['name'] = name;
    data['image']= image;
    data['type'] = type;
    if (id != null) {
      data['_id'] = id;
    }

    return data;
  }
}

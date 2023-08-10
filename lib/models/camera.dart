import 'package:datn/models/events.dart';

class CameraModel {
  String? id;
  late String name;
  late String ip;
   String? image;
  String? type;
  late String room;
  double? temperature;
  double? humidity;
  double? ppm;
  int? count;
  String? status;
  List<EventModel>? event;

  CameraModel({this.id, required this.name, required this.ip, required this.room, this.type, this.status});

  CameraModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    name = json['name'];
    ip = json['ip'];
    image = json['image'];
    room = json['room'];
    temperature = (json['temperature'] != null) ? json['temperature'].toDouble() : 0.0;
    humidity = (json['humidity'] != null) ? json['humidity'].toDouble() : 0.0;
    ppm = (json['ppm'] != null)? json['ppm'].toDouble() : 0.0;
    type = json['type'];
    status = json['status'];
    count = json['count'] ?? 0;
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
    data['room'] = room;
    data['type'] = type;
    data['status'] = status;
    if (id != null) {
      data['_id'] = id;
    }

    return data;
  }
}

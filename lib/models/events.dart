class EventModel {
  double? humidity;
  double? temperature;
  double? ppm;
  DateTime? timeStamp;
  int? count;

  EventModel({this.humidity, this.temperature, this.ppm, this.timeStamp, this.count});

  EventModel.fromJson(Map<String, dynamic> json) {
    humidity = (json['humidity'] != null) ? json['humidity'].toDouble() : 0.0;
    temperature =  (json['temperature'] != null) ? json['temperature'].toDouble() : 0.0;
    ppm = (json['ppm'] != null)? json['ppm'].toDouble() : 0.0;
    timeStamp = DateTime.tryParse(json['timeStamp']);
    count = json['count'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};

    if (humidity != null) {
      data['humidity'] = humidity;
    }
    if (temperature != null) {
      data['temperature'] = temperature;
    }
    if (ppm != null) {
      data['ppm'] = ppm;
    }
    if (count != null){
      data['count'] = count;
    }
    return data;
  }
}

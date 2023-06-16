class CamerasModel {
  String? id;
  late String name;
  late String ip;

  CamerasModel({
    String? id,
    required String name,
    required String ip
}){
    this.id = id;
    this.name = name;
    this.ip = ip;
  }

  CamerasModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    ip = json['ip'];

  }

}
abstract class Entity {
  String? id;
  bool? status;
  DateTime? createAt;
  DateTime? updateAt;

  Entity({this.id, this.status, this.createAt, this.updateAt});

  String filter();
}

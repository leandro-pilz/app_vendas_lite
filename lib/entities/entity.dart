abstract class Entity {
  int? id;
  String? externalId;
  bool? status;
  DateTime? createAt;
  DateTime? updateAt;

  Entity({this.id, this.externalId, this.status, this.createAt, this.updateAt});

  String filter();
}

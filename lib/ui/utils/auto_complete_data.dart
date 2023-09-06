import '/entities/entity.dart';

class AutoCompleteData {
  final Entity data;
  final String filter;
  final String display;

  AutoCompleteData({required this.data, required this.filter, required this.display});
}

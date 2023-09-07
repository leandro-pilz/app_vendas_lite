import '/entities/entity.dart';

final class AutoCompleteData {
  final Entity data;
  final String filter;
  final String title;
  final String? subTitle;

  AutoCompleteData({
    required this.data,
    required this.filter,
    required this.title,
    this.subTitle,
  });
}

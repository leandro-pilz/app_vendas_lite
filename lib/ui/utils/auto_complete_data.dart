final class AutoCompleteData<T> {
  final String id;
  final String filter;
  final String title;
  final String? subTitle;

  AutoCompleteData({required this.id, required this.filter, required this.title, this.subTitle});
}

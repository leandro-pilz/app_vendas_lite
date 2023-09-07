final class AutoCompleteData<T> {
  final T data;
  final String filter;
  final String title;
  final String? subTitle;

  AutoCompleteData({required this.data, required this.filter, required this.title, this.subTitle});
}

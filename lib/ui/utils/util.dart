import 'package:flutter/material.dart';

Color listItemBackgroundColor({required int index}) {
  return (index % 2 == 0) ? Colors.white : Colors.grey.shade100;
}

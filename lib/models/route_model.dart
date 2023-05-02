import 'package:flutter/material.dart';

class RouteModel<T> {
  String path;
  Widget page;
  T? bloc;

  RouteModel({required this.path, required this.page, this.bloc});
}

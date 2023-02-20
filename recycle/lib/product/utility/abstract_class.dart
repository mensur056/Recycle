import 'package:flutter/material.dart';

abstract class ProjectLoading<T extends StatefulWidget> extends State<T> {
  bool isLoading = false;
  void _changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }
}

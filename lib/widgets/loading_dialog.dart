// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:servemandu_sp_app/widgets/progress_bar.dart';

class LoadingDialog extends StatelessWidget
{
  final String? message;

  LoadingDialog({this.message});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      key: key,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          circularProgress(),
          const SizedBox(height: 10,),
          Text(message! + ", Please wait..."),
        ],
      ),
    );
  }
}

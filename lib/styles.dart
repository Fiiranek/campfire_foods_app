import 'package:flutter/material.dart';

ButtonStyle btnStyle = ButtonStyle(
  padding: MaterialStateProperty.all<EdgeInsets>(
      EdgeInsets.all(20)
  ),
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(

    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30.0),

    ),
  ),
);
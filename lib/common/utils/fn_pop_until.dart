import 'package:flutter/material.dart';

void fnPopUntil(BuildContext context, String pathName) {
  Navigator.popUntil(
    context, 
    ModalRoute.withName(pathName)
  );
}
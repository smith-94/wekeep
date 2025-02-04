import 'package:flutter/material.dart';

int fnDateUtil(String day) {
    if(day == "월") return 0;
    if(day == "화") return 1;
    if(day == "수") return 2;
    if(day == "목") return 3;
    if(day == "금") return 4;
    if(day == "토") return 5;
    return 6;
}

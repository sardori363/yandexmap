import 'package:flutter/material.dart';
import 'package:hw26/app.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

void main() {
  AndroidYandexMap.useAndroidViewSurface = false;
  runApp(const App());
}
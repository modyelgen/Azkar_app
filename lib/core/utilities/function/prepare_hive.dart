import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../../features/home/domain/entites/azan_entity.dart';
import '../../constant.dart';

Future<void> prepareHive() async {

  Hive.registerAdapter(DateTimeEntityAdapter());
  await Hive.initFlutter();
  await Hive.openBox<DateTimeEntity>(azanBox);
}
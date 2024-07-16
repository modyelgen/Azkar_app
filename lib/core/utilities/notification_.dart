import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:untitled/core/constant.dart';
import 'package:untitled/core/utilities/function/time_zone.dart';
import 'package:untitled/features/home/presentation/manager/home_cubit/home_cubit.dart';
class MyNotification {
 late HomeCubit homeCubit;
  static final flutterLocalNotificationsPlugin=FlutterLocalNotificationsPlugin();

  static Future<void> initNotification()async{
    const androidInitializationSettings= AndroidInitializationSettings('app_icon');
    const darwinInitializationSettings= DarwinInitializationSettings();
    InitializationSettings initializationSetting=const InitializationSettings(android: androidInitializationSettings,iOS: darwinInitializationSettings);
    await flutterLocalNotificationsPlugin.initialize(initializationSetting);
  }
  static Future<void>showNotification({String? pray})async{
    if(basicPrayers.keys.contains(pray)){
      const AndroidNotificationDetails androidDetails=AndroidNotificationDetails("test_notify", "show_notification",importance: Importance.max,priority: Priority.high,);
      const DarwinNotificationDetails iosDetails=DarwinNotificationDetails(badgeNumber: 1);
      const NotificationDetails notificationDetails =NotificationDetails(android:androidDetails,iOS: iosDetails);
      await flutterLocalNotificationsPlugin.show(0, "this is test title", "حان الان موعد صلاة $pray", notificationDetails);
    }
  }
  Future<void> scheduledDailyNotification(String content, String title,{int? hr, int?min})async{
    await flutterLocalNotificationsPlugin.zonedSchedule(
        0,
        title, content,
        MyTimeZone().scheduleDaily(hr,min),
       const  NotificationDetails(android: AndroidNotificationDetails('Daily Notification', "doaa",priority: Priority.high,), ),
        uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        matchDateTimeComponents: DateTimeComponents.time,

    );
  }

}


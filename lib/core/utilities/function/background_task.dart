// import 'dart:ui';
//
// import 'package:flutter_background_service/flutter_background_service.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:untitled/features/home/presentation/manager/home_cubit/home_cubit.dart';
// class MyBackgroundService{
//  late  HomeCubit homeCubit;
//
//   Future<void> initBackGround()async{
//   final service=FlutterBackgroundService();
//   const AndroidNotificationChannel channel=AndroidNotificationChannel("my_foreground", "my_foregroundService",importance: Importance.high);
//   FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin=FlutterLocalNotificationsPlugin();
//   await flutterLocalNotificationsPlugin
//       .resolvePlatformSpecificImplementation<
//       AndroidFlutterLocalNotificationsPlugin>()
//       ?.createNotificationChannel(channel);
//   await service.configure(
//     androidConfiguration: AndroidConfiguration(
//       // this will be executed when app is in foreground or background in separated isolate
//       onStart: onStart,
//
//       // auto start service
//       autoStart: true,
//       isForegroundMode: true,
//
//       notificationChannelId: 'my_foreground',
//       initialNotificationTitle: 'AWESOME SERVICE',
//       initialNotificationContent: 'Initializing',
//       foregroundServiceNotificationId: 888,
//     ), iosConfiguration: IosConfiguration(),
//
//   );
//
//   service.startService();
//   }
//   @pragma('vm:entry-point')
//   void onStart(ServiceInstance service)async{
//     DartPluginRegistrant.ensureInitialized();
//     homeCubit.getCurrDuration();
//   }
// }
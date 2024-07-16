import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/bloc_observer.dart';
import 'package:untitled/core/utilities/function/set_up_locator.dart';
import 'package:untitled/core/utilities/function/time_zone.dart';
import 'package:untitled/core/utilities/shared_pref.dart';
import 'package:untitled/features/splash/presentation/views/splash_view.dart';
import 'core/utilities/function/prepare_hive.dart';
import 'core/utilities/notification_.dart';
import 'features/home/data/repos/home_repo_impl.dart';
import 'features/home/presentation/manager/home_cubit/home_cubit.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await prepareMain();
  runApp(const AzkarApp());
}

Future<void> prepareMain() async {
  setUp();
  await CachedDateSharedPreferences.cacheInitialization();
  await prepareHive();
  await MyTimeZone.timeZoneConfig();
  Bloc.observer=SimpleBlocObserver();
  MyNotification.initNotification();
}
class AzkarApp extends StatelessWidget {
  const AzkarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocProvider (
      create: (context)=> HomeCubit(
        getIt.get<HomeRepoImp>())..place..getDoaaOfTheDay(context)..getUserLocation(),

      child: MaterialApp(
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            color: Colors.green,),
          fontFamily: "Tajawal",
        ),
        debugShowCheckedModeBanner: false,
        home: const SplashView(),
      ),
    );
  }
}


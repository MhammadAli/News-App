import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:untitled/layout/home_layout.dart';
import 'package:untitled/layout/news_app/cubit/cubit.dart';
import 'package:untitled/layout/news_app/cubit/states.dart';
import 'package:untitled/layout/news_app/news_layout.dart';
import 'package:untitled/shared/cubit/cubit.dart';
import 'package:untitled/shared/cubit/states.dart';
import 'package:untitled/shared/network/local/cache_helper.dart';
import 'package:untitled/shared/network/remote/dio_helper.dart';

import 'shared/block_observer.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized(); //it runs the applications after everything in the method is done.
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();

  final bool isDark = CacheHelper.getBoolean(key: 'isDark');
  runApp( MyApp(isDark));
}

class MyApp extends StatelessWidget {
  final bool isDark;
  MyApp(this.isDark);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit()
        ..changeAppTheme(
          fromShared: isDark,
        )
        ..getBusinessNews()
        ..getSportsNews()
        ..getScienceNews(),
      child: BlocBuilder<NewsCubit, NewsStates>(
        builder: (context, state) {
          final cubit = NewsCubit.get(context);
          return MaterialApp(
            theme: ThemeData(
              textTheme: TextTheme(
                bodyLarge: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
              progressIndicatorTheme: ProgressIndicatorThemeData(
                color: Colors.deepOrange,
              ),
              appBarTheme: AppBarTheme(
                titleSpacing: 20,
                iconTheme: IconThemeData(color: Colors.black),
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.white,
                  statusBarIconBrightness: Brightness.dark,
                ),
                titleTextStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black),
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Colors.deepOrange),
              floatingActionButtonTheme: FloatingActionButtonThemeData(
                backgroundColor: Colors.deepOrange,
              ),
            ),
            darkTheme: ThemeData(
              scaffoldBackgroundColor: HexColor('333739'),
              progressIndicatorTheme: ProgressIndicatorThemeData(
                color: Colors.deepOrange,
              ),
              appBarTheme: AppBarTheme(
                titleSpacing: 20,
                color: HexColor('333739'),
                iconTheme: IconThemeData(color: Colors.white),
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: HexColor('333739'),
                  statusBarIconBrightness: Brightness.light,
                ),
                titleTextStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  backgroundColor: HexColor('333739'),
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Colors.deepOrange),
              unselectedWidgetColor: Colors.grey,
              floatingActionButtonTheme: FloatingActionButtonThemeData(
                backgroundColor: Colors.deepOrange,
              ),
              textTheme: TextTheme(
                bodyLarge: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              ),
            ),
            themeMode: cubit.isDark ? ThemeMode.dark : ThemeMode.light,
            debugShowCheckedModeBanner: false,
            home: NewsLayout(),
          );
        },
      ),
    );
  }
}

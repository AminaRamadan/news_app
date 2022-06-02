import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/news_app/cubit/cubit.dart';
import 'package:news_app/layout/news_app/news_layout.dart';
import 'package:news_app/shared/bloc_observer.dart';
import 'package:news_app/shared/network/local/cashe_helper.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  CasheHelper.init();
  bool? isDark = CasheHelper.getData(key: 'isDark');

  BlocOverrides.runZoned(
        () {
      runApp(MyApp(
        isDark: isDark,
      ));
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatefulWidget {

  final bool? isDark;
  MyApp({
    this.isDark
  });

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => NewsCubit()
              ..getBusiness()
              ..getSports()
              ..getScience()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,

        themeMode: ThemeMode.light,
        home: NewsLayout(),
      ),
    );
  }
}
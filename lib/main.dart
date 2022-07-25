import 'package:baking_app_ui/bloc/bottom_sheet/bottom_sheet_bloc.dart';
import 'package:baking_app_ui/bloc/operations/operations_bloc.dart';
import 'package:baking_app_ui/bloc/page/page_bloc.dart';
import 'package:baking_app_ui/pages/main/main_page.dart';
import 'package:baking_app_ui/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => OperationsBloc()),
        BlocProvider(create: (context) => PageBloc()),
        BlocProvider(create: (context) => BottomSheetBloc()),
      ],
      child: MaterialApp(
        title: 'Bakign App UI',
        debugShowCheckedModeBanner: false,
        theme: getThemeData(context),
        home: const MainPage(),
      ),
    );
  }
}

import 'package:baking_app_ui/bloc/nav_bar/nav_bar_bloc.dart';
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
        BlocProvider(create: (context) => NavBarBloc()),
      ],
      child: Builder(builder: (context) {
        final navBarBloc = context.read<NavBarBloc>();
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => PageBloc(navBarBloc: navBarBloc)),
          ],
          child: MaterialApp(
            title: 'Bakign App UI',
            debugShowCheckedModeBanner: false,
            theme: getThemeData(context),
            home: const MainPage(),
          ),
        );
      }),
    );
  }
}

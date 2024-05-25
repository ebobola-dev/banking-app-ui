import 'package:baking_app_ui/theme/config.dart';
import 'package:flutter/material.dart';

ThemeData getThemeData(BuildContext context) => ThemeData.dark().copyWith(
      primaryColor: ThemeConfig.primaryColor,
      secondaryHeaderColor: ThemeConfig.secondaryColor,
      scaffoldBackgroundColor: ThemeConfig.backgroundColor,
      iconTheme: const IconThemeData(color: ThemeConfig.iconColor),
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
        ),
        displayMedium: TextStyle(
          fontSize: 22.0,
          fontWeight: FontWeight.bold,
        ),
        displaySmall: TextStyle(
          fontSize: 15.0,
          fontWeight: FontWeight.bold,
        ),
        headlineMedium: TextStyle(
          fontSize: 15.0,
          fontWeight: FontWeight.w600,
          color: Color(0x4DFFFFFF),
        ),
        headlineSmall: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ).apply(
        fontFamily: 'Metropolis',
        bodyColor: ThemeConfig.textColor,
      ),
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        color: ThemeConfig.secondaryColor,
        iconTheme: IconThemeData(color: ThemeConfig.iconColor),
        titleTextStyle: TextStyle(
          color: ThemeConfig.textColor,
          fontFamily: "Gilroy",
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      textSelectionTheme:
          const TextSelectionThemeData(cursorColor: ThemeConfig.textColor),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: ThemeConfig.primaryColor,
          padding: const EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 10.0,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          shadowColor: ThemeConfig.primaryColor,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          textStyle: const TextStyle(
            fontFamily: "Gilroy",
            color: ThemeConfig.primaryColor,
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: TextStyle(
          color: Colors.black.withOpacity(.7),
          fontFamily: 'SF Pro Text',
          fontSize: 17.0,
        ),
        errorStyle: const TextStyle(
          fontFamily: 'SF Pro Text',
          fontSize: 12.0,
        ),
        filled: true,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide.none,
        ),
      ),
      dialogBackgroundColor: ThemeConfig.backgroundColor,
      dialogTheme: const DialogTheme(
        alignment: Alignment.center,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
      ),
      navigationBarTheme: const NavigationBarThemeData(
        backgroundColor: ThemeConfig.navBarColor,
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
      popupMenuTheme: const PopupMenuThemeData(
        color: ThemeConfig.secondaryColor,
        elevation: 7.0,
        textStyle: TextStyle(
          fontSize: 15.0,
          fontFamily: ThemeConfig.font,
        ),
      ),
      colorScheme: const ColorScheme.dark(
        primary: ThemeConfig.primaryColor,
        secondary: ThemeConfig.secondaryColor,
      ).copyWith(background: ThemeConfig.backgroundColor),
    );

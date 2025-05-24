import 'package:expense_tracker/expenses.dart';
import 'package:flutter/material.dart';

var kColorScheme = ColorScheme.fromSeed(seedColor:const Color.fromARGB(255, 96, 59, 181));
var kDarkColorScheme = ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 5, 99, 125),
    brightness: Brightness.dark);

void main(){
  runApp(MaterialApp(
    darkTheme: ThemeData.dark().copyWith(
      colorScheme: kDarkColorScheme,
      cardTheme: CardTheme().copyWith(
        color: kDarkColorScheme.secondaryContainer,
        margin: EdgeInsets.symmetric(horizontal: 16, vertical:  8),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: kDarkColorScheme.primaryContainer,
            foregroundColor: kDarkColorScheme.onPrimaryContainer
          )
      ),
    ),
    theme: ThemeData().copyWith(
    colorScheme: kColorScheme,
      appBarTheme: AppBarTheme().copyWith(
        backgroundColor: kColorScheme.onPrimaryContainer,
        foregroundColor: kColorScheme.primaryContainer,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: kColorScheme.primaryContainer
        )
      ),
      cardTheme: CardTheme().copyWith(
        color: kColorScheme.secondaryContainer,
        margin: EdgeInsets.symmetric(horizontal: 16, vertical:  8),
      ),
        textTheme: ThemeData().textTheme.copyWith(
          titleLarge: TextStyle(
            fontWeight: FontWeight.normal,
            color: kColorScheme.onSecondaryContainer,
            fontSize: 14,
          ),
        )
    ),
    debugShowCheckedModeBanner: false,
    home: Expenses(),
      ));
}

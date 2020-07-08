import 'package:flutter/material.dart';
import 'package:mijmajmoe/grid.dart';
import 'package:provider/provider.dart';
import 'player.dart';
import 'player_provider.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MijMajMoe());
}

class MijMajMoe extends StatelessWidget {
  final Player player1 = Player(playerIndex: 1, character: '🏎');
  final Player player2 = Player(playerIndex: 2, character: '🚌');
  final ColorScheme colorScheme = ColorScheme(
    primary: Color(0xFF00bb53),
    primaryVariant: Color(0xFF00DF8F),
    secondary: Color(0xFFdf004e),
    secondaryVariant: Color(0XFF930044),
    surface: Color(0XFFFFFFFF),
    background: Color(0XFFe0faec),
    error: Color(0XFF9100df),
    onPrimary: Color(0XFFFFFFFF),
    onSecondary: Color(0XFFFFFFFF),
    onSurface: Color(0XFF454545),
    onBackground: Color(0XFF454545),
    onError: Color(0XFFFFFFFF),
    brightness: Brightness.dark,
  );

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PlayerProvider>(
        create: (context) => PlayerProvider(player1, player2),
        builder: (context, widget) {
          return MaterialApp(
            title: 'Mij Maj Moe',
            theme: ThemeData(
              colorScheme: colorScheme,
              canvasColor: Colors.transparent,
              buttonTheme: ButtonThemeData(
                  textTheme: ButtonTextTheme.primary,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0))),
              cardTheme: CardTheme(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0))),
              textTheme: TextTheme(
                headline1: GoogleFonts.modak(
                    fontSize: 91,
                    fontWeight: FontWeight.w300,
                    letterSpacing: -1.5),
                headline2: GoogleFonts.modak(
                    fontSize: 57,
                    fontWeight: FontWeight.w300,
                    letterSpacing: -0.5,
                    height: 0.5,
                    color: colorScheme.primary),
                headline3: GoogleFonts.modak(
                    fontSize: 45, fontWeight: FontWeight.w400),
                headline4: GoogleFonts.modak(
                    fontSize: 32,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.25),
                headline5: GoogleFonts.modak(
                  fontSize: 23,
                  fontWeight: FontWeight.w400,
                  color: colorScheme.onBackground,
                ),
                headline6: GoogleFonts.modak(
                    fontSize: 19,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.15,
                    color: colorScheme.onBackground),
                subtitle1: GoogleFonts.modak(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.15),
                subtitle2: GoogleFonts.modak(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.1),
                bodyText1: GoogleFonts.roboto(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.5),
                bodyText2: GoogleFonts.roboto(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.25),
                button: GoogleFonts.roboto(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.25),
                caption: GoogleFonts.roboto(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.4),
                overline: GoogleFonts.roboto(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 1.5),
              ),
              // This is the theme of your application.
              //
              // Try running your application with "flutter run". You'll see the
              // application has a blue toolbar. Then, without quitting the app, try
              // changing the primarySwatch below to Colors.green and then invoke
              // "hot reload" (press "r" in the console where you ran "flutter run",
              // or simply save your changes to "hot reload" in a Flutter IDE).
              // Notice that the counter didn't reset back to zero; the application
              // is not restarted.
              primarySwatch: Colors.blue,
              // This makes the visual density adapt to the platform that you run
              // the app on. For desktop platforms, the controls will be smaller and
              // closer together (more dense) than on mobile platforms.
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            home: Grid(),
            // home: MyHomePage(title: 'Flutter Demo Home Page'),
          );
        });
  }
}

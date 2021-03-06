import 'package:flutter/material.dart';
import 'package:mijmajmoe/screens/grid_screen.dart';
import 'models/player.dart';
import 'player_provider.dart';

import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

const Color primaryColor = Color(0xFF0B5C30);
const Color onBackgroundColor = Color(0xFF5A5A5A);

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MijMajMoe());
}

class MijMajMoe extends StatelessWidget {
  final Player player1 = Player(playerIndex: 1, character: '🐸');
  final Player player2 = Player(playerIndex: 2, character: '🚌');
  final ColorScheme colorScheme = ColorScheme(
    primary: primaryColor,
    primaryVariant: Color(0xFF69C090),
    secondary: Color(0xFFdf004e),
    secondaryVariant: Color(0xFF930044),
    surface: Color(0xFFDCEBDC),
    background: Color(0xFFF2FDF7),
    error: Color(0xFF9100df),
    onPrimary: Color(0xFFFFFFFF),
    onSecondary: Color(0xFFFFFFFF),
    onSurface: Color(0xFF454545),
    onBackground: onBackgroundColor,
    onError: Color(0xFFFFFFFF),
    brightness: Brightness.dark,
  );
  final TextTheme textTheme = TextTheme(
    headline1: GoogleFonts.modak(
        fontSize: 91, fontWeight: FontWeight.w300, letterSpacing: -1.5),
    headline2: GoogleFonts.modak(
        fontSize: 52,
        fontWeight: FontWeight.w300,
        letterSpacing: 0.6,
        height: 0.5,
        shadows: [
          Shadow(color: Colors.white, blurRadius: 4.0),
        ],
        color: primaryColor),
    headline3: GoogleFonts.modak(fontSize: 45, fontWeight: FontWeight.w400),
    headline4: GoogleFonts.modak(
        fontSize: 32, fontWeight: FontWeight.w400, letterSpacing: 0.25),
    headline5: GoogleFonts.modak(
      fontSize: 21,
      fontWeight: FontWeight.w400,
      color: onBackgroundColor,
    ),
    headline6: GoogleFonts.roboto(
        fontSize: 17,
        fontWeight: FontWeight.w300,
        letterSpacing: 0.1,
        color: onBackgroundColor),
    subtitle1: GoogleFonts.modak(
        fontSize: 15, fontWeight: FontWeight.w400, letterSpacing: 0.15),
    subtitle2: GoogleFonts.modak(
        fontSize: 13, fontWeight: FontWeight.w500, letterSpacing: 0.1),
    bodyText1: GoogleFonts.roboto(
        fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.5),
    bodyText2: GoogleFonts.roboto(
        fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25),
    button: GoogleFonts.roboto(
        fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 1.25),
    caption: GoogleFonts.roboto(
        fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4),
    overline: GoogleFonts.roboto(
        fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5),
  );

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PlayerProvider>(
        create: (context) => PlayerProvider(player1, player2),
        builder: (context, widget) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
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
              textTheme: textTheme,
              primarySwatch: Colors.blue,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            home: Container(
              child: GridScreen(),
              color: colorScheme.background,
            ),
          );
        });
  }
}

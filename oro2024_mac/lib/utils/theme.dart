import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData myTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  primaryColor: const Color(0xFF0D5D9A),
  primaryColorLight: Colors.white,
  primaryColorDark: Colors.black,
  canvasColor: Colors.white,
  scaffoldBackgroundColor: Colors.white.withOpacity(0.95),
  // scaffoldBackgroundColor: Color(0xfff3f3f3),
  // cardColor: Colors.purple[100],
  // dividerColor: Colors.black,
  focusColor: Colors.blue,
  hoverColor: Colors.grey[300],
  highlightColor: Colors.transparent,
  splashColor: Colors.transparent,
  splashFactory: InkSplash.splashFactory,
  // unselectedWidgetColor: Colors.grey,
  disabledColor: Colors.grey[400],
  fontFamily: GoogleFonts.poppins().fontFamily,

  popupMenuTheme: const PopupMenuThemeData(
    color: Colors.white
  ),

  bottomSheetTheme: BottomSheetThemeData(
    surfaceTintColor: Colors.white.withOpacity(0.95),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(topLeft: Radius.circular(28), topRight: Radius.circular(28)),
    ),
  ),

  dividerTheme: const DividerThemeData(
    color: Colors.black,
    thickness: 0.15,
    indent: 50,
    endIndent: 50.0
  ),

  //App bar theme
  appBarTheme: AppBarTheme(
    iconTheme: const IconThemeData(
      color: Colors.white
    ),
    titleTextStyle: TextStyle(
      color: Colors.white,
      // color: const Color(0xFF0D5D9A),
      fontSize: 22,
      fontFamily:GoogleFonts.poppins().fontFamily
    ),
    elevation: 3,
    // surfaceTintColor: Colors.white,
    shadowColor: Colors.white,
    color: const Color(0xFF0D5D9A),
    // color: Colors.white,
    systemOverlayStyle: SystemUiOverlayStyle.light,
  ),

  //button theme
  buttonTheme: const ButtonThemeData(
    textTheme: ButtonTextTheme.normal,
    buttonColor: Colors.white,
  ),

  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
        side: BorderSide(
          color: Color(0xFF0D5D9A)
        ),
        textStyle: TextStyle(fontWeight: FontWeight.bold)
    )
  ),
  // Elevated button theme
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      // surfaceTintColor: const Color(0xFF0D5D9A),
      backgroundColor: const Color(0xFF0D5D9A),
      foregroundColor: Colors.white,
      textStyle: TextStyle(fontWeight: FontWeight.bold),
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      animationDuration: const Duration(seconds: 2)
    ),
  ),

  secondaryHeaderColor: Colors.white,
  dialogBackgroundColor: Colors.white,
  indicatorColor: Colors.blue,
  hintColor: Colors.grey,

  dialogTheme: const DialogTheme(
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold
      ),
      surfaceTintColor: Colors.white
  ),

  //Text theme
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      color: Colors.black
    ),
    displayMedium: TextStyle(
      color: Colors.black,
    ),
    displaySmall: TextStyle(
      color: Colors.black,
    ),
    headlineLarge: TextStyle(
      color: Colors.blue,
    ),
    headlineMedium: TextStyle(
      color: Colors.black,
    ),

    //for drawer title
    headlineSmall: TextStyle(
      color: Colors.white,
    ),
    titleLarge: TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    titleMedium: TextStyle(
      color: Colors.black,
    ),
    titleSmall: TextStyle(
      color: Colors.black,
    ),
    bodyLarge: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold
    ),
    bodyMedium: TextStyle(
      color: Colors.black,
      fontSize: 16
    ),
    bodySmall: TextStyle(
      color: Colors.black,
    ),
    labelLarge: TextStyle(
      color: Colors.white,
    ),
    labelMedium: TextStyle(
      color: Colors.black,
    ),
    labelSmall: TextStyle(
      color: Colors.black,
    ),
  ),

  bottomAppBarTheme: const BottomAppBarTheme(color: Colors.white),

  checkboxTheme: CheckboxThemeData(
    fillColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
     if (states.contains(MaterialState.disabled)) { return null; }
     if (states.contains(MaterialState.selected)) { return const Color(0xFF0D5D9A); }
     return null;
 }),
  ),

  radioTheme: RadioThemeData(
   fillColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
   if (states.contains(MaterialState.disabled)) { return null; }
   if (states.contains(MaterialState.selected)) { return const Color(0xFF0D5D9A); }
   return null;
 }),
 ),

  switchTheme: SwitchThemeData(
       thumbColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
       if (states.contains(MaterialState.disabled)) { return const Color(0xFF0D5D9A); }
       if (states.contains(MaterialState.selected)) { return const Color(0xFFFFCB3A); }
       return Color(0xFF0D5D9A);
     }),

     trackColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
       if (states.contains(MaterialState.disabled)) { return null; }
       if (states.contains(MaterialState.selected)) { return const Color(0xFF0D5D9A); }
       return null;
     }),
    trackOutlineColor: MaterialStateProperty.all(const Color(0xFF0D5D9A))
 ),

  iconTheme: const IconThemeData(color: Color(0xFF0D5D9A)),
  primaryIconTheme: const IconThemeData(color: Color(0xFF0D5D9A)),

  sliderTheme: SliderThemeData(
    activeTrackColor: const Color(0xFF0D5D9A),
    inactiveTrackColor: Colors.grey[300],
    thumbColor: const Color(0xFF0D5D9A),
    overlayColor: const Color(0x290D5D9A),
  ),

  //Tab bar theme
  tabBarTheme: TabBarTheme(
    // labelColor: Colors.white,
    // unselectedLabelColor: Colors.grey,
    indicatorColor: Color(0xFFFFCB3A),
    // labelStyle: TextStyle(fontFamily: GoogleFonts.poppins().fontFamily, fontSize: 16)
  ),

  tooltipTheme: TooltipThemeData(
    decoration: BoxDecoration(
      color: Colors.black87,
      borderRadius: BorderRadius.circular(4),
    ),
    textStyle: const TextStyle(color: Colors.white),
  ),

  cardTheme: CardTheme(
    color: Colors.white,
    elevation: 4,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(0),
    ),
  ),

  listTileTheme: ListTileThemeData(
    titleTextStyle: TextStyle(
      fontSize: 16,
      color: Colors.black,
      fontFamily: GoogleFonts.poppins().fontFamily
    )
  ),


  chipTheme: ChipThemeData(
    backgroundColor: Colors.grey[300],
    deleteIconColor: Colors.grey,
    selectedColor: const Color(0xFF0D5D9A),
    secondarySelectedColor: Colors.grey,
    labelStyle: const TextStyle(color: Colors.black),
    padding: const EdgeInsets.all(8),
    shape: const StadiumBorder(),
  ),

  inputDecorationTheme: InputDecorationTheme(
    labelStyle: TextStyle(color: Colors.black45),
    filled: true,
    fillColor: const Color(0xFF0D5D9A).withOpacity(0.1),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide.none
    ),
    activeIndicatorBorder: const BorderSide(
      color: Color(0xFF0D5D9A)
    ),
    contentPadding: const EdgeInsets.all(15)
  ),

  platform: TargetPlatform.android,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  applyElevationOverlayColor: true,
  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
  colorScheme: ColorScheme.fromSwatch(primarySwatch: const MaterialColor(0xFF0D5D9A, {
    50: Color(0xFF0D5D9A),
    100: Color(0xFF0D5D9A),
    200: Color(0xFF0D5D9A),
    300: Color(0xFF0D5D9A),
    400: Color(0xFF0D5D9A),
    500: Color(0xFF0D5D9A),
    600: Color(0xFF0D5D9A),
    700: Color(0xFF0D5D9A),
    800: Color(0xFF0D5D9A),
    900: Color(0xFF0D5D9A),
  })).copyWith(
    background: const Color(0xFF0D5D9A),
    secondary: const Color(0xFFFFCB3A),
  ).copyWith(secondary: const Color(0xFFFFCB3A)).copyWith(background: Colors.white).copyWith(error: Colors.red),
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: Colors.blue,
    selectionColor: Colors.blue,
    selectionHandleColor: Colors.blue,),
);


part of 'theme.dart';

TextTheme _textTheme(TextTheme textTheme) => GoogleFonts.latoTextTheme(textTheme).copyWith(
      labelLarge: GoogleFonts.lato(
        fontWeight: FontWeight.w600,
      ),
      titleLarge: GoogleFonts.lato(
        fontWeight: FontWeight.w600,
      ),
    );

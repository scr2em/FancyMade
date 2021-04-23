import 'package:finalproject/ui/main/main_locale_provider.dart';
import "package:flutter/material.dart";
import 'package:provider/provider.dart';

class LanguageTextSwitcher extends StatelessWidget {
  String ar;
  String en;
  TextStyle style = TextStyle();
  Object overflow;
  int maxline;

  LanguageTextSwitcher(
      {this.ar, this.en, this.style, this.maxline, this.overflow});

  @override
  Widget build(BuildContext context) {
    return Provider.of<MainLocaleProvider>(context)
                .applicationLocale
                .languageCode ==
            "ar"
        ? Text(
            ar,
            style: style,
            overflow: overflow,
            maxLines: maxline,
          )
        : Text(
            en,
            style: style,
            overflow: TextOverflow.ellipsis,
            maxLines: maxline,
          );
  }
}

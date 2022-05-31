
// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';


enum FontSize {
  SMALL,
  TITLE,
  CONTENT,
  LARGE,
  OTHER,
}

///设置横线
class HorizontalLine extends StatelessWidget {
  final double dashedWidth;
  final double dashedHeight;
  final Color color;
  final double edgeSize;

  const HorizontalLine(
      {Key? key, this.dashedHeight = 1,
        this.dashedWidth = double.infinity,
        this.color = const Color(0xfff6f6f6),
        this.edgeSize = 0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: edgeSize, right: edgeSize),
      child: Container(width: dashedWidth, height: dashedHeight, color: color),
    );
  }
}

/// TextTool
class TextTool {
  
  ///文字宽高
  static Size boundingTextSize(String text,
      {
        FontSize fontSize= FontSize.TITLE,
        FontWeight fontWeight = FontWeight.normal, 
        int maxLines = 2 ^ 31, double maxWidth = double.infinity}) {
    if (text.isEmpty) {
      return Size.zero;
    }
    final TextPainter textPainter = TextPainter(
        textDirection: TextDirection.ltr,
        text: TextSpan(text: text, style: TextStyle(fontSize: textFont(fontSize),fontWeight: fontWeight)),
        maxLines: maxLines)
      ..layout(maxWidth: maxWidth);
    return textPainter.size;
  }

  
  
  /// Text
  static Text textTitle(String title,
      { FontSize fontSize = FontSize.TITLE,
        Color color = Colors.black,
        FontWeight fontWeight = FontWeight.normal,
        int maxLines = 2 ^ 31}) {
    return Text(title,
        style:
        TextStyle(fontSize: textFont(fontSize), color: color, fontWeight: fontWeight),
        overflow: TextOverflow.ellipsis,
        maxLines: maxLines);
  }

 ///TextFontSize
 static double textFont(FontSize fontSize){
    if(fontSize == FontSize.SMALL){
      return 12;
    }
    else if(fontSize == FontSize.TITLE){
      return 17;
    }
    else if(fontSize == FontSize.CONTENT){
      return 15;
    }
    else if(fontSize == FontSize.LARGE){
      return 20;
    }
    else if(fontSize == FontSize.OTHER){
      return 24;
    }
    else { return 10;}

  }


}





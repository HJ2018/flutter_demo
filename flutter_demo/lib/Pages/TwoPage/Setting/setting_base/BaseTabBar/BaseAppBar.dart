import 'package:flutter/material.dart';

baseAppBar(
    BuildContext context,
    String title, {

      ///
      String? rightText,

      ///
      String? rightImgPath,

      ////
      Widget? leftItem,

      ///
      List<Widget>? rightActions,

      ///
      Color? rightTextColor,

      ///
      bool isBack = true,
      ///
      Color backgroundColor = Colors.white,

      ///
      Brightness brightness =  Brightness.light,

      ///
      double elevation = 0,

      ///
      PreferredSizeWidget? bottom,
      ///
      Function? rightItemCallBack,

      ///
      Function? backCallBack,
    }) {



  /// backgroundColor
  Color _color =(backgroundColor == Colors.transparent ||
      backgroundColor == Colors.white )
      ? Colors.black
      : Colors.white;



  /// rightItemText
  Widget rightItemText = const Text("");


  /// rightText
  if (_isNull(rightText)) {
    rightItemText = InkWell(
      child: Container(
          margin: const EdgeInsets.all(15),
          color: Colors.transparent,
          child: Center(
              child: Text(rightText!,
                  style: TextStyle(fontSize: 16, color: rightTextColor ?? _color)))),
      onTap: () {
        if (rightItemCallBack != null) {
          rightItemCallBack();
        }
      },
    );
  }


  /// rightImgPath
  if (_isNull(rightImgPath)) {
    rightItemText = IconButton(
      icon: Image.asset(
        rightImgPath!,
        width: 22, height: 22,
        color: _color,
      ),
      onPressed: () {
        if (rightItemCallBack != null) {
          rightItemCallBack();
        }
      },
    );
  }


  /// appBar
  return AppBar(
    title: Text(title, style: TextStyle(fontSize: 18, color: _color)),
    centerTitle: true,
    backgroundColor: backgroundColor,
    brightness: brightness,
    bottom: bottom,
    elevation: elevation,
    leading: isBack == false?Container():Row(
      children: [
        IconButton(
          icon: Icon(Icons.arrow_back_ios,color: _color),
          iconSize: 20,
          padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
          onPressed: () {
            if (backCallBack == null) {
              _popThis(context);
            } else {
              backCallBack();
            }
          },
        ),
        const SizedBox(width: 5),
        leftItem ?? Container(),
      ],
    ),
    actions:rightActions ?? <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          rightItemText,
          const SizedBox(width: 5),
        ],
      ),
    ],
  );
}


/// 返回当前页面
void _popThis(BuildContext context) {
  if (Navigator.of(context).canPop()) {
    FocusScope.of(context).requestFocus(FocusNode());
    Navigator.of(context).pop();
  }
}



/// 判断null
bool _isNull(value){
  if(value != "" && value != null){
    return true;
  }else{
    return false;
  }
}


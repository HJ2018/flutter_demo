import 'package:flutter/material.dart';

import 'one_state.dart';

///* tabBar内容******/
Widget essenceContent(OneState state){
  return TabBarView(
    controller: state.tabController,
    children: state.tabBarView!,
  );
}


///* tabBar样式******/
PreferredSizeWidget essenceTabBarBottom(OneState state){
  return PreferredSize(
    preferredSize: const Size.fromHeight(35),
    child: Material(
      color: Colors.blueAccent,
      child: TabBar(
        controller: state.tabController,
        labelColor: Colors.red,
        indicatorSize: TabBarIndicatorSize.label,
        unselectedLabelColor: Colors.white,
        indicatorColor:Colors.red,
        tabs: state.tabs!,
      ),
    ),
  );

}



//
// class FlowLabelTitle extends StatelessWidget{
//
//   final List titles;
//   final double itmeHeight;
//   FlowLabelTitle(this.titles,{this.itmeHeight = 44});
//
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Container(
//       width: APPSize.SCREEN_W()-150,
//       child: Flow(
//           delegate: MyFlowDelegate(boxSize: 25),
//           children: List.generate(1, (index){
//             return Container(
//                 width: 45, height: 24,
//                 alignment: Alignment.center,
//                 child: Container(
//                   decoration:  BoxDecoration(
//                     color: getBgColor(titles[index]),
//                     borderRadius: BorderRadius.all(Radius.circular(2)),
//                   ),
//                   child: Center(
//                     child: Text(titles[index],style: TextStyle(fontSize: 10,color: getTextColor(titles[index])),textAlign:TextAlign.center,),
//                   ),
//                 )
//             );
//           })),
//     );
//   }
// }
//
// class MyFlowDelegate extends FlowDelegate {
//   MyFlowDelegate({this.boxSize});
//   final boxSize;
//   @override
//   void paintChildren(FlowPaintingContext context) {
//     /*屏幕宽度*/
//     var screenW = context.size.width -150;
//     double padding = 2; //间距
//     double offsetX = padding; //x坐标
//     double offsetY = padding; //y坐标
//     for (int i = 0; i < context.childCount; i++) {
//       /*如果当前x左边加上子控件宽度小于屏幕宽度  则继续绘制  否则换行*/
//       if (offsetX + boxSize < screenW) {
//         /*绘制子控件*/
//         context.paintChild(i,
//             transform: Matrix4.translationValues(offsetX, offsetY, 0));
//         /*更改x坐标*/
//         offsetX = offsetX + boxSize + padding;
//       } else {
//         /*将x坐标重置为margin*/
//         offsetX = padding;
//         /*计算y坐标的值*/
//         offsetY = offsetY + boxSize + padding;
//         /*绘制子控件*/
//         context.paintChild(i,transform: Matrix4.translationValues(offsetX, offsetY, 0));
//       }
//     }
//   }
//   @override
//   bool shouldRepaint(FlowDelegate oldDelegate) {
//     return true;
//   }
// }

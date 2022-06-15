
import 'package:flutter/material.dart';

import 'FlowSetting.dart';






class FlowWidget extends StatelessWidget {


  final FlowSetting? config;

  const FlowWidget({Key? key,required this.config}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SingleChildScrollView(
      child: Column(
        children: [
          Flow(
            delegate: _MyFlowDelegate(config?.dataList),
            children: List.generate(config!.dataList!.length, (index) {
              return flowChild(index);
            }),
          ),
        ],
      ),
    );
  }

  Widget flowChild(index){
    return Container(
      width:config!.width,
      height: config!.height,
      color: Colors.red,
      alignment: Alignment.center,
      child: Text(config!.dataList![index]),
    );
  }
}


class _FlowDelegate extends FlowDelegate{
  List<String>? strList;
  _FlowDelegate(this.strList);
  double childPadding=5;
  @override
  void paintChildren(FlowPaintingContext context) {
    /*屏幕宽度*/
    var screenW = context.size.width;
    double padding = 5; //间距
    double offsetX = padding; //x坐标
    double offsetY = padding; //y坐标
    for (int i = 0; i < context.childCount; i++) {
      /*如果当前x左边加上子控件宽度小于屏幕宽度  则继续绘制  否则换行*/
      if (offsetX + 60 < screenW) {
        /*绘制子控件*/
        context.paintChild(i,
            transform: Matrix4.translationValues(offsetX, offsetY, 0));
        /*更改x坐标*/
        offsetX = offsetX + 60 + padding;
      } else {
        /*将x坐标重置为margin*/
        offsetX = padding;
        /*计算y坐标的值*/
        offsetY = offsetY + 35 + padding;
        /*绘制子控件*/
        context.paintChild(i,transform: Matrix4.translationValues(offsetX, offsetY, 0));
      }
    }
  }
  @override
  getSize(BoxConstraints constraints){
    //左侧列高度
    double leftHeight=0;
    //右侧列高度
    double rightHeight=0;
    for(int i=0;i<strList!.length;i++){
      int a=i%2;
      if(a==0){
        leftHeight+=45+childPadding;
      }else{
        rightHeight+=45+childPadding;
      }
    }
    //根据左侧列高度，和右侧列高度，判断部件的高度(取最大值)
    double flowHeight=leftHeight>rightHeight?leftHeight:rightHeight;
    //指定Flow的大小
    return Size(double.infinity,flowHeight);
  }
  @override
  bool shouldRepaint(covariant FlowDelegate oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}


class FlowDemo extends StatefulWidget{
  @override
  _FlowDemoState createState()=>_FlowDemoState();
}
class _FlowDemoState extends State<FlowDemo>{
  List<String> strList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    strList.addAll(['a','b','c','d','e','f','g','h']);
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SingleChildScrollView(
      child: Column(
        children: [
          Flow(
            delegate: _MyFlowDelegate(strList),
            children: List.generate(strList.length, (index) {
              return flowChild(index);
            }),
          ),
        ],
      ),
    );
  }

  Widget flowChild(index){
    double width= 60;
    double height=35;
    return Container(
      width: width,
      height: height,
      color: Colors.red,
      alignment: Alignment.center,
      child: Text(strList[index]),
    );
  }
}
//继承FlowDelegate，并实现paintChildren、showldRepaint、getSize
class _MyFlowDelegate extends FlowDelegate{
  List<String>? strList;
  _MyFlowDelegate(this.strList);
  double childPadding=5;
  @override
  void paintChildren(FlowPaintingContext context) {
    /*屏幕宽度*/
    var screenW = context.size.width;
    double padding = 5; //间距
    double offsetX = padding; //x坐标
    double offsetY = padding; //y坐标
    for (int i = 0; i < context.childCount; i++) {
      /*如果当前x左边加上子控件宽度小于屏幕宽度  则继续绘制  否则换行*/
      if (offsetX + 60 < screenW) {
        /*绘制子控件*/
        context.paintChild(i,
            transform: Matrix4.translationValues(offsetX, offsetY, 0));
        /*更改x坐标*/
        offsetX = offsetX + 60 + padding;
      } else {
        /*将x坐标重置为margin*/
        offsetX = padding;
        /*计算y坐标的值*/
        offsetY = offsetY + 35 + padding;
        /*绘制子控件*/
        context.paintChild(i,transform: Matrix4.translationValues(offsetX, offsetY, 0));
      }
    }
  }
  @override
  getSize(BoxConstraints constraints){
    //左侧列高度
    double leftHeight=0;
    //右侧列高度
    double rightHeight=0;
    for(int i=0;i<strList!.length;i++){
      int a=i%2;
      if(a==0){
        leftHeight+=45+childPadding;
      }else{
        rightHeight+=45+childPadding;
      }
    }
    //根据左侧列高度，和右侧列高度，判断部件的高度(取最大值)
    double flowHeight=leftHeight>rightHeight?leftHeight:rightHeight;
    //指定Flow的大小
    return Size(double.infinity,flowHeight);
  }
  @override
  bool shouldRepaint(covariant FlowDelegate oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}

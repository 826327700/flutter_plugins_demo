import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:flutter_plugins_demo/utils/common.dart';
import './toutiao_demo.dart';

class SlideUpPanelDemo extends StatefulWidget {
	SlideUpPanelDemo({Key key}) : super(key: key);

	@override
	_SlideUpPanelDemoState createState() => _SlideUpPanelDemoState();
}

class _SlideUpPanelDemoState extends State<SlideUpPanelDemo> {

	bool showCollapsed=false;//是否显示折叠时的内容
	double maxHeight=500;//最大展开高度
	double minHeight=60;//最小收缩高度
	bool showBorder=false;//是否显示边框
	bool borderRadius=false;//启用圆角
	bool backdropEnabled=false;//启用背景半透明化
	bool parallaxEnabled=false;//开启视差滚动
	double parallaxOffset=0.1;//时差滚动阀值 0.0-1.0
	bool slideDirectionReverse=false;//拖动方向

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text("slide_up_panel"),
				actions: <Widget>[
					GoWeb(pluginName: 'slide_up_panel')
				],
			),
			body: SlidingUpPanel(
				collapsed:showCollapsed?Center(
					child: Text("向上滑动以打开面板"),
				):null,
				panel: Center(
					child: Text("我是面板内容"),
				),
				body: Container(
					padding: EdgeInsets.all(10),
					child: Column(
						children: <Widget>[
							Row(
								children: <Widget>[
									Text("是否显示折叠时的组件"),
									new Switch(
										value: this.showCollapsed,
										activeColor: Colors.blue,
										onChanged: (bool val) {
											this.setState(() {
												this.showCollapsed = !this.showCollapsed;
											});
										},
									)
								],
							),
							Row(
								children: <Widget>[
									Text("最大展开高度:"+maxHeight.toInt().toString()),
									new Slider(
										value: this.maxHeight,
										max: MediaQuery.of(context).size.height-44,
										min: 20.0,
										activeColor: Colors.blue,
										onChanged: (double val) {
											this.setState(() {
												this.maxHeight = val;
											});
										},
									),
								],
							),
							Row(
								children: <Widget>[
									Text("是否显示边框border"),
									new Switch(
										value: this.showBorder,
										activeColor: Colors.blue,
										onChanged: (bool val) {
											this.setState(() {
												this.showBorder = !this.showBorder;
											});
										},
									)
								],
							),
							Row(
								children: <Widget>[
									Text("是否启用圆角"),
									new Switch(
										value: this.borderRadius,
										activeColor: Colors.blue,
										onChanged: (bool val) {
											this.setState(() {
												this.borderRadius = !this.borderRadius;
											});
										},
									)
								],
							),
							Row(
								children: <Widget>[
									Text("是否背景半透明化"),
									new Switch(
										value: this.backdropEnabled,
										activeColor: Colors.blue,
										onChanged: (bool val) {
											this.setState(() {
												this.backdropEnabled = !this.backdropEnabled;
											});
										},
									)
								],
							),
							Row(
								children: <Widget>[
									Text("开启视差滚动"),
									new Switch(
										value: this.parallaxEnabled,
										activeColor: Colors.blue,
										onChanged: (bool val) {
											this.setState(() {
												this.parallaxEnabled = !this.parallaxEnabled;
											});
										},
									)
								],
							),
							Row(
								children: <Widget>[
									Text("视差滚动阀值:"+parallaxOffset.toStringAsFixed(2)),
									new Slider(
										value: this.parallaxOffset,
										max: 1.0,
										min: 0.0,
										activeColor: Colors.blue,
										onChanged: (double val) {
											this.setState(() {
												this.parallaxOffset = val;
											});
										},
									),
								],
							),
							Row(
								children: <Widget>[
									Text("从上往下"),
									new Switch(
										value: this.slideDirectionReverse,
										activeColor: Colors.blue,
										onChanged: (bool val) {
											this.setState(() {
												this.slideDirectionReverse = !this.slideDirectionReverse;
											});
										},
									)
								],
							),
							Center(
								child: FlatButton(
									child: Text("仿头条小视频评论面板"),
									color: Theme.of(context).primaryColor,
									onPressed: (){
										Navigator.of(context).push(MaterialPageRoute(builder:(BuildContext context){
											return ToutiaoDemo();
										}));
									},
								),
							)
						],
					),
				),
				maxHeight: maxHeight,
				minHeight: minHeight,
				border:showBorder?Border(top: BorderSide(color: Colors.blue,)):null,
				borderRadius:borderRadius?BorderRadius.only(
					topLeft: Radius.circular(24.0),
					topRight: Radius.circular(24.0),
				):null,
				backdropEnabled:backdropEnabled,
				parallaxEnabled:parallaxEnabled,
				parallaxOffset:parallaxOffset,
				slideDirection:slideDirectionReverse?SlideDirection.DOWN:SlideDirection.UP
			),
		);
	}
}
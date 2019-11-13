import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter_plugins_demo/utils/common.dart';

class FlutterSpeedDialDemo extends StatefulWidget {
	FlutterSpeedDialDemo({Key key}) : super(key: key);

	@override
	_demoState createState() => _demoState();
}

class _demoState extends State<FlutterSpeedDialDemo> {

	bool isShow=true;

	void onButtonClick(index){
		BotToast.showText(text: "点击了第$index 个按钮",align: Alignment.center);
	}

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text("flutter_speed_dial"),
				actions: <Widget>[
					GoWeb(pluginName: 'flutter_speed_dial')
				],
			),
			body: Center(
				child: RaisedButton(
					child: Text("显示/隐藏 按钮"),
					onPressed: (){
						setState(() {
						  isShow=!isShow;
						});
					},
				),
			),
			// floatingActionButton: SpeedDial(
			// 	child: Icon(Icons.add),
			// 	children:childButtons
			// ),
			floatingActionButton: SpeedDial(
				marginRight: 25,//右边距
				marginBottom: 50,//下边距
				animatedIcon: AnimatedIcons.menu_close,//带动画的按钮
				animatedIconTheme: IconThemeData(size: 22.0),
				visible: isShow,//是否显示按钮
				closeManually: false,//是否在点击子按钮后关闭展开项
				curve: Curves.bounceIn,//展开动画曲线
				overlayColor: Colors.black,//遮罩层颜色
				overlayOpacity: 0.5,//遮罩层透明度
				onOpen: () => print('OPENING DIAL'),//展开回调
				onClose: () => print('DIAL CLOSED'),//关闭回调
				tooltip: 'Speed Dial',//长按提示文字
				heroTag: 'speed-dial-hero-tag',//hero标记
				backgroundColor: Colors.blue,//按钮背景色
				foregroundColor: Colors.white,//按钮前景色/文字色
				elevation: 8.0,//阴影
				shape: CircleBorder(),//shape修饰
				children: [//子按钮
					SpeedDialChild(
						child: Icon(Icons.accessibility),
						backgroundColor: Colors.red,
						label: '第一个按钮',
						labelStyle: TextStyle(fontSize: 18.0),
						onTap: (){
							onButtonClick(1);
						}
					),
					SpeedDialChild(
						child: Icon(Icons.brush),
						backgroundColor: Colors.orange,
						label: '第二个按钮',
						labelStyle: TextStyle(fontSize: 18.0),
						onTap: (){
							onButtonClick(2);
						},
					),
					SpeedDialChild(
						child: Icon(Icons.keyboard_voice),
						backgroundColor: Colors.green,
						label: '第三个按钮',
						labelStyle: TextStyle(fontSize: 18.0),
						onTap: (){
							onButtonClick(3);
						},
					),
				],
			),
		);
	}

	List<SpeedDialChild> childButtons=[
		SpeedDialChild(
			child: Icon(Icons.accessibility),
			backgroundColor: Colors.red,
			label: '第一个按钮',
			labelStyle: TextStyle(fontSize: 18.0),
			onTap: () => print('FIRST CHILD')
		),
		SpeedDialChild(
			child: Icon(Icons.brush),
			backgroundColor: Colors.orange,
			label: '第二个按钮',
			labelStyle: TextStyle(fontSize: 18.0),
			onTap: () => print('SECOND CHILD'),
		),
		SpeedDialChild(
			child: Icon(Icons.keyboard_voice),
			backgroundColor: Colors.green,
			label: '第三个按钮',
			labelStyle: TextStyle(fontSize: 18.0),
			onTap: () => print('THIRD CHILD'),
		),
	];
}
import 'package:flutter/material.dart';
import 'package:scratcher/scratcher.dart';
import 'package:flutter_plugins_demo/utils/common.dart';

class ScratcherDemo extends StatefulWidget {
	ScratcherDemo({Key key}) : super(key: key);

	@override
	_demoState createState() => _demoState();
}

class _demoState extends State<ScratcherDemo> {

	final scratchKey = GlobalKey<ScratcherState>();

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text("scratcher"),
				actions: <Widget>[
					GoWeb(pluginName: 'scratcher')
				],
			),
			body: Column(
				crossAxisAlignment: CrossAxisAlignment.center,
				children: <Widget>[
					ListTile(title: Text("默认用法")),
					Center(
						child: Scratcher(
							brushSize: 30,
							threshold: 50,
							color: Colors.grey,
							onChange: (value) {
								print("当前刮开比例: $value%");
							},
							onThreshold: () {
								print("已触发设置的全部刮开阈值");
							},
							child: Container(
								height: 150,
								width: 300,
								color: Colors.blue,
							),
						),
					),
					Container(
						height: 20,
					),
					ListTile(title: Text("自定义")),
					Center(
						child: Scratcher(
							key: scratchKey,
							brushSize: 30,
							threshold: 50,
							color: Colors.pink,
							onChange: (value) {
								print("当前刮开比例: $value%");
							},
							onThreshold: () {
								print("已触发设置的全部刮开阈值");
								scratchKey.currentState.reveal(duration: Duration(milliseconds: 500));
							},
							child: Container(
								width: 300,
								height: 150,
								child: Image.network('https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1576395155732&di=3b7df82deb0ca02429a6d305547df9bb&imgtype=0&src=http%3A%2F%2Fwx2.sinaimg.cn%2Flarge%2F006ncSK8ly1fs4v09b675j30j90augxi.jpg',fit: BoxFit.cover,),
							),
						),
					),
					Row(
						mainAxisAlignment: MainAxisAlignment.center,
						children: <Widget>[
							RaisedButton(
								child: Text("重置"),
								onPressed: (){
									scratchKey.currentState.reset();
								},
							),
							RaisedButton(
								child: Text("刮开"),
								onPressed: (){
									scratchKey.currentState.reveal(duration: Duration(milliseconds: 500));
								},
							)
						],
					)
				],
			),
		);
	}
}
import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:flutter_plugins_demo/utils/common.dart';

class LiquidProgressIndicatorDemo extends StatefulWidget {
	LiquidProgressIndicatorDemo({Key key}) : super(key: key);

	@override
	_demoState createState() => _demoState();
}

class _demoState extends State<LiquidProgressIndicatorDemo> {
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text("liquid_progress_indicator"),
				actions: <Widget>[
					GoWeb(pluginName: 'liquid_progress_indicator')
				],
			),
			body: Column(
				children: <Widget>[
					SizedBox(height: 10,),
					ListTile(title: Text("圆形进度器")),
					Center(
						child: Container(
							height: 100,
							width: 100,
							child: LiquidCircularProgressIndicator(
								value: 0.8, // Defaults to 0.5.
								valueColor: AlwaysStoppedAnimation(Colors.blue[200]), // Defaults to the current Theme's accentColor.
								backgroundColor: Colors.white, // Defaults to the current Theme's backgroundColor.
								borderColor: Colors.blue,
								borderWidth: 2.0,
								direction: Axis.vertical, // The direction the liquid moves (Axis.vertical = bottom to top, Axis.horizontal = left to right). Defaults to Axis.vertical.
								center: Text("正在上传..."),
							),
						),
					),
					SizedBox(height: 10),
					ListTile(title: Text("条形进度器")),
					Center(
						child: Container(
							height: 30,
							width: 300,
							child: LiquidLinearProgressIndicator(
								value: 0.8, // Defaults to 0.5.
								valueColor: AlwaysStoppedAnimation(Colors.greenAccent), // Defaults to the current Theme's accentColor.
								backgroundColor: Colors.white, // Defaults to the current Theme's backgroundColor.
								borderColor: Colors.green,
								borderWidth: 2.0,
								direction: Axis.horizontal, // The direction the liquid moves (Axis.vertical = bottom to top, Axis.horizontal = left to right). Defaults to Axis.vertical.
								center: Text("正在加载..."),
							),
						),
					),
					SizedBox(height: 10),
					ListTile(title: Text("自定义形状进度器")),
					Center(
						child: Container(
							height: 100,
							width: 100,
							child: LiquidCustomProgressIndicator(
								value: 0.2 ,// Defaults to 0.5.
								valueColor: AlwaysStoppedAnimation(Colors.pink), // Defaults to the current Theme's accentColor.
								backgroundColor: Colors.pink[50], // Defaults to the current Theme's backgroundColor.
								direction: Axis.vertical, // The direction the liquid moves (Axis.vertical = bottom to top, Axis.horizontal = left to right).
								shapePath: _buildHeartPath(), // A Path object used to draw the shape of the progress indicator. The size of the progress indicator is created from the bounds of this path.
							),
						),
					)
				],
			),
		);
	}

	Path _buildHeartPath() {
		return Path()
		..moveTo(55, 15)
		..cubicTo(55, 12, 50, 0, 30, 0)
		..cubicTo(0, 0, 0, 37.5, 0, 37.5)
		..cubicTo(0, 55, 20, 77, 55, 95)
		..cubicTo(90, 77, 110, 55, 110, 37.5)
		..cubicTo(110, 37.5, 110, 0, 80, 0)
		..cubicTo(65, 0, 55, 12, 55, 15)
		..close();
	}
}
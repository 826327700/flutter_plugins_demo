import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_plugins_demo/utils/common.dart';



class AnimatedTextKitDemo extends StatefulWidget {
	AnimatedTextKitDemo({Key key}) : super(key: key);

	@override
	_DemoState createState() => _DemoState();
}

class _DemoState extends State<AnimatedTextKitDemo> {

	


	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text("animated_text_kit"),
				actions: <Widget>[
					GoWeb(pluginName: 'animated_text_kit')
				],
			),
			body:Column(
				children: <Widget>[
					ListTile(title: Text("默认")),
					FadeAnimatedTextKit(
						duration: Duration(milliseconds: 5000),
						isRepeatingAnimation: true,
						text: ["文字", "动起来", "common!!!"],
						textStyle: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
					),
					ListTile(title: Text("滚动")),
					Row(
						mainAxisAlignment: MainAxisAlignment.center,
						children: <Widget>[
							RotateAnimatedTextKit(
								onTap: () {
									print("Tap Event");
								},
								text: ["小包子", "切图仔", "最后的倔强"],
								textStyle: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
								textAlign: TextAlign.center,
								alignment: AlignmentDirectional.topStart,
							)
						],
					),
					ListTile(title: Text("打字机")),
					TyperAnimatedTextKit(
						onTap: () {
							print("Tap Event");
						},
						text: [
						"学习使我快乐",
						"切图仔最后的倔强",
						],
						textStyle: TextStyle(
							fontSize: 30.0,
							fontFamily: "Bobbers"
						),
						textAlign: TextAlign.start,
						alignment: AlignmentDirectional.topStart // or Alignment.topLeft
					),
					ListTile(title: Text("打字机 带光标")),
					TypewriterAnimatedTextKit(
						onTap: () {
							print("Tap Event");
						},
						text: [
						"切图仔最后的倔强",
						],
						textStyle: TextStyle(
							fontSize: 30.0,
							fontFamily: "Agne"
						),
						textAlign: TextAlign.start,
						alignment: AlignmentDirectional.topStart // or Alignment.topLeft
					),
					ListTile(title: Text("缩放")),
					SizedBox(
						width: 250.0,
						child: ScaleAnimatedTextKit(
							onTap: () {
								print("Tap Event");
							},
							text: [
							"Flutter",
							"轮子",
							"推荐"
							],
							textStyle: TextStyle(
								fontSize: 70.0,
								fontFamily: "Canterbury"
							),
							textAlign: TextAlign.start,
							alignment: AlignmentDirectional.topStart // or Alignment.topLeft
						),
					),
					ListTile(title: Text("颜色渐变")),
					ColorizeAnimatedTextKit(
						onTap: () {
							print("Tap Event");
						},
						text: [
							"小包子",
							"flutter",
						],
						textStyle: TextStyle(
							fontSize: 32.0, 
							fontFamily: "Horizon"
						),
						colors: [
							Colors.purple,
							Colors.blue,
							Colors.yellow,
							Colors.red,
						],
						textAlign: TextAlign.start,
						alignment: AlignmentDirectional.topStart // or Alignment.topLeft
					)
				],
			),
        );
	}
}
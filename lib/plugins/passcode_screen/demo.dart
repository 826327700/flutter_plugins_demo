import 'dart:async';

import 'package:flutter/material.dart';
import 'package:passcode_screen/passcode_screen.dart';
import 'package:passcode_screen/circle.dart';
import 'package:passcode_screen/keyboard.dart';
import 'package:flutter_plugins_demo/utils/common.dart';

class PassCodeScreenDemo extends StatefulWidget {
	PassCodeScreenDemo({Key key}) : super(key: key);

	@override
	_demoState createState() => _demoState();
}

class _demoState extends State<PassCodeScreenDemo> {

	Color color = Colors.white;

	final StreamController<bool> _verificationNotifier = StreamController<bool>.broadcast();

	_onPasscodeEntered(String enteredPasscode) {
		bool isValid = '123456' == enteredPasscode;
  		_verificationNotifier.add(isValid);
	}
	_onPasscodeCancelled(){
		print("点击取消");
	}
	

	openLockScreen(){
		Navigator.push(context,PageRouteBuilder(opaque: false,pageBuilder: (context, animation, secondaryAnimation) {
			return PasscodeScreen(
				title: "请输入锁屏密码",
				passwordEnteredCallback: _onPasscodeEntered,//密码输入后的处理方法
				cancelLocalizedText: '取消',//取消按钮文字
				deleteLocalizedText: '删除',//删除按钮文字
				shouldTriggerVerification: _verificationNotifier.stream,//控制器通知
				circleUIConfig: CircleUIConfig(//自定义密码圆点ui 可不填
					borderColor: color,
					fillColor: color,
					circleSize: 30
				),
				keyboardUIConfig: KeyboardUIConfig(digitBorderWidth: 2, primaryColor: color),//自定义键盘ui 可不填
				backgroundColor: Colors.black.withOpacity(0.8),//背景透明度
				cancelCallback: _onPasscodeCancelled,//取消按钮回调  
			);	
		}));
	}

	@override
	void dispose() {
		_verificationNotifier.close();
		super.dispose();
	}

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text("passcode_screen"),
				actions: <Widget>[
					GoWeb(pluginName: 'passcode_screen')
				],
			),
			body: Container(
				child: Column(
					mainAxisAlignment: MainAxisAlignment.center,
					children: <Widget>[
						Center(
							child: FlatButton(
								child: Text("锁屏",style: TextStyle(color: Colors.white),),
								color: Theme.of(context).primaryColor,
								onPressed: (){
									openLockScreen();
								},
							),
						),
						Center(
							child: FlatButton(
								child: Text("换个颜色",style: TextStyle(color: Colors.white),),
								color: Theme.of(context).primaryColor,
								onPressed: (){
									setState(() {
									   color=Colors.pink;
									});
									openLockScreen();
								},
							),
						),
					],
				)
			),
		);
	}
	
}


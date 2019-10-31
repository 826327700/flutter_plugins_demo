import 'package:flutter/material.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter_plugins_demo/utils/common.dart';

class BotToastDemo extends StatefulWidget {
	BotToastDemo({Key key}) : super(key: key);

	@override
	_BotToastDemoState createState() => _BotToastDemoState();
}

class _BotToastDemoState extends State<BotToastDemo> {
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text("bot_toast"),
				actions: <Widget>[
					GoWeb(pluginName: 'bot_toast')
				],
			),
			body: Center(
				child: Column(
					children: <Widget>[
						FlatButton(
							child: Text("toast风格",style: TextStyle(color: Colors.white),),
							color: Theme.of(context).primaryColor,
							onPressed: (){
								BotToast.showText(text: "这是默认样式",align: Alignment.center);
							},
						),
						FlatButton(
							child: Text("notice风格",style: TextStyle(color: Colors.white),),
							color: Theme.of(context).primaryColor,
							onPressed: (){
								BotToast.showSimpleNotification(title: "这是通知样式",duration: Duration(seconds: 2));
							},
						),
						FlatButton(
							child: Text("loading风格",style: TextStyle(color: Colors.white),),
							color: Theme.of(context).primaryColor,
							onPressed: (){
								BotToast.showLoading(duration: Duration(milliseconds: 1000));
							},
						),
						Builder(builder: (context) {
							return FlatButton(
								child: Text("吸附widget在按钮右边",style: TextStyle(color: Colors.white),),
								color: Theme.of(context).primaryColor,
								onPressed: (){
									//弹出一个定位Toast
									BotToast.showAttachedWidget(
										attachedBuilder: (_) => Card(
											child: Padding(
												padding: const EdgeInsets.all(8.0),
												child: Icon(
													Icons.favorite,
													color: Colors.redAccent,
												),
											),
										),
										duration: Duration(seconds: 2),
										targetContext: context,
										preferDirection: PreferDirection.rightCenter,//吸附于当前点击的按钮 右侧中间
										horizontalOffset: 10,//距离吸附目标 X轴
										//verticalOffset:10,//距离吸附模板 Y轴 
									);
								},
							);
						}),
						FlatButton(
							child: Text("自定义内容",style: TextStyle(color: Colors.white),),
							color: Theme.of(context).primaryColor,
							onPressed: (){
								BotToast.showAnimationWidget(
									animationDuration:Duration(milliseconds: 300),
									toastBuilder: (cancelFunc){
										return Stack(
											children: <Widget>[
												Positioned(
													left: 100,
													top: 200,
													child: Container(
														height: 100,
														width: 100,
														color:Colors.pink,
														child: FlatButton(
															child: Text("关闭"),
															onPressed: (){
																cancelFunc();
															},
														),
													),
												)
											],
										);
									}
								);
							},
						),
						
					],
				),
			)
		);
	}
}
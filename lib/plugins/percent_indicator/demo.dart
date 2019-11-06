import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter_plugins_demo/utils/common.dart';

class PercentIndicatorDemo extends StatefulWidget {
	PercentIndicatorDemo({Key key}) : super(key: key);

	@override
	_PercentIndicatorDemoState createState() => _PercentIndicatorDemoState();
}

class _PercentIndicatorDemoState extends State<PercentIndicatorDemo> {

	double percent=0;

	startAnimte(){
		setState(() {
		  percent=0.7;
		});
	}

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text("percent_indicator"),
				actions: <Widget>[
					GoWeb(pluginName: 'percent_indicator')
				],
			),
			body: Center(
				child: ListView(
					children: <Widget>[
						ListTile(title: Text("头部标题+icon内容：")),
						new CircularPercentIndicator(
							radius: 100.0,
							lineWidth: 10.0,
							percent: 0.8,
							header: new Text("Icon header"),
							center: new Icon(
								Icons.person_pin,
								size: 50.0,
								color: Colors.blue,
							),
							backgroundColor: Colors.grey,
							progressColor: Colors.blue,
						),
						ListTile(title: Text("头部标题+动画：")),
						new CircularPercentIndicator(
							radius: 130.0,
							animation: true,
							animationDuration: 1200,
							lineWidth: 15.0,
							percent: 0.4,
							center: new Text("40 hours",style:new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),),
							circularStrokeCap: CircularStrokeCap.butt,
							backgroundColor: Colors.yellow,
							progressColor: Colors.red,
						),
						ListTile(title: Text("底部文案+动画+圆角截断：")),
						new CircularPercentIndicator(
							radius: 120.0,
							lineWidth: 13.0,
							animation: true,
							percent: 0.7,
							center: new Text(
							"70.0%",
							style:
								new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
							),
							footer: new Text(
							"Sales this week",
							style:
								new TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
							),
							circularStrokeCap: CircularStrokeCap.round,
							progressColor: Colors.purple,
						),
						ListTile(title: Text("线型进度")),
						new LinearPercentIndicator(
							width: 300,
							lineHeight: 14.0,
							percent: 0.5,
							backgroundColor: Colors.grey,
							progressColor: Colors.blue,
						),
						ListTile(title: Text("线型进度+进度数字：")),
						new LinearPercentIndicator(
							width: 300,
							lineHeight: 14.0,
							percent: 0.5,
							center: Text(
							"50.0%",
							style: new TextStyle(fontSize: 12.0),
							),
							trailing: Icon(Icons.mood),
							linearStrokeCap: LinearStrokeCap.roundAll,
							backgroundColor: Colors.grey,
							progressColor: Colors.blue,
						),
						ListTile(title: Text("线型进度+进度数字+左右内容+动画+矩形边框：")),
						new LinearPercentIndicator(
							width: 200,
							animation: true,
							animationDuration: 1000,
							lineHeight: 20.0,
							leading: new Text("左侧内容"),
							trailing: new Text("右侧内容"),
							percent: percent,
							center: Text((percent*100).toString()+'%'),
							linearStrokeCap: LinearStrokeCap.butt,
							progressColor: Colors.red,
						),
						FlatButton(
							onPressed: (){
								startAnimte();
							},
							color: Theme.of(context).primaryColor,
							child: Text("设置进度",style: TextStyle(color: Colors.white),),
						)
					]),
			),
		);
	}
}
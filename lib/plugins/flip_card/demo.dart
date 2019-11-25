import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter_plugins_demo/utils/common.dart';

class FlipCardDemo extends StatefulWidget {
	FlipCardDemo({Key key}) : super(key: key);

	@override
	_demoState createState() => _demoState();
}

class _demoState extends State<FlipCardDemo> {
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text("flip_card"),
				actions: <Widget>[
					GoWeb(pluginName: 'flip_card')
				],
			),
			body: ListView(
				children: <Widget>[
					FlipCard(
						direction: FlipDirection.HORIZONTAL, // default
						front: Container(
							height: 200,
							width: 345,
							margin: EdgeInsets.all(10),
							color: Colors.teal,
							child: Center(
								child: Text("《遮天》",style:TextStyle(
									fontSize:40,
									color:Colors.white
								)),
							),
						),
						back: Container(
							height: 200,
							width: 345,
							margin: EdgeInsets.all(10),
							color: Colors.pink,
							padding: EdgeInsets.all(10),
							child: Text('《遮天》是一部古典仙侠类型的网络小说，小说签约授权首发连载于起点中文网，作者是辰东。本书以九龙拉棺为引子，带出一个庞大的洪荒玄幻世界，引出上古神话的遗秘，卷帙浩阔，设定繁杂，人物众多。'
							,style: TextStyle(
								color: Colors.white,
								height:2.0
							)),
						),
					),
					FlipCard(
						direction: FlipDirection.VERTICAL, // default
						front: Container(
							height: 200,
							width: 345,
							margin: EdgeInsets.all(10),
							color: Colors.indigo,
							child: Center(
								child: Text("《完美世界》",style:TextStyle(
									fontSize:40,
									color:Colors.white
								)),
							),
						),
						back: Container(
							height: 200,
							width: 345,
							margin: EdgeInsets.all(10),
							color: Colors.amber,
							padding: EdgeInsets.all(10),
							child: Text('《完美世界》是辰东所著的第五部小说，又称《遮天前传》。东方玄幻类，首发于起点中文网。一粒尘可填海，一根草斩尽日月星辰，弹指间天翻地覆。群雄并起，万族林立，诸圣争霸，乱天动地；问苍茫大地，谁主沉浮？一个少年从大荒中走出，一切从这里开始。'
							,style: TextStyle(
								color: Colors.white,
								height:2.0
							)),
						),
					),
				],
			),
		);
	}
}
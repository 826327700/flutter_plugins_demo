import 'package:flutter/material.dart';
import 'package:liquid_swipe/Constants/Helpers.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:flutter_plugins_demo/utils/common.dart';

class LiquidSwipeDemo extends StatefulWidget {
	LiquidSwipeDemo({Key key}) : super(key: key);

	@override
	_demoState createState() => _demoState();
}

class _demoState extends State<LiquidSwipeDemo> {

	WaveType currentAnimate=WaveType.liquidReveal;

	void changeAnimate(){
		setState(() {
		  if(currentAnimate==WaveType.liquidReveal){
			  currentAnimate=WaveType.circularReveal;
		  }else{
			  currentAnimate=WaveType.liquidReveal;
		  }
		});
	}

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text("liquid_swipe"),
				actions: <Widget>[
					GoWeb(pluginName: 'liquid_swipe')
				],
			),
			body: LiquidSwipe(
                pages: [
					Container(
						color: Colors.blue,
						child: Center(
							child: FlatButton(
								child: Text("切换效果"),
								onPressed: (){
									changeAnimate();
								},
							),
						),
					),
					Container(
						color: Colors.pink,
					),
					Container(
						color: Colors.teal,
						child: ConstrainedBox(
							child:Image.network('http://hbimg.b0.upaiyun.com/c9d0ae1ea6dafe5b7af0e2387e161778d7a146b83f571-ByOb1k_fw658',
							fit: BoxFit.cover,),
							constraints: new BoxConstraints.expand(),
						)
					),
				],
				fullTransitionValue: 200,
				enableSlideIcon: true,
				enableLoop: true,
				positionSlideIcon: 0.5,
				waveType: currentAnimate,
				onPageChangeCallback: (page) => pageChangeCallback(page),
				currentUpdateTypeCallback: (updateType) => updateTypeCallback(updateType),
             ),
		);
	}

	pageChangeCallback(int page) {
		print(page);
	}
	updateTypeCallback(UpdateType updateType) {
		print(updateType);
	}
}
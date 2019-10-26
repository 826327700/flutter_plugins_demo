import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class ListViewDemo extends StatefulWidget {
	ListViewDemo({Key key}) : super(key: key);

	@override
	_ListViewDemoState createState() => _ListViewDemoState();
}

class _ListViewDemoState extends State<ListViewDemo> {

	int count=20;

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text("ListView"),
			),
			body: 
			AnimationLimiter(
				child:ListView.builder(
					itemCount: count,
					itemBuilder: (context,index){
						return AnimationConfiguration.staggeredList(
							position: index,
							duration: const Duration(milliseconds: 375),
							child: SlideAnimation(
								verticalOffset: 50.0,
								child: FadeInAnimation(
									child: Container(
										margin: EdgeInsets.all(5),
										color: Theme.of(context).primaryColor,
										height: 60,
									),
								),
							),
						);
					},
				),
			),
			
		);
	}
}
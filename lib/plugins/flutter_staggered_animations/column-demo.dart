import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class ColumnDemo extends StatefulWidget {
	ColumnDemo({Key key}) : super(key: key);

	@override
	_ColumnDemoState createState() => _ColumnDemoState();
}

class _ColumnDemoState extends State<ColumnDemo> {

	int count=10;

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text("Column"),
			),
			body: 
			AnimationLimiter(
				child:Column(
					children:AnimationConfiguration.toStaggeredList(
						duration: const Duration(milliseconds: 375),
						childAnimationBuilder:(widget) => SlideAnimation(
							verticalOffset: 50.0,
							child: FadeInAnimation(
								child: widget,
							),
						),
						children: ChildrenList()
					)
				),
			),
			
		);
	}

	List<Widget> ChildrenList(){
		List<Widget> childs=[];
		for (var i = 0; i < count; i++) {
			childs.add(Container(
				margin: EdgeInsets.all(5),
				color: Theme.of(context).primaryColor,
				height: 60,
			));
		}
		return childs;
	}
}
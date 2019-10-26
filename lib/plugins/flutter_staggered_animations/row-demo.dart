import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class RowDemo extends StatefulWidget {
	RowDemo({Key key}) : super(key: key);

	@override
	_RowDemoState createState() => _RowDemoState();
}

class _RowDemoState extends State<RowDemo> {

	int count=5;

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text("Row"),
			),
			body: 
			AnimationLimiter(
				child:Container(
					height: 60,
					child: Row(
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
			),
			
		);
	}

	List<Widget> ChildrenList(){
		List<Widget> childs=[];
		for (var i = 0; i < count; i++) {
			childs.add(Container(
				margin: EdgeInsets.only(right:5),
				color: Theme.of(context).primaryColor,
				width: 60,
			));
		}
		return childs;
	}
}
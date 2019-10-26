import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class GridViewDemo extends StatefulWidget {
	GridViewDemo({Key key}) : super(key: key);

	@override
	_GridViewDemoState createState() => _GridViewDemoState();
}

class _GridViewDemoState extends State<GridViewDemo> {

	int count=20;

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text("GridView"),
			),
			body: 
			AnimationLimiter(
				child:GridView.builder(
					itemCount: count,
					gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
						//横轴元素个数
						crossAxisCount: 3,
						//纵轴间距
						mainAxisSpacing: 10.0,
						//横轴间距
						crossAxisSpacing: 10.0,
						//子组件宽高长度比例
						childAspectRatio: 1.0
					),
					itemBuilder: (context,index){
						return AnimationConfiguration.staggeredGrid(
							columnCount:count,
							position: index,
							duration: const Duration(milliseconds: 375),
							child: SlideAnimation(
								verticalOffset: 50.0,
								child: FadeInAnimation(
									child: Container(
										color: Theme.of(context).primaryColor,
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
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_plugins_demo/utils/common.dart';

class CurvedNavigationBarDemo extends StatefulWidget {
	CurvedNavigationBarDemo({Key key}) : super(key: key);

	@override
	_CurvedNavigationBarDemoState createState() => _CurvedNavigationBarDemoState();
}

class _CurvedNavigationBarDemoState extends State<CurvedNavigationBarDemo> with SingleTickerProviderStateMixin{

	TabController tabController;

	List colors=[Colors.blue,Colors.pink,Colors.orange];

	int currentIndex=0;

	@override
	void initState() {
		// TODO: implement initState
		super.initState();
		tabController = TabController(vsync: this, length: 3)..addListener((){
			setState(() {
				currentIndex=tabController.index;
			});
		});
	}

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			bottomNavigationBar: CurvedNavigationBar(
				backgroundColor: colors[currentIndex],
				index: currentIndex,
				items: <Widget>[
					Icon(Icons.home, size: 30),
					Icon(Icons.fiber_new, size: 30),
					Icon(Icons.person, size: 30),
				],
				onTap: (index) {
					//Handle button tap
					setState(() {
						currentIndex=index;
					});
					tabController.animateTo(index,duration: Duration(milliseconds: 300), curve: Curves.ease);
				},
			),
			body: TabBarView(
				controller: tabController,
				children: <Widget>[
					Container(
						color: colors[0],
					),
					Container(
						color: colors[1],
					),
					Container(
						color: colors[2],
					)
				],
			)
		);
	}
}
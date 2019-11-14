import 'package:flutter/material.dart';
import 'package:flutter_plugins_demo/utils/common.dart';
import './demo1.dart';
import './demo2.dart';
import './demo3.dart';
import './demo4.dart';

class StickyHeadersDemo extends StatefulWidget {
	StickyHeadersDemo({Key key}) : super(key: key);

	@override
	_demoState createState() => _demoState();
}

class _demoState extends State<StickyHeadersDemo> {
	

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text("sticky_headers"),
				actions: <Widget>[
					GoWeb(pluginName: 'sticky_headers')
				],
			),
			body: ListView(
				children: <Widget>[
					ListItem(page:StickyHeadersDemo1(),title: "默认效果"),
					ListItem(page:StickyHeadersDemo2(),title: "自定义header效果"),
					ListItem(page:StickyHeadersDemo3(),title: "header浮动"),
					ListItem(page:StickyHeadersDemo4(),title: "仿SectionList效果"),
				],
			)
		);
	}

	Widget ListItem({ page,String title}){
		return GestureDetector(
			onTap: (){
				Navigator.of(context).push(MaterialPageRoute(builder: (context){
					return page;
				}));
			},
			child: Container(
				height: 70,
				padding: EdgeInsets.all(10),
				color: Colors.white,
				child: Flex(
					direction: Axis.horizontal,
					mainAxisAlignment: MainAxisAlignment.spaceBetween,
					children: <Widget>[
						Expanded(
							child: Text(title,maxLines: 2,style: TextStyle(fontSize: 16),),
						),
						Icon(Icons.arrow_forward_ios,color: Colors.black26,)
					],
				),
			),
		);
	}
}
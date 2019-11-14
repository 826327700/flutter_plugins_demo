import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:flutter_plugins_demo/utils/common.dart';

class StickyHeadersDemo4 extends StatefulWidget {
	StickyHeadersDemo4({Key key}) : super(key: key);

	@override
	_demoState createState() => _demoState();
}

class _demoState extends State<StickyHeadersDemo4> {

	List data=[{
		"latter":"A",
		"group":[
			"A分组1","A分组1","A分组1","A分组1","A分组1","A分组1"
		]
	},{
		"latter":"B",
		"group":[
			"B分组1","B分组1","B分组1","B分组1","B分组1","B分组1"
		]
	},{
		"latter":"C",
		"group":[
			"C分组1","C分组1","C分组1","C分组1","C分组1","C分组1"
		]
	},{
		"latter":"D",
		"group":[
			"D分组1","D分组1","D分组1","D分组1","D分组1","D分组1"
		]
	},{
		"latter":"E",
		"group":[
			"E分组1","E分组1","E分组1","E分组1","E分组1","E分组1"
		]
	}];
	

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text("sticky_headers"),
				actions: <Widget>[
					GoWeb(pluginName: 'sticky_headers')
				],
			),
			body: ListView.builder(
				itemCount: data.length,
				itemBuilder: (context, index) {
					return StickyHeader(
						header: Container(
							height: 50.0,
							color: Colors.blueGrey[700],
							padding: EdgeInsets.symmetric(horizontal: 16.0),
							alignment: Alignment.centerLeft,
							child: Text(data[index]['latter'],
								style: const TextStyle(color: Colors.white),
							),
						),
						content: Column(
							children: buildGroup(data[index]['group']),
						),
					);
				}
			)
		);
	}

	List<Widget> buildGroup(List group){
		return group.map((item){
			return Container(
				height: 60,
				alignment: Alignment.centerLeft,
				padding: EdgeInsets.only(left: 20),
				child: Text(item),
			);
		}).toList();
	}
}
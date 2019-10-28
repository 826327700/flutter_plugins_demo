import 'package:flutter/material.dart';
import 'package:flutter_plugins_demo/utils/common.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:bot_toast/bot_toast.dart';

class FlutterSlidableDemo extends StatefulWidget {
	FlutterSlidableDemo({Key key}) : super(key: key);

	@override
	_FlutterSlidableDemoState createState() => _FlutterSlidableDemoState();
}

class _FlutterSlidableDemoState extends State<FlutterSlidableDemo> {

	GlobalKey key1=GlobalKey();
	GlobalKey key2=GlobalKey();

	_showSnackBar(String action){
		BotToast.showSimpleNotification(title:'当前点击按钮：$action');
		
	}

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text('flutter_slidable'),
				actions: <Widget>[
					GoWeb(pluginName: 'flutter_slidable')
				],
			),
			body: ListView(
				children: <Widget>[
					renderItemType(
						title: 'SlidableBehindActionPane滑出效果',
						actionType: SlidableBehindActionPane()
					),
					renderItemType(
						title:'SlidableScrollActionPane滑出效果',
						actionType:SlidableScrollActionPane()
					),
					renderItemType(
						title:'SlidableDrawerActionPane滑出效果',
						actionType:SlidableDrawerActionPane()
					),
					renderItemType(
						title:'SlidableStrechActionPane滑出效果',
						actionType:SlidableStrechActionPane()
					),
					Slidable(
						actionPane: SlidableStrechActionPane(),
						actionExtentRatio: 0.25,
						child: ListItem(
							key: key1,
							title: '阻止自动关闭',
						),
						secondaryActions: <Widget>[//右侧按钮列表
							IconSlideAction(
								caption: 'Delete',
								color: Colors.red,
								icon: Icons.delete,
								closeOnTap: false,//阻止点击按钮后自动关闭 改为手动关闭
								onTap: (){
									BotToast.showSimpleNotification(title:'我将在1秒后关闭选项');
									Future.delayed(Duration(seconds: 1),(){
										Slidable.of(key1.currentContext).close();
									});
								},
							),
						],
					),
					Slidable(
						key: Key('123456'),
						actionPane: SlidableStrechActionPane(),
						actionExtentRatio: 0.25,
						child: ListItem(
							key: key2,
							title: '滑动或点击删除记录',
						),
						dismissal: SlidableDismissal(
							child: SlidableDrawerDismissal(),
							onWillDismiss: (actionType){
								return showDialog<bool>(
									context: context,
									builder: (context) {
										return AlertDialog(
											title: Text('提示？'),
											content: Text('确定删除该条记录？'),
											actions: <Widget>[
												FlatButton(
												child: Text('取消'),
												onPressed: () => Navigator.of(context).pop(false),
												),
												FlatButton(
												child: Text('确定'),
												onPressed: () => Navigator.of(context).pop(true),
												),
											],
										);
									}
								);
							},
							onDismissed: (actionType) {
								print(actionType);
								
							},
						),
						secondaryActions: <Widget>[//右侧按钮列表
							IconSlideAction(
								caption: 'Delete',
								color: Colors.red,
								icon: Icons.delete,
								onTap: (){
									Slidable.of(key2.currentContext).dismiss();
								},
							),
						],
					)
				],
			),
		);
	}

	Widget renderItemType({String title,Widget actionType}){
		return Slidable(
			actionPane: actionType,
			actionExtentRatio: 0.25,
			child: ListItem(title:title),
			actions: <Widget>[//左侧按钮列表
				IconSlideAction(
					caption: 'Archive',
					color: Colors.blue,
					icon: Icons.archive,
					onTap: () => _showSnackBar('Archive'),
				),
				IconSlideAction(
					caption: 'Share',
					color: Colors.indigo,
					icon: Icons.share,
					onTap: () => _showSnackBar('Share'),
				),
			],
			secondaryActions: <Widget>[//右侧按钮列表
				IconSlideAction(
					caption: 'More',
					color: Colors.black45,
					icon: Icons.more_horiz,
					onTap: () => _showSnackBar('More'),
				),
				IconSlideAction(
					caption: 'Delete',
					color: Colors.red,
					icon: Icons.delete,
					closeOnTap: false,
					onTap: (){
						_showSnackBar('Delete');
					},
				),
			],
		);
	}
}

class ListItem extends StatelessWidget {
	final String title;
  const ListItem({Key key,this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
	return GestureDetector(
		onTap: (){
			Slidable.of(context).close();
		},
		child: Container(
			color: Colors.white,
			child: ListTile(
				leading: CircleAvatar(
					backgroundColor: Colors.indigoAccent,
					child: Text('A'),
					foregroundColor: Colors.white,
				),
				title: Text(title),
				subtitle: Text('SlidableDrawerDelegate'),
			),
		),
	);
  }
}
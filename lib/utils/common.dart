import 'package:flutter/material.dart';
import 'package:flutter_plugins_demo/web.dart';
import 'package:flutter_plugins_demo/config/plugins-list.dart';

class GoWeb extends StatelessWidget {
	final String pluginName;
	const GoWeb({Key key,@required this.pluginName}) : super(key: key);

	

	@override
	Widget build(BuildContext context) {
		Map plugin=plugins.firstWhere((element){
			return element['plugin_name']==pluginName;
		});

		return FlatButton(
			child: Text("查看仓库",style: TextStyle(color: Colors.white)),
			onPressed: (){
				Navigator.of(context).push(MaterialPageRoute(builder: (context){
					return WebBrowser(title: pluginName,url: plugin['pub_url'],);
				}));
			},
		);
	}
}


 
class FadeRoute extends PageRouteBuilder {
  	final Widget page;
  	FadeRoute({this.page}): super(
		pageBuilder: (
			BuildContext context,
			Animation<double> animation,
			Animation<double> secondaryAnimation,
		) =>page,transitionsBuilder: (
			BuildContext context,
			Animation<double> animation,
			Animation<double> secondaryAnimation,
			Widget child,
		) =>FadeTransition(
			opacity: animation,
			child: child,
		),
	);
}

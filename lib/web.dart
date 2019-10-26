import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebBrowser extends StatelessWidget {
	final String title;
	final String url;
	const WebBrowser({Key key,@required this.title,@required this.url}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return new WebviewScaffold(
			url: url,
			appBar: new AppBar(
				title: new Text(title),
			),
        );
	}
}
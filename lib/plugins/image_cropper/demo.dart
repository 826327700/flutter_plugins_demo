import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:flutter_plugins_demo/utils/common.dart';

class ImageCropperDemo extends StatefulWidget {
	ImageCropperDemo({Key key}) : super(key: key);

	@override
	_ImageCropperDemoState createState() => _ImageCropperDemoState();
}

class _ImageCropperDemoState extends State<ImageCropperDemo> {
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text("image_cropper"),
				actions: <Widget>[
					GoWeb(pluginName: 'image_cropper')
				],
			),
			body: Container(
				child: ,
			),
		);
	}
}
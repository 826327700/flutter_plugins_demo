import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_plugins_demo/utils/common.dart';

class ImageCropperDemo extends StatefulWidget {
	ImageCropperDemo({Key key}) : super(key: key);

	@override
	_ImageCropperDemoState createState() => _ImageCropperDemoState();
}

class _ImageCropperDemoState extends State<ImageCropperDemo> {

	File _image;

	Future getImage() async {
		var image = await ImagePicker.pickImage(source: ImageSource.gallery);

		setState(() {
			_image = image;
		});
	}

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text("image_cropper"),
				actions: <Widget>[
					GoWeb(pluginName: 'image_cropper')
				],
			),
			body: Center(
				child: _image == null
					? Text('No image selected.')
					: Image.file(_image),
			),
			floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        tooltip: 'Pick Image',
        child: Icon(Icons.add_a_photo),
      ),
		);
	}
}
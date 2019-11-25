import 'package:flutter/material.dart';
import 'package:wave/wave.dart';
import 'package:wave/config.dart';
import 'package:flutter_plugins_demo/utils/common.dart';

class WaveDemo extends StatefulWidget {
    WaveDemo({Key key}) : super(key: key);

    @override
    _demoState createState() => _demoState();
}

class _demoState extends State<WaveDemo> {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
			appBar: AppBar(
				title: Text("like_button"),
				actions: <Widget>[
					GoWeb(pluginName: 'like_button')
				],
			),
			body: ListView(
				children: <Widget>[
					Container(
						height: 300,
						width: double.infinity,
						child: WaveWidget(
							config: CustomConfig(
								gradients: [
									[Colors.red, Color(0xEEF44336)],
									[Colors.red[800], Color(0x77E57373)],
									[Colors.orange, Color(0x66FF9800)],
									[Colors.yellow, Color(0x55FFEB3B)]
								],
								durations: [35000, 19440, 10800, 6000],
								heightPercentages: [0.20, 0.23, 0.25, 0.30],
								blur: MaskFilter.blur(BlurStyle.solid, 10),
								gradientBegin: Alignment.bottomLeft,
								gradientEnd: Alignment.topRight,
							),
							waveAmplitude: 0,
							backgroundColor: Colors.blue,
							size: Size(
								double.infinity,
								double.infinity,
							),
						),
					)
				],
			),
        );
    }
}
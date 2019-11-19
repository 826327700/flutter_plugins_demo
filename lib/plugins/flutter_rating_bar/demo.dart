import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_plugins_demo/utils/common.dart';

class FlutterRatingBarDemo extends StatefulWidget {
	FlutterRatingBarDemo({Key key}) : super(key: key);

	@override
	_demoState createState() => _demoState();
}

class _demoState extends State<FlutterRatingBarDemo> {

	double rate1=0;
	double rate2=0;
	double rate3=0;
	double rate4=0;

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text("flutter_rating_bar"),
				actions: <Widget>[
					GoWeb(pluginName: 'flutter_rating_bar')
				],
			),
			body: Column(
				crossAxisAlignment: CrossAxisAlignment.center,
				
				children: <Widget>[
					ListTile(title: Text("默认效果"),),
					RatingBar(
						initialRating: rate1,
						direction: Axis.horizontal,
						allowHalfRating: true,
						itemCount: 5,
						itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
						itemBuilder: (context, _) => Icon(
							Icons.star,
							color: Colors.amber,
						),
						onRatingUpdate: (rating) {
							setState(() {
							  this.rate1=rating;
							});
						},
					),
					Text("当前评分：$rate1"),
					ListTile(title: Text("自定义评分样式"),),
					RatingBar(
					initialRating: rate2,
					direction: Axis.horizontal,
					allowHalfRating: true,
					itemCount: 5,
					ratingWidget: RatingWidget(
						full: Image.asset('assets/heart.png',color: Colors.amber,),
						half: Image.asset('assets/heart_half.png',color: Colors.amber,),
						empty: Image.asset('assets/heart_border.png',color: Colors.amber,),
					),
					itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
					onRatingUpdate: (rating) {
						setState(() {
						  this.rate2=rating;
						});
					},
					),
					Text("当前评分：$rate2"),
					ListTile(title: Text("使用index控制样式"),),
					RatingBar(
						initialRating: rate3,
						itemCount: 5,
						itemBuilder: (context, index) {
						switch (index) {
							case 0:
								return Icon(
									Icons.sentiment_very_dissatisfied,
									color: Colors.red,
								);
							case 1:
								return Icon(
									Icons.sentiment_dissatisfied,
									color: Colors.redAccent,
								);
							case 2:
								return Icon(
									Icons.sentiment_neutral,
									color: Colors.amber,
								);
							case 3:
								return Icon(
									Icons.sentiment_satisfied,
									color: Colors.lightGreen,
								);
							case 4:
								return Icon(
									Icons.sentiment_very_satisfied,
									color: Colors.green,
								);
							}
						},
						onRatingUpdate: (rating) {
							setState(() {
							  this.rate3=rating;
							});
						},
					),
					Text("当前评分：$rate3"),
					ListTile(title: Text("竖方向"),),
					RatingBar(
						initialRating: rate4,
						direction: Axis.vertical,
						allowHalfRating: true,
						itemCount: 5,
						itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
						itemBuilder: (context, _) => Icon(
							Icons.star,
							color: Colors.amber,
						),
						onRatingUpdate: (rating) {
							setState(() {
							  this.rate4=rating;
							});
						},
					),
					Text("当前评分：$rate4"),
				],
			),
		);
	}
}
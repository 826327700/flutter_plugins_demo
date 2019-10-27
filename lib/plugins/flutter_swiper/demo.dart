import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_plugins_demo/utils/common.dart';

class FlutterSwiperDemo extends StatefulWidget {
	FlutterSwiperDemo({Key key}) : super(key: key);

	@override
	_DefaultPageState createState() => _DefaultPageState();
}

class _DefaultPageState extends State<FlutterSwiperDemo> {

	List<String> imgs=[
		'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1572156794767&di=be526a0b54ee46d946d3250a7968a6f7&imgtype=0&src=http%3A%2F%2Fi0.hdslb.com%2Fbfs%2Farticle%2Fbdcfa6f72cf1bbfd324b84f5777e6848b2d2be4e.jpg',
		'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1572156824160&di=c205e84c76495370233a593da91dcda7&imgtype=0&src=http%3A%2F%2Fn.sinaimg.cn%2Fsinacn10116%2F48%2Fw551h297%2F20190314%2F946d-hufnxfn4009298.jpg',
		'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1572751557&di=50401b19d4db5efa4168350720ef6ad2&imgtype=jpg&er=1&src=http%3A%2F%2Fpics4.baidu.com%2Ffeed%2Fa50f4bfbfbedab64dee455dd9827d4c779311e2a.png%3Ftoken%3D5134b72012d51c515324de0976a8efdc%26amp%3Bs%3DCB9C578454135FC20494D9DD0300C0B1',
		'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1572158959381&di=d35bfaae98371e5188aa793ca4f946c4&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201811%2F17%2F20181117182732_vkiak.jpg'
	];

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text("flutter_swiper"),
				actions: <Widget>[
					GoWeb(pluginName: 'flutter_swiper')
				],
			),
			body: ListView(
				children: <Widget>[
					ListTile(title: Text("默认效果")),
					Container(
						height: 250,
						child: new Swiper(
							itemBuilder: (BuildContext context,int index){
								return new Image.network(imgs[index],fit: BoxFit.cover,);
							},
							itemCount: imgs.length,
							pagination: new SwiperPagination(),//如果不填则不显示指示点
							control: new SwiperControl(),//如果不填则不显示左右按钮
						),
					),
					ListTile(title: Text("3D卡片滚动")),
					Container(
						height: 250,
						child: new Swiper(
							itemBuilder: (BuildContext context, int index) {
								return new Image.network(imgs[index],fit: BoxFit.cover,);
							},
							itemCount: imgs.length,
							viewportFraction: 0.8,
							scale: 0.9,
						),
					),
					ListTile(title: Text("无限卡片堆叠")),
					Container(
						height: 300,
						child: new Swiper(
							itemBuilder: (BuildContext context, int index) {
								return new Image.network(imgs[index],fit: BoxFit.cover,);
							},
							itemCount: imgs.length,
							itemWidth: 300.0,
							layout: SwiperLayout.STACK,
						),
					),
					ListTile(title: Text("无限卡片堆叠2")),
					Container(
						height: 300,
						child: new Swiper(
							itemBuilder: (BuildContext context, int index) {
								return new Image.network(imgs[index],fit: BoxFit.cover,);
							},
							itemCount: imgs.length,
							itemWidth: 300.0,
							itemHeight: 300.0,
							layout: SwiperLayout.TINDER,
						),
					),
					ListTile(title: Text("自定义效果")),
					Container(
						height: 200,
						child: new Swiper(
						layout: SwiperLayout.CUSTOM,
						customLayoutOption: new CustomLayoutOption(
							startIndex: -1,
							stateCount: 3
						).addRotate([
							-45.0/180,
							0.0,
							45.0/180
						]).addTranslate([
							new Offset(-370.0, -40.0),
							new Offset(0.0, 0.0),
							new Offset(370.0, -40.0)
						]),
						itemWidth: 300.0,
						itemHeight: 200.0,
						itemBuilder: (context, index) {
							return new Image.network(imgs[index],fit: BoxFit.cover,);
						},
						itemCount: imgs.length),
					)
				],
			)
		);
	}
}
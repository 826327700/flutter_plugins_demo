import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:flutter_plugins_demo/utils/common.dart';

class StickyHeadersDemo3 extends StatefulWidget {
	StickyHeadersDemo3({Key key}) : super(key: key);

	@override
	_demoState createState() => _demoState();
}

class _demoState extends State<StickyHeadersDemo3> {

	List<String> imgs=[
		'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1572156794767&di=be526a0b54ee46d946d3250a7968a6f7&imgtype=0&src=http%3A%2F%2Fi0.hdslb.com%2Fbfs%2Farticle%2Fbdcfa6f72cf1bbfd324b84f5777e6848b2d2be4e.jpg',
		'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1572156824160&di=c205e84c76495370233a593da91dcda7&imgtype=0&src=http%3A%2F%2Fn.sinaimg.cn%2Fsinacn10116%2F48%2Fw551h297%2F20190314%2F946d-hufnxfn4009298.jpg',
		'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1572751557&di=50401b19d4db5efa4168350720ef6ad2&imgtype=jpg&er=1&src=http%3A%2F%2Fpics4.baidu.com%2Ffeed%2Fa50f4bfbfbedab64dee455dd9827d4c779311e2a.png%3Ftoken%3D5134b72012d51c515324de0976a8efdc%26amp%3Bs%3DCB9C578454135FC20494D9DD0300C0B1',
		'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1572158959381&di=d35bfaae98371e5188aa793ca4f946c4&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201811%2F17%2F20181117182732_vkiak.jpg',
		'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1572156794767&di=be526a0b54ee46d946d3250a7968a6f7&imgtype=0&src=http%3A%2F%2Fi0.hdslb.com%2Fbfs%2Farticle%2Fbdcfa6f72cf1bbfd324b84f5777e6848b2d2be4e.jpg',
		'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1572156824160&di=c205e84c76495370233a593da91dcda7&imgtype=0&src=http%3A%2F%2Fn.sinaimg.cn%2Fsinacn10116%2F48%2Fw551h297%2F20190314%2F946d-hufnxfn4009298.jpg',
		'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1572751557&di=50401b19d4db5efa4168350720ef6ad2&imgtype=jpg&er=1&src=http%3A%2F%2Fpics4.baidu.com%2Ffeed%2Fa50f4bfbfbedab64dee455dd9827d4c779311e2a.png%3Ftoken%3D5134b72012d51c515324de0976a8efdc%26amp%3Bs%3DCB9C578454135FC20494D9DD0300C0B1',
		'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1572158959381&di=d35bfaae98371e5188aa793ca4f946c4&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201811%2F17%2F20181117182732_vkiak.jpg',
		'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1572156794767&di=be526a0b54ee46d946d3250a7968a6f7&imgtype=0&src=http%3A%2F%2Fi0.hdslb.com%2Fbfs%2Farticle%2Fbdcfa6f72cf1bbfd324b84f5777e6848b2d2be4e.jpg',
		'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1572156824160&di=c205e84c76495370233a593da91dcda7&imgtype=0&src=http%3A%2F%2Fn.sinaimg.cn%2Fsinacn10116%2F48%2Fw551h297%2F20190314%2F946d-hufnxfn4009298.jpg',
		'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1572751557&di=50401b19d4db5efa4168350720ef6ad2&imgtype=jpg&er=1&src=http%3A%2F%2Fpics4.baidu.com%2Ffeed%2Fa50f4bfbfbedab64dee455dd9827d4c779311e2a.png%3Ftoken%3D5134b72012d51c515324de0976a8efdc%26amp%3Bs%3DCB9C578454135FC20494D9DD0300C0B1',
		'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1572158959381&di=d35bfaae98371e5188aa793ca4f946c4&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201811%2F17%2F20181117182732_vkiak.jpg',
	];
	

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
				itemCount: 12,
				itemBuilder: (context, index) {
					return new StickyHeaderBuilder(
						overlapHeaders: true,
						builder: (BuildContext context, double stuckAmount) {
							stuckAmount = 1.0 - stuckAmount.clamp(0.0, 1.0);
							return new Container(
								height: 50.0,
								color: Colors.grey[900].withOpacity(0.6 + stuckAmount * 0.4),
								padding: new EdgeInsets.symmetric(horizontal: 16.0),
								alignment: Alignment.centerLeft,
								child: new Text('Header #$index',
									style: const TextStyle(color: Colors.white),
								),
							);
						},
						content: new Container(
							child: new Image.network(imgs[index], fit: BoxFit.cover,
								width: double.infinity, height: 200.0),
						),
					);
				}
			)
		);
	}
}
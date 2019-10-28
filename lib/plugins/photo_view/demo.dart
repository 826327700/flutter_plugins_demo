import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:flutter_plugins_demo/utils/common.dart';
import 'package:photo_view/photo_view_gallery.dart';
import './photo-view-simple.dart';
import './photo-view-gallery.dart';

class PhotoViewDemo extends StatefulWidget {
	PhotoViewDemo({Key key}) : super(key: key);

	@override
	_PhotoViewState createState() => _PhotoViewState();
}

class _PhotoViewState extends State<PhotoViewDemo> {

	PageController pageController=PageController();

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
				title: Text('photo_view'),
				actions: <Widget>[
					GoWeb(pluginName: 'photo_view')
				],
			),
			body: Container(
				child: Column(
					children: <Widget>[
						ListTile(title: Text("默认效果")),
						GestureDetector(
							child: Container(
								height: 300,
								color: Colors.grey,
								child: Hero(
									tag: "simple",
									child: Image.network(imgs[0],fit: BoxFit.cover),
								),
							),
							onTap: (){
								Navigator.of(context).push(new FadeRoute(page: PhotoViewSimpleScreen(
									imageProvider:NetworkImage(imgs[0]),
									heroTag: 'simple',
								)));
							},
						),
						ListTile(title: Text("多图预览")),
						Container(
							height: 100,
							child: ListView.separated(
								scrollDirection: Axis.horizontal,
								itemCount: imgs.length,
								itemBuilder: (context,index){
									return renderImage(index);
								},
								separatorBuilder: (context,index){
									return Container(width: 5);
								},
							),
						)
					],
				)
			),
		);
	}

	Widget renderImage(int index){
		var img=imgs[index];
		return GestureDetector(
			onTap: (){
				Navigator.of(context).push(new FadeRoute(page: PhotoViewGalleryScreen(
					images:imgs,
					index: index,
					heroTag: img,
				)));
			},
			child: Container(
				height: 100,
				width: 100,
				child: Hero(
					tag: img,
					child: Image.network(img,fit: BoxFit.cover),
				),
			),
		);
	}
}
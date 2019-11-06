import 'package:flutter/material.dart';

import 'package:flutter_plugins_demo/plugins/flutter_staggered_animations/demo.dart';
import 'package:flutter_plugins_demo/plugins/like_button/demo.dart';
import 'package:flutter_plugins_demo/plugins/flutter_swiper/demo.dart';
import 'package:flutter_plugins_demo/plugins/photo_view/demo.dart';
import 'package:flutter_plugins_demo/plugins/flutter_slidable/demo.dart';
import 'package:flutter_plugins_demo/plugins/bot_toast/demo.dart';
import 'package:flutter_plugins_demo/plugins/percent_indicator/demo.dart';
import 'package:flutter_plugins_demo/plugins/curved_navigation_bar/demo.dart';

Map <String, WidgetBuilder> routes= {
	'/flutter_staggered_animations': (BuildContext context) => new Flutter_staggered_animations(),
	'/like_button': (BuildContext context) => new LikeButtonDemo(),
	'/flutter_swiper': (BuildContext context) => new FlutterSwiperDemo(),
	'/photo_view': (BuildContext context) => new PhotoViewDemo(),
	'/flutter_slidable': (BuildContext context) => new FlutterSlidableDemo(),
	'/bot_toast': (BuildContext context) => new BotToastDemo(),
	'/percent_indicator': (BuildContext context) => new PercentIndicatorDemo(),
	'/curved_navigation_bar': (BuildContext context) => new CurvedNavigationBarDemo(),
};
import 'package:flutter/material.dart';

import 'package:flutter_plugins_demo/plugins/flutter_staggered_animations/demo.dart';
import 'package:flutter_plugins_demo/plugins/like_button/demo.dart';
import 'package:flutter_plugins_demo/plugins/flutter_swiper/demo.dart';
import 'package:flutter_plugins_demo/plugins/photo_view/demo.dart';
import 'package:flutter_plugins_demo/plugins/flutter_slidable/demo.dart';
import 'package:flutter_plugins_demo/plugins/bot_toast/demo.dart';
import 'package:flutter_plugins_demo/plugins/percent_indicator/demo.dart';
import 'package:flutter_plugins_demo/plugins/curved_navigation_bar/demo.dart';
import 'package:flutter_plugins_demo/plugins/image_cropper/demo.dart';
import 'package:flutter_plugins_demo/plugins/slide_up_panel/demo.dart';
import 'package:flutter_plugins_demo/plugins/drag_list/demo.dart';
import 'package:flutter_plugins_demo/plugins/animated_text_kit/demo.dart';
import 'package:flutter_plugins_demo/plugins/hidden_drawer_menu/demo.dart';
import 'package:flutter_plugins_demo/plugins/flutter_speed_dial/demo.dart';
import 'package:flutter_plugins_demo/plugins/flutter_custom_clippers/demo.dart';
import 'package:flutter_plugins_demo/plugins/sticky_headers/demo.dart';
import 'package:flutter_plugins_demo/plugins/flutter_rating_bar/demo.dart';
import 'package:flutter_plugins_demo/plugins/wave/demo.dart';
import 'package:flutter_plugins_demo/plugins/flip_card/demo.dart';
import 'package:flutter_plugins_demo/plugins/liquid_swipe/demo.dart';
import 'package:flutter_plugins_demo/plugins/liquid_progress_indicator/demo.dart';
import 'package:flutter_plugins_demo/plugins/passcode_screen/demo.dart';
import 'package:flutter_plugins_demo/plugins/scratcher/demo.dart';

Map <String, WidgetBuilder> routes= {
	'/flutter_staggered_animations': (BuildContext context) => new Flutter_staggered_animations(),
	'/like_button': (BuildContext context) => new LikeButtonDemo(),
	'/flutter_swiper': (BuildContext context) => new FlutterSwiperDemo(),
	'/photo_view': (BuildContext context) => new PhotoViewDemo(),
	'/flutter_slidable': (BuildContext context) => new FlutterSlidableDemo(),
	'/bot_toast': (BuildContext context) => new BotToastDemo(),
	'/percent_indicator': (BuildContext context) => new PercentIndicatorDemo(),
	'/curved_navigation_bar': (BuildContext context) => new CurvedNavigationBarDemo(),
	// '/image_cropper': (BuildContext context) => new ImageCropperDemo(),
	'/slide_up_panel': (BuildContext context) => new SlideUpPanelDemo(),
	'/drag_list': (BuildContext context) => new DragListDemo(),
	'/animated_text_kit': (BuildContext context) => new AnimatedTextKitDemo(),
	'/hidden_drawer_menu': (BuildContext context) => new HiddenDrawerMenuDemo(),
	'/flutter_speed_dial': (BuildContext context) => new FlutterSpeedDialDemo(),
	'/flutter_custom_clippers': (BuildContext context) => new FlutterCustomClippersDemo(),
	'/sticky_headers': (BuildContext context) => new StickyHeadersDemo(),
	'/flutter_rating_bar': (BuildContext context) => new FlutterRatingBarDemo(),
	'/wave': (BuildContext context) => new WaveDemo(),
	'/flip_card': (BuildContext context) => new FlipCardDemo(),
	'/liquid_swipe': (BuildContext context) => new LiquidSwipeDemo(),
	'/liquid_progress_indicator': (BuildContext context) => new LiquidProgressIndicatorDemo(),
	'/passcode_screen': (BuildContext context) => new PassCodeScreenDemo(),
	'/scratcher': (BuildContext context) => new ScratcherDemo(),
};
import 'package:flutter/material.dart';
import 'package:web_vuw/web_vuw.dart';
import 'amap_html.dart';

class AmapView extends StatefulWidget {
  /// 用于控制地图的控制器
  final AmapController controller;

  /// 高德地图的Key(填入Web端key)
  final String apiKey;

  final double height;
  final double width;
  final int initZoom;
  final int maxZoom;
  final int minZoom;

  AmapView(
      {Key key,
      @required this.apiKey,
      this.controller,
      this.width,
      this.height,
      this.initZoom = 15,
      this.maxZoom,
      this.minZoom})
      : super(key: key);

  @override
  State createState() {
    final state = _AmapState();
    controller?._bindState(state);

    return state;
  }
}

@protected
class _AmapState extends State<AmapView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.height,
      child: FutureBuilder(
        future: _loadHtml(),
        builder: (context, snapshot) {
          final data = snapshot.data;
          return data != null
              ? WebVuw(
                  html: data,
                  enableJavascript: true,
                  javaScriptMode: JavaScriptMode.unrestricted,
                  enableLocalStorage: true,
                )
              : Container();
        },
      ),
    );
  }

  Future<String> _loadHtml() async {
    final html = AmapHtml.HTML
        .replaceAll("您申请的key值", widget.apiKey)
        .replaceFirst("zoomValue", "${widget.initZoom}");

    debugPrint(html);

    return html;
  }
}

class AmapController {
  _AmapState _state;

  /// 与[_AmapState]进行关联
  void _bindState(_AmapState state) => _state = state;

  /// 界面结束时清除内存
  void dispose() {
    _state = null;
  }
}

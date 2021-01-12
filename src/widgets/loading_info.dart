import 'package:demoapp/src/notifiers/hn_api.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoadingInfo extends StatefulWidget {
  final LoadingTabsCount isLoading;

  LoadingInfo(this.isLoading);

  createState() => LoadingInfoState();
}

class LoadingInfoState extends State<LoadingInfo>
    with TickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: Duration(seconds: 1), vsync: null);
    widget.isLoading.addListener(_handleLoadingChange);
  }

  @override
  void dispose() {
    widget.isLoading.removeListener(_handleLoadingChange);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: Tween(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(parent: _controller, curve: Curves.elasticOut)),
      child: Icon(FontAwesomeIcons.hackerNewsSquare),
    );
  }

  void _handleLoadingChange() {
    if (widget.isLoading.value > 0) {
      _controller.forward(from: 0);
    }
  }
}

import 'package:flutter/material.dart';
import 'package:template/common/styles.dart';
import 'package:template/library/loading/delay_tween.dart';
class Loading extends StatefulWidget {
  const Loading({
    Key? key,
    this.color = Colors.red,
    this.size = 50.0,
    this.itemBuilder,
    this.duration = const Duration(milliseconds: 900),
    this.controller,
  })  : assert(!(itemBuilder is IndexedWidgetBuilder && color is Color) && !(itemBuilder == null && color == null),
  'You should specify either a itemBuilder or a color'),
        assert(size != null),
        super(key: key);

  final Color color;
  final double size;
  final IndexedWidgetBuilder? itemBuilder;
  final Duration duration;
  final AnimationController? controller;

  @override
  _ColorLoader2State createState() => _ColorLoader2State();
}

class _ColorLoader2State extends State<Loading> with TickerProviderStateMixin {
  final List<double> delays = [.0,-1.3, -1.3, -1.2,-1.1, -1.0, -0.9, -0.8, -0.7, -0.6, -0.5, -0.4, -0.3, -0.2, -0.1];
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = (widget.controller ?? AnimationController(vsync: this, duration: widget.duration))..repeat();
  }
  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  ClipRRect(
                    child: Image.asset(
                      "assets/images/rocket.png",
                      fit: BoxFit.cover,
                      color: baseAppColor,
                      width:22.0,
                      height: 22.0,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(11.0)),
                  ),
                  SizedBox.fromSize(
                    size: Size.square(widget.size),
                    child: Stack(
                      children: List.generate(delays.length, (index) {
                        final _position = widget.size * .5;
                        return Positioned.fill(
                          left: _position,
                          top: _position,
                          child: Transform(
                            transform: Matrix4.rotationZ(30.0 * index * 0.0174533),
                            child: Align(
                              alignment: Alignment.center,
                              child: ScaleTransition(
                                scale: DelayTween(begin: 0.0, end: 1.0, delay: delays[index]).animate(_controller),
                                child: SizedBox.fromSize(size: Size.square(widget.size * 0.15), child: _itemBuilder(index)),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              )
          )
        ],
      ),
    );
  }

  Widget _itemBuilder(int index) => widget.itemBuilder != null
      ? widget.itemBuilder!(context, index)
      : DecoratedBox(decoration: BoxDecoration(color: widget.color, shape: BoxShape.circle));
}

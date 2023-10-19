import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hankofiles/constants/colors.dart';

class Apploader extends StatefulWidget {
  const Apploader({
    Key? key,
    this.size = 50.0,
    required this.child,
    required this.isLoading,
  })  : super(key: key);

  final double size;
  final bool isLoading;
  final Widget child;

  @override
  _ApploaderState createState() => _ApploaderState();
}

class _ApploaderState extends State<Apploader> with SingleTickerProviderStateMixin {
  late AnimationController? _controller;

  late List<Widget> _widgets;

  Timer? _forwardTimer;

  double _lastAnim = 0;

  @override
  void initState() {
    super.initState();

    // Create a extra element which is used for the show/hide animation.
    _widgets = List.generate(
      4,
      (i) => SizedBox.fromSize(
        size: Size.square(widget.size * 0.5),
        child: _itemBuilder(i),
      ),
    );

    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 500));

    _controller!.forward();

    _controller!.addListener(() {
      if (_lastAnim > _controller!.value) {
        setState(() => _widgets.insert(0, _widgets.removeLast()));
      }

      _lastAnim = _controller!.value;

      if (_controller!.isCompleted) {
        _forwardTimer = Timer(const Duration(milliseconds: 50), () => _controller?.forward(from: 0));
      }
    });
  }

  @override
  void dispose() {
      _controller?.dispose();
      _controller = null;
    _forwardTimer?.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.child,
        if(widget.isLoading) ... [
          Opacity(
            opacity: 0.8,
            child: ModalBarrier(dismissible: false, color: kPrimary.withOpacity(0.4)),
          ),
          Center(
            child: SizedBox.fromSize(
              size: Size(widget.size * 2, widget.size),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: _widgets
                    .asMap()
                    .map((index, value) {
                      Widget innerWidget = value;

                      if (index == 0) {
                        innerWidget = _wrapInAnimatedBuilder(innerWidget);
                      } else if (index == 3) {
                        innerWidget = _wrapInAnimatedBuilder(
                          innerWidget,
                          inverse: true,
                        );
                      }

                      return MapEntry<int, Widget>(index, innerWidget);
                    })
                    .values
                    .toList(),
              ),
            ),
          ),
        ]
      ],
    );
  }

  AnimatedBuilder _wrapInAnimatedBuilder(
    Widget innerWidget, {
    bool inverse = false,
  }) =>
      AnimatedBuilder(
        animation: _controller!,
        child: innerWidget,
        builder: (context, inn) {
          final value = inverse ? 1 - _controller!.value : _controller!.value;
          return SizedBox.fromSize(
            size: Size.square(widget.size * 0.5 * value),
            child: Opacity(opacity: value, child: inn),
          );
        },
      );

  Widget _itemBuilder(int index) => const DecoratedBox(decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle));
}
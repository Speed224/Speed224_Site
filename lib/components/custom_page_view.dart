import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CustomPageView extends StatefulWidget {
  final PageController _controller;
  final List<Widget> _pageList;
  const CustomPageView({Key? key, required PageController controller, required List<Widget> pageList})
      : _controller = controller,
        _pageList = pageList,
        super(key: key);

  @override
  State<CustomPageView> createState() => _CustomPageViewState();
}

class _CustomPageViewState extends State<CustomPageView> {
  bool pageIsScrolling = false;

  Duration duration = const Duration(milliseconds: 600);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragUpdate: (details) {
        int sensitivity = 1;
        if (details.delta.dy > sensitivity) {
          // Down Swipe
          widget._controller
              .previousPage(duration: duration, curve: Curves.easeInOut)
              .then((value) => pageIsScrolling = false);
          //onScroll(details.delta.dy * -1);
        } else if (details.delta.dy < -sensitivity) {
          widget._controller
              .nextPage(duration: duration, curve: Curves.easeInOut)
              .then((value) => pageIsScrolling = false);

          //onScroll(details.delta.dy * -1);
          // Up Swipe
        }
      },
      // to detect swipe
      //onPanUpdate: (details) {
      //  onScroll(details.delta.dy * -1);
      //},
      child: Listener(
        // to detect scroll
        onPointerSignal: (pointerSignal) {
          if (pointerSignal is PointerScrollEvent) {
            onScroll(pointerSignal.scrollDelta.dy);
          }
        },
        child: PageView(
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          controller: widget._controller,
          children: widget._pageList,
        ),
      ),
    );
  }

  void onScroll(double offset) {
    if (pageIsScrolling == false) {
      pageIsScrolling = true;
      if (offset > 0) {
        widget._controller
            .nextPage(duration: duration, curve: Curves.easeInOut)
            .then((value) => pageIsScrolling = false);
        //print('scroll down');
      } else {
        widget._controller
            .previousPage(duration: duration, curve: Curves.easeInOut)
            .then((value) => pageIsScrolling = false);
        //print('scroll up');
      }
    }
  }
}

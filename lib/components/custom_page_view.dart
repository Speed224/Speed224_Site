import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CustomPageView extends StatefulWidget {
  const CustomPageView({Key? key}) : super(key: key);

  @override
  State<CustomPageView> createState() => _CustomPageViewState();
}

class _CustomPageViewState extends State<CustomPageView> {
  bool pageIsScrolling = false;
  final PageController controller = PageController(viewportFraction: 1);

  Duration duration = const Duration(milliseconds: 600);

  callback(direction) {
    setState(
      () {
        switch (direction) {
          case "up":
            controller.nextPage(duration: duration, curve: Curves.easeInOut).then((value) => pageIsScrolling = false);
            break;
          case "down":
            controller
                .previousPage(duration: duration, curve: Curves.easeInOut)
                .then((value) => pageIsScrolling = false);
            break;
          default:
            break;
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onVerticalDragUpdate: (details) {
          int sensitivity = 1;
          if (details.delta.dy > sensitivity) {
            // Down Swipe
            controller
                .previousPage(duration: duration, curve: Curves.easeInOut)
                .then((value) => pageIsScrolling = false);
            //onScroll(details.delta.dy * -1);
          } else if (details.delta.dy < -sensitivity) {
            controller.nextPage(duration: duration, curve: Curves.easeInOut).then((value) => pageIsScrolling = false);

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
            controller: controller,
            children: const <Widget>[
              Center(
                child: Text('First Page'),
              ),
              Center(
                child: Text('Second Page'),
              ),
              Center(
                child: Text('Third Page'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onScroll(double offset) {
    if (pageIsScrolling == false) {
      pageIsScrolling = true;
      if (offset > 0) {
        controller.nextPage(duration: duration, curve: Curves.easeInOut).then((value) => pageIsScrolling = false);
        //print('scroll down');
      } else {
        controller.previousPage(duration: duration, curve: Curves.easeInOut).then((value) => pageIsScrolling = false);
        //print('scroll up');
      }
    }
  }

  void scrollPage(String direction) {
    switch (direction) {
      case "up":
        controller.nextPage(duration: duration, curve: Curves.easeInOut).then((value) => pageIsScrolling = false);
        break;
      case "down":
        controller.previousPage(duration: duration, curve: Curves.easeInOut).then((value) => pageIsScrolling = false);
        break;
    }
  }
}

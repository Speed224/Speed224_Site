import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

//Sviluppo droppato a causa del funzionamento dello stack e dell'overflow :(
/*
class IconPopupMenu extends StatefulWidget {
  /// Controller to interact with popupmenu from code
  final IconPopupMenuController controller;

  final Duration animationDuration;

  const IconPopupMenu({
    Key? key,
    required this.controller,
    this.animationDuration = const Duration(milliseconds: 300),
  }) : super(key: key);

  @override
  State<IconPopupMenu> createState() => _IconPopupMenuState();
}

class _IconPopupMenuState extends State<IconPopupMenu> with SingleTickerProviderStateMixin {
  AnimationController? _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
    );
    //Se è esteso procedi con l'animazione
    if (widget.controller.extended) {
      _animationController?.forward();
    } else {
      _animationController?.reverse();
    }
    widget.controller.extendStream.listen(
      (extended) {
        if (_animationController?.isCompleted ?? false) {
          _animationController?.reverse();
        } else {
          _animationController?.forward();
        }
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.controller,
      builder: ((context, child) {
        return AnimatedContainer(
          duration: widget.animationDuration,
          child: Row(
            children: [
              popupMenuItem(
                onPressed: () {
                  widget.controller.toggleExtended();
                },
                flag: Flags.en,
              ),
              if (widget.controller.extended)
                popupMenuItem(
                  onPressed: () {
                    widget.controller.toggleExtended();
                  },
                  flag: Flags.it,
                ),
              if (widget.controller.extended)
                popupMenuItem(
                  onPressed: () {
                    widget.controller.toggleExtended();
                  },
                  flag: Flags.us,
                ),
            ],
          ),
        );
      }),
    );
  }

  @override
  void dispose() {
    _animationController?.dispose();
    _animationController = null;
    super.dispose();
  }
}

class IconPopupMenuController extends ChangeNotifier {
  bool _extended = false;
  IconPopupMenuController({bool? extended}) {
    _setExtedned(extended ?? false);
  }

  //non so bene che sia
  final _extendedController = StreamController<bool>.broadcast();
  Stream<bool> get extendStream => _extendedController.stream.asBroadcastStream();

  bool get extended => _extended;
  void setExtended(bool extended) {
    _extended = extended;
    _extendedController.add(extended);
    notifyListeners();
  }

  void toggleExtended() {
    _extended = !_extended;
    _extendedController.add(_extended);
    notifyListeners();
  }

  void _setExtedned(bool val) {
    _extended = val;
    notifyListeners();
  }

  @override
  void dispose() {
    _extendedController.close();
    super.dispose();
  }
}

enum Flags { en, it, us }

//Height is width/2
popupMenuItem({double size = 50, double borderRadius = 5, required Flags flag, required Function()? onPressed}) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(borderRadius),
    //senza material i bordi non vengono arrotondati
    child: Material(
      child: InkWell(
        splashColor: Colors.transparent,
        onTap: onPressed,
        child: Text(
          getFlag(flag),
          style: TextStyle(fontSize: size),
        ),
      ),
    ),
  );
}

/*
child: Container(
          width: width,
          height: width / 2,
          padding: const EdgeInsets.all(2),
          child: Image.asset(
            getFlag(flag),
            fit: BoxFit.scaleDown,
          ),
        ),
*/
String getFlag(Flags f) {
  switch (f) {
    case Flags.en:
      return "🇬🇧";
    case Flags.us:
      return "🇺🇸";
    case Flags.it:
      return "🇮🇹";
  }
}

/*
switch (f) {
    case Flags.en:
      return "assets/icons/flags/gb.png";
    case Flags.us:
      return "assets/icons/flags/us.png";
    case Flags.it:
      return "assets/icons/flags/it.png";
      */
*/
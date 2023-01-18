import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:speed224_site/components/custom_page_view.dart';

class HomePage extends StatelessWidget {
  final Function? scrollFunction;
  const HomePage({super.key, this.scrollFunction});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomPageView(),
    );
  }
}

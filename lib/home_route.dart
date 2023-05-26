import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MyHomeRoute extends StatefulWidget {
  const MyHomeRoute({super.key});

  @override
  State<MyHomeRoute> createState() => _HomeRouteHandler();
}

class _HomeRouteHandler extends State<MyHomeRoute> {
  // ignore: prefer_final_fields
  PageController _pageController = PageController();

  // number of page view widgets
  final int _pageCount = 4;

  // calls the _scheduledPageSwitch when the app is first initialized
  @override
  void initState() {
    super.initState();
    _scheduledPageSwitch();
  }

  // after a given amount of time, _moveToNextPage is
  // called and _scheduledPageSwitch is recursively called
  void _scheduledPageSwitch() {
    Future.delayed(const Duration(seconds: 2), () {
      _moveToNextPage();
      _scheduledPageSwitch();
    });
  }

  // handles the automatic movement of the page view
  void _moveToNextPage() {
    int nextPage = (_pageController.page!.toInt() + 1) % _pageCount;
    _pageController.animateToPage(nextPage,
        duration: const Duration(milliseconds: 800), curve: Curves.easeInOut);
  }

  // list of widgets that will go inside the page view
  List<String> pageViewElemets = [
    "assets/images/saf_components/slide_get_extra.png",
    "assets/images/saf_components/slide_get_maps.png",
    "assets/images/saf_components/slide_power_hour.png",
    "slide_bonga.png"
  ];

  Widget pageViewConstructor(
      {required List<String> pageViewElements,
      required height,
      required width}) {
    return PageView.builder(
        controller: _pageController,
        itemCount: pageViewElements.length,
        itemBuilder: (context, index) {
          return Image.asset(
            pageViewElements[index],
            height: height,
            width: width,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
        itemCount: 100,
        itemBuilder: ((context, index) {
          return ListTile(
            title: Text("Title $index"),
            subtitle: Text("Subtitle $index"),
          );
        }));
  }
}

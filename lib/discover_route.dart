import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'reusable_widgets.dart';
import 'home_route.dart';

class DiscoverRoute extends StatelessWidget {
  const DiscoverRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Discover",
          style: titleTextStyle,
          ),
        centerTitle: true,
        actions: [actionButtons(context)],
      ),
      body: const MyDiscoverBody(),
    );
  }
}

class MyDiscoverBody extends StatefulWidget {
  const MyDiscoverBody({super.key});

  @override
  State<MyDiscoverBody> createState() => _DiscoverBodyHandler();
}

class _DiscoverBodyHandler extends State<MyDiscoverBody> {
  PageController _discoverForYouController = PageController();
  double _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _discoverForYouController.addListener(() {
      setState(() {
        _currentPage = _discoverForYouController.page!;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _discoverForYouController.dispose();
  }

  // browse categories elemets builder
  Widget browseCategories(
      {required category, required VoidCallback categoryFunction}) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15))),
        onPressed: categoryFunction,
        child: Image.asset("assets/images/saf_components/$category"));
  }

  // section 2
  Widget mainRowCategory() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: []);
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(10.0),
      children: [
         Padding(
          padding: EdgeInsets.only(top: 10, bottom: 10),
          child: Text(
            "Browse Categories",
            style: sectionTitles
            ),
        ),
        // main Row that contains two column widgets
        mainRowCategory(),
      ],
    );
  }
}

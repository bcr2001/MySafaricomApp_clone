import 'package:flutter/material.dart';
import 'reusable_widgets.dart';
import 'home_route.dart';

class DiscoverRoute extends StatelessWidget {
  const DiscoverRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Discover"),
        centerTitle: true,
        actions: [actionButtons(context)],

      ),
    );
  }
}

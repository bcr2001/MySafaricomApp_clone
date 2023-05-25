import 'package:flutter/material.dart';

void main() {
  runApp(const MyMainApp());
}

// this enum contains the theme options
enum ThemeModeSetting { light, dark, system }

class MyMainApp extends StatefulWidget {
  const MyMainApp({super.key});

  @override
  State<MyMainApp> createState() => _MainAppHandler();
}

class _MainAppHandler extends State<MyMainApp> {
  // ignore: prefer_final_fields
  // the default theme is set to the system settings
  ThemeModeSetting themeModeSetting = ThemeModeSetting.dark;
  // this method handles change of the current index

  // holds the current page position
  int _currentIndex = 0;

// buttom navigation text color (home excluded)
// ignore: prefer_final_fields
  Color _initialMpesaColor = Colors.white;
  Color _initialDiscoverColor = Colors.white;
  Color _initialAccountColor = Colors.white;
  Color _initialHomeColor = const Color(0xFF0AE500);

  Widget _buildNavButtons(
      int index, String imageLocation, double imageHeight, double imageWidth) {
    return ElevatedButton(
        onPressed: () {},
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              imageLocation,
              fit: BoxFit.contain,
              height: imageHeight,
              width: imageWidth,
              color: _initialHomeColor,
            )
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          useMaterial3: true,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          brightness: Brightness.light),
      darkTheme: ThemeData(
          useMaterial3: true,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          brightness: Brightness.dark),
      themeMode: themeModeSetting == ThemeModeSetting.dark
          ? ThemeMode.dark
          : themeModeSetting == ThemeModeSetting.light
              ? ThemeMode.light
              : ThemeMode.system,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("MySafaricomApp"),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
            padding: const EdgeInsets.only(
              top: 30,
            ),
            child: Container(
              margin: const EdgeInsets.only(right: 16),
              width: 65,
              height: 65,
              child: FloatingActionButton.large(
                  onPressed: () {
                    print("modal is being displayes");
                  },
                  elevation: 0,
                  backgroundColor: const Color(0xFF2E313E),
                  shape: const CircleBorder(),
                  child: Image.asset(
                    "assets/images/saf_icons/bottom_navigation_saf.png",
                    fit: BoxFit.contain,
                    width: 90,
                    height: 90,
                  )),
            )),
        bottomNavigationBar: BottomAppBar(
          height: 70,
          notchMargin: 0,
          color: const Color(0xFF2E313E),
          child: Row(
            // main row that holds the entire bottom navigation elements
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                //first row for the home and mpesa routes
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // home button
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _currentIndex = 0;
                          _initialHomeColor = const Color(0xFF0AE500);
                          _initialAccountColor = Colors.white;
                          _initialDiscoverColor = Colors.white;
                          _initialMpesaColor = Colors.white;
                        });
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            "assets/images/saf_icons/homePage.png",
                            fit: BoxFit.contain,
                            height: 25,
                            width: 25,
                            color: _initialHomeColor,
                          ),
                          Padding(
                              padding: const EdgeInsets.only(top: 1),
                              child: Text(
                                "Home",
                                style: TextStyle(
                                    fontSize: 12, color: _initialHomeColor),
                              ))
                        ],
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

// colors am using
// 07A400
// 0AE500
// 2E313E

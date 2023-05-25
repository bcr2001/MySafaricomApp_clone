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
      int index,
      String imageLocation,
      double imageHeight,
      double imageWidth,
      Color initialColor,
      String buttonName,
      double textPaddingTop,
      [double textPaddingBottom = 0]) {
    return ElevatedButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
        ),
        onPressed: () {
          setState(() {
            // Reset all colors
            _initialMpesaColor = Colors.white;
            _initialHomeColor = Colors.white;
            _initialDiscoverColor = Colors.white;
            _initialAccountColor = Colors.white;

            // Only change the color for the selected index
            if (index == 0) {
              _currentIndex = 0;
              _initialHomeColor = const Color(0xFF0AE500);
            } else if (index == 1) {
              _currentIndex = 1;
              _initialMpesaColor = const Color(0xFF0AE500);
            } else if (index == 2) {
              _currentIndex = 2;
              _initialDiscoverColor = const Color(0xFF0AE500);
            } else {
              _currentIndex = 3;
              _initialAccountColor = const Color(0xFF0AE500);
            }
          });
        },
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Image.asset(
              imageLocation,
              fit: BoxFit.contain,
              height: imageHeight,
              width: imageWidth,
              color: initialColor,
            ),
            Padding(
              padding: EdgeInsets.only(top: textPaddingTop, bottom: textPaddingBottom),
              child: Text(
                buttonName,
                style: TextStyle(fontSize: 12, color: initialColor),
              ),
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
              top: 30
            ),
            child: Container(
              margin: const EdgeInsets.only(left: 15, right: 30),
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
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //first row for the home and mpesa routes
              Row(
                children: [
                  // home route elevated button
                  _buildNavButtons(0, "assets/images/saf_icons/homePage.png",
                      25, 25, _initialHomeColor, "Home", 4),

                  //  mpesa route elevated button
                  _buildNavButtons(1, "assets/images/saf_icons/mpesaHome.png",
                      19, 30, _initialMpesaColor, "MPESA", 9)
                ],
              ),
              // second row for the discover and account routes
              Row(
                children: [
                  // discover route 
                  _buildNavButtons(2, "assets/images/saf_icons/discover_icon.png", 27, 35, _initialDiscoverColor, "Discover", 0, 2),

                  // account route
                  _buildNavButtons(3, "assets/images/saf_icons/account_icon.png", 27, 35, _initialAccountColor, "Account", 1)
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
// 2E313
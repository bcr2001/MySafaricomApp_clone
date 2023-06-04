import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// the action buttons found on each bottom
// navigation routes

Widget actionButtons(context) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      // search icon
      IconButton(
          onPressed: () {
            print("search clicked");
          },
          icon: const Icon(Icons.search)),

      // notification icon
      IconButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const NotificationPage()));
          },
          icon: const Icon(Icons.notifications_outlined)),

      // pop up menu button
      PopupMenuButton(onSelected: (value) {
        if (value == "logout") {
          showPopUpDialog(context);
        }
      }, itemBuilder: (BuildContext context) {
        return [
          const PopupMenuItem(
              value: "logout",
              child: Text(
                "Logout",
                style: TextStyle(fontSize: 15),
              ))
        ];
      })
    ],
  );
}

// Notification route

// alert dialog (pop up menu)
showPopUpDialog(context) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          return AlertDialog(
            title: const Text(
              "Logout",
              style: TextStyle(color: Color(0xFF0AE500)),
            ),
            content: Container(
              width: constraints.maxWidth,
              height: 100,
              padding: const EdgeInsets.only(right: 5, left: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Divider(),
                  const Text("Are you sure you want to logout?"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF2E313E)),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text(
                            "Cancel",
                            style: TextStyle(color: Colors.white),
                          )),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF0AE500)),
                          onPressed: () {},
                          child: const Text(
                            "LOGOUT",
                            style: TextStyle(color: Colors.black),
                          ))
                    ],
                  )
                ],
              ),
            ),
          );
        });
      });
}

// notification icon

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Notification"),
            centerTitle: true,
            bottom: const TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorColor: Color(0xFF0AE500),
              labelColor: Color(0xFF0AE500),
              tabs: [
                Tab(child: Text("NOTIFICATIONs")),
                Tab(child: Text("REMINDERS")),
              ],
            ),
          ),
          body: TabBarView(children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                    "assets/images/saf_components/center_notification.png"),
                const Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 10),
                  child: Text(
                    "All caught up!",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                const Text("Notifications will appear here"),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/saf_components/center_reminder.png"),
                const Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 10),
                  child: Text(
                    "No new Reminders",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                const Text("New reminders will appear here"),
              ],
            ),
          ]),
        ));
  }
}

// mpesa route services constructor (Image and name)
Widget mpesaServices(
    {required String buttonImage,
    required String buttonName,
    required VoidCallback onButtonTap}) {
  return GestureDetector(
    onTap: onButtonTap,
    child: Container(
      margin: const EdgeInsets.all(5),
      width: 55,
      decoration: BoxDecoration(
          color: const Color(0xFF242424),
          borderRadius: BorderRadius.circular(5)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // top icon
          Image.asset("assets/images/saf_icons/$buttonImage",
              height: 30, width: 30),
          // bottom button name
          Padding(
            padding: const EdgeInsets.all(3),
            child: Text(
              buttonName,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 15, color: Colors.white),
            ),
          )
        ],
      ),
    ),
  );
}

// Elevated Button constructor (Mpesa Route)
Widget elevatedButton(
    {required String buttonName,
    required VoidCallback onPressedFunction,
    required bool isButtonImage,
    String buttonImage = "",
    Color imageColor = Colors.red}) {
  return ElevatedButton(
      onPressed: onPressedFunction,
      child: SizedBox(
        width: double.infinity,
        height: 40,
        // if the isButtonImage = true then an image is rendered
        // otherwise a Text widget is rendered
        child: isButtonImage
            ? Padding(
                padding: const EdgeInsets.all(5),
                child: Image.asset(
                  "assets/images/saf_icons/$buttonImage",
                  fit: BoxFit.contain,
                  color: imageColor,
                  width: 30,
                  height: 30,
                ),
              )
            : Center(
                child: Text(
                  buttonName,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      letterSpacing: 0.8,
                      color: Color(0xFF54C64F),
                      fontSize: 18),
                ),
              ),
      ));
}



// PageView constructor
Widget pageViewConstructor(
    {required currentPageController,
    required  List<String> pageViewElements,
    required double containerHeight,
    required double containerWidth}) {
  return Column(children: [
    // pageView Builder
    Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
        width: containerWidth,
        height: containerHeight,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: PageView.builder(
                controller: currentPageController,
                itemCount: pageViewElements.length,
                itemBuilder: (context, index) {
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () {
                      print("${pageViewElements[index]} was clicked");
                    },
                    child: Image.asset(
                      pageViewElements[index],
                      fit: BoxFit.fill,
                    ),
                  );
                }))),
    //smoothPageIndicator
    Padding(
        padding: const EdgeInsets.only(top: 5, bottom: 5),
        child: SmoothPageIndicator(
          controller: currentPageController,
          count: pageViewElements.length,
          effect: const WormEffect(
              dotColor: Color(0xFF2E313E),
              activeDotColor: Color(0xFFFF0000),
              dotHeight: 7,
              dotWidth: 7),
        ))
  ]);
}

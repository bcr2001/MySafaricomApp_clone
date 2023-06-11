import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// AppBar Title Text Style
TextStyle titleTextStyle = const TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w500,
    color: Color(0xFFF5F3F0),
    letterSpacing: 0.8);

// Section Title Text Style
TextStyle sectionTitles =
    const TextStyle(fontSize: 20, letterSpacing: 0.8, color: Color(0xFFF5F3F0));

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
          color: const Color(0xFF262937),
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
    required List<String> pageViewElements,
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

// list of widgets for the For You section
List<String> forYouPageView = [
  "assets/images/saf_components/for_you_monthly.png",
  "assets/images/saf_components/for_you_tips.png",
  "assets/images/saf_components/for_you_wifi.png",
  "assets/images/saf_components/for_you_baze.png",
];

// handles the hot deals creation and function operation
Widget singleChildViewButton(
    {required String buttonImage,
    required VoidCallback onPressedFunction,
    double imageHeight = 120,
    double imageWidth = 220}) {
  return Padding(
    padding: const EdgeInsets.only(right: 10),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(6),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20))),
          onPressed: onPressedFunction,
          child: Image.asset(
            "assets/images/saf_components/$buttonImage",
            height: imageHeight,
            width: imageWidth,
            fit: BoxFit.cover,
          )),
    ),
  );
}

// iconImage place here function
Widget iconImagePlaceHere(
    {required String imageName,
    double imageHeight = 30,
    double imageWidth = 30}) {
  return Image.asset(
    "assets/images/saf_icons/$imageName",
    fit: BoxFit.contain,
    height: imageHeight,
    width: imageWidth,
  );
}

// ACCOUNT ROURE FUNCTIONS

// account details
Widget detailsConstructor(
    {required String detailName, required detailInformation}) {
  return Column(
    children: [
      Text(
        detailName,
        style: TextStyle(color: Colors.white.withOpacity(0.6)),
      ),
      Text(
        detailInformation,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    ],
  );
}

// Vertical line Separator
Widget verticalLine() {
  return Container(
    margin: const EdgeInsets.only(left: 15),
    width: 2.0,
    height: 20,
    color: Colors.grey,
  );
}

// Quick Account Actions: action constructor
Widget quickActionConstructor(
    {required String actionIcon,
    required String actionName,
    required VoidCallback actionFunction}) {
  return GestureDetector(
    onTap: () => actionFunction,
    child: Column(
      children: [
        // actionIcon
        Image.asset(
          "assets/images/saf_icons/$actionIcon",
          fit: BoxFit.contain,
          width: 30,
          height: 30,
        ),

        // actionName
        Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child: Text(
            actionName,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        )
      ],
    ),
  );
}

// SECTION 4: ACCOUNT SETTINGS
Widget accountSettingConstructor(
    {required String settingImage,
    required String settingName,
    required VoidCallback settingsFunction}) {
  return Padding(
    padding: const EdgeInsets.only(top:15),
    child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(8.0),
          backgroundColor: const Color(0xFF262937),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8)
          )
        ),
        onPressed: settingsFunction,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // row containing image and name
              Row(
                children: [
                  // settings image
                  Image.asset(
                    "assets/images/saf_icons/$settingImage",
                    fit: BoxFit.contain,
                    height: 30,
                    width: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:15.0),
                    child: Text(
                      settingName, 
                      style: const TextStyle(
                        color: Color(0xFFF5F3F0),
                        fontSize: 16,
                        letterSpacing: 1.5
                      ),),
                  )
                ],
              ),
  
              // right facing arrow image
              Image.asset(
                "assets/images/saf_icons/saf_next.png",
                fit: BoxFit.contain,
                height: 20,
                width: 20,
              )
            ],
          ),
        )),
  );
}

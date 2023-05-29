import 'package:flutter/material.dart';

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
                    child: Text("All caught up!", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                  ),
                  const Text("Notifications will appear here"),
                ],
              ),
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                      "assets/images/saf_components/center_reminder.png"),
                  const Padding(
                    padding: EdgeInsets.only(top: 20, bottom: 10),
                    child: Text("No new Reminders", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                  ),
                  const Text("New reminders will appear here"),
                ],
              ),
            
          ]),
        ));
  }
}

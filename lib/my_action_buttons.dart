import 'package:flutter/material.dart';

// the action buttons found on each bottom
// navigation routes

Widget actionButtons(context) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      // search icon
      IconButton(onPressed: () {}, icon: const Icon(Icons.search)),

      // notification icon
      IconButton(onPressed: () {}, icon: const Icon(Icons.notifications)),

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

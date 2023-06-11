import "package:flutter/material.dart";
import 'reusable_widgets.dart';

class AccountRoute extends StatelessWidget {
  const AccountRoute({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Account",
          style: titleTextStyle,
        ),
        centerTitle: true,
        actions: [actionButtons(context)],
      ),
      body: MyAccountBody(),
    );
  }
}

class MyAccountBody extends StatefulWidget {
  const MyAccountBody({super.key});

  @override
  State<MyAccountBody> createState() => _AccountBodyHandler();
}

class _AccountBodyHandler extends State<MyAccountBody> {
  String _initialText = "Click to update and verify your details";

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      if (mounted) {
        setState(() {
          _initialText = "Details Completed & approved";
        });
      }
    });
  }

  // SECTION 1: UPDATE SIM
  Widget updateSimDetails() {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: const Color(0xFF262937),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        onPressed: () {
          print("Update Details");
        },
        child: SizedBox(
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Text
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Update your SIM Registration Details",
                    style: TextStyle(fontSize: 17, color: Color(0xFFF5F3F0)),
                  ),
                  Text(
                    _initialText,
                    style: const TextStyle(color: Color(0xFF0AE500)),
                  )
                ],
              ),

              // image Icon
              Padding(
                padding: const EdgeInsets.only(top: 2),
                child: iconImagePlaceHere(
                    imageName: "shield_check.png",
                    imageHeight: 50,
                    imageWidth: 50),
              )
            ],
          ),
        ),
      ),
    );
  }

  // SECTION 2: ACCOUNT DETAILS
  Widget accountDetails() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xFF262937)),
      padding: const EdgeInsets.only(top: 6.0, bottom: 20),
      child: Column(
        children: [
          // account name (full name)
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // full name initials
                Container(
                  height: 50,
                  width: 50,
                  margin: const EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                      color: const Color(0xFF009999),
                      borderRadius: BorderRadius.circular(20.0)),
                  child: const Center(
                    child: Text(
                      "RC",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                // full name
                const Padding(
                  padding: EdgeInsets.only(left: 12.0),
                  child: Text(
                    "ROTICH CHERUIYOT",
                    style: TextStyle(fontSize: 18),
                  ),
                )
              ],
            ),
          ),
          // Divider
          const SizedBox(
              width: double.infinity,
              child: Divider(
                thickness: 2.0,
              )),

          // phone no, status, and tariff
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // phone number
              detailsConstructor(
                  detailName: "Phone No.", detailInformation: "0718604006"),
              verticalLine(),

              // Status
              detailsConstructor(
                  detailName: "Status", detailInformation: "Active"),
              verticalLine(),

              // Tariff
              detailsConstructor(
                  detailName: "Tariff", detailInformation: "Prepaid")
            ],
          )
        ],
      ),
    );
  }

  //SECTION 3: Quick Account Actions
  Widget quickActions() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: const Color(0xFF212121)),
      width: double.infinity,
      margin: const EdgeInsets.only(top: 15),
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Column(
        children: [
          // section title
          Text(
            "Quick Account Actions",
            style: sectionTitles,
          ),

          // horizontal line separater
          const SizedBox(
            width: double.infinity,
            child: Divider(),
          ),

          //quick action buttons
          Container(
            margin: const EdgeInsets.only(top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // PUK
                quickActionConstructor(
                    actionIcon: "puk.png",
                    actionName: "PUK",
                    actionFunction: () => print("PUK is coming")),

                // Sambaza
                quickActionConstructor(
                    actionIcon: "sambaza.png",
                    actionName: "Sambaza",
                    actionFunction: () => print("Sambaza")),

                // Report Fraud
                quickActionConstructor(
                    actionIcon: "report_fraud.png",
                    actionName: "Report Fraud",
                    actionFunction: () => print("Report Fraud"))
              ],
            ),
          )
        ],
      ),
    );
  }

  // Section 4:
  Widget accountSettings() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // My Usage
        accountSettingConstructor(
            settingImage: "my_usage.png",
            settingName: "My Usage",
            settingsFunction: () => print("usage")),

        // My Subscription
        accountSettingConstructor(
            settingImage: "my_subscriptions.png",
            settingName: "My Subscriptions",
            settingsFunction: () => print("Subscription")),

        // Manage Service PIN
        accountSettingConstructor(
            settingImage: "manage_service_pin.png",
            settingName: "Manage Service PIN",
            settingsFunction: () => print("Manage")),

        // App Settings
        accountSettingConstructor(
            settingImage: "app_settings.png",
            settingName: "App Settings",
            settingsFunction: () => print("Settings")),

        // About MySafaricom
        accountSettingConstructor(
            settingImage: "about_mysaf.png",
            settingName: "About MySafaricom",
            settingsFunction: () => print("About")),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(10.0),
      children: [
        updateSimDetails(),
        accountDetails(),
        quickActions(),
        accountSettings()
      ],
    );
  }
}

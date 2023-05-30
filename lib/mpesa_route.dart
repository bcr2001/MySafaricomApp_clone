import "package:flutter/material.dart";
import 'package:my_safaricom_app_clone/my_action_buttons.dart';

class MpesaRoute extends StatelessWidget {
  const MpesaRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("M-PESA"),
        centerTitle: true,
        actions: [actionButtons(context)],
        backgroundColor: const Color(0xFF1E1D1D),
      ),
      body: const MyMpesaBody(),
    );
  }
}

class MyMpesaBody extends StatefulWidget {
  const MyMpesaBody({super.key});

  @override
  State<MyMpesaBody> createState() => _MpesaBodyHandler();
}

class _MpesaBodyHandler extends State<MyMpesaBody> {



  // mpesa route services constructor
  Widget _mpesaServices(
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

  // Elevated Button constructor
  Widget _elevatedButton(
      {required String buttonName,
      required VoidCallback onPressedFunction,
      required bool isButtonImage,
      String buttonImage = "",
      Color imageColor = Colors.red}) {
    return ElevatedButton(
        onPressed: onPressedFunction,
        child: SizedBox(
            width: double.infinity,
            height: 50,
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
                : Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      buttonName,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          letterSpacing: 0.8,
                          color: Color(0xFF54C64F),
                          fontSize: 18),
                    ),
                  )));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
      child: Column(
        children: [
          // show balance elevated button
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: _elevatedButton(
                buttonName: "Show Balance",
                onPressedFunction: () => print("showing balance"),
                isButtonImage: false),
          ),
          // mpesa go
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
              )
            ),
            onPressed: ()=>print("Mpesa Go"),
            child: SizedBox(
              width: double.infinity,
              child: Center(
                child: Image.asset("assets/images/saf_components/mpesa_go.png",
                    fit: BoxFit.contain, height: 110,),
              ),
            ),
          ),

          // Mpesa statement Button
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: ElevatedButton(
              onPressed: ()=>print("Mpesa Go"),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10)
                ),
                margin: const EdgeInsets.only(top: 10),
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Image.asset("assets/images/saf_components/mpesa_statement.png",
                      fit: BoxFit.contain, 
                      height: 20),
                ),
              ),
            ),
          ),

          // Scan QR code button
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 255, 17, 0)
            ),
            onPressed: ()=> print("scanning QR code"),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10)
              ),
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                  Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: Image.asset(
                      "assets/images/saf_components/scan_qr2.png",
                      fit: BoxFit.contain,
                      height: 15,
                    ),
                  ),
                  const Text("SCAN QR", 
                  style:TextStyle(
                    color: Colors.black,
                    fontSize: 19,
                    letterSpacing: 1.5

                  ) ,),
                ],
              )
              ),
            ),
        ],
      ),
    );
  }
}

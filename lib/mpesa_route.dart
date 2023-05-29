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
        padding: const EdgeInsets.all(5),
        height: 55,
        width: 55,
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFF242424),
            borderRadius: BorderRadius.circular(5)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/saf_icons/$buttonImage",
                  height: 30, width: 30),
              Padding(
                padding: const EdgeInsets.all(4),
                child: Text(buttonName,
                 textAlign: TextAlign.center,style: const TextStyle(
                  fontSize: 15,
                  color: Colors.white
                ),),
              )
            ],
          ),
        ),
      ),
    );
  }

  // Elevated Button constructor
  Widget _elevatedButton(
      {required String buttonName, required VoidCallback onPressedFucntion, required bool isButtonImage, String buttonImage = ""}) {
    return ElevatedButton(
        onPressed: onPressedFucntion,
        child: SizedBox(
          width: 400,
          height: 50,
          child: isButtonImage? Row(
            children: [
              Image.asset(buttonImage),
              Padding(
                padding: const EdgeInsets.only(top:10),
                child:Text(
                  buttonName,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Color(0xFF54C64F), fontSize: 18),
                ),
              ),
            ],
          ): Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
                      buttonName,
                      textAlign: TextAlign.center,
                      style:
                          const TextStyle(color: Color(0xFF54C64F), fontSize: 18),
                    ),
          )
        ));
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
      child:
        GridView.count(
          crossAxisCount: 3,
          children: [
            // send money button
            _mpesaServices(buttonImage: "send_money.png", buttonName: "Send\nMoney", onButtonTap: () => print("sending money")),

            // withdraw cash button
            _mpesaServices(buttonImage: "withdraw_cash.png", buttonName: "Withdraw\nCash", onButtonTap: () => print("withdrawing cash")),

            // buy airtime button
            _mpesaServices(buttonImage: "buy_airtime.png", buttonName: "Buy Airtime", onButtonTap: () => print("buying Airtime")),

            // lipa na mpesa button
            _mpesaServices(buttonImage: "lipa_na_mpesa.png", buttonName: "Lipa na\nM-PESA", onButtonTap: () => print("lipa na mpesa")),

            // bill manager button
            _mpesaServices(buttonImage: "bill_manager.png", buttonName: "Bill\nManager", onButtonTap: () => print("bill manager")),

            // loans and savings button
            _mpesaServices(buttonImage: "loans_savings.png", buttonName: "Loans &\nSavings", onButtonTap: () => print("loans and savings")),

            // fuliza m-pesa button
            _mpesaServices(buttonImage: "fuliza_mpesa.png", buttonName: "Fuliza\nM-PESA", onButtonTap: () => print("fuliza")),

            // mpesa global button
            _mpesaServices(buttonImage: "mpesa_global.png", buttonName: "M-PESA\nGlobal", onButtonTap: () => print("global")),

            //Account button
            _mpesaServices(buttonImage: "account.png", buttonName: "Account", onButtonTap: () => print("accounting")),

          ],),
    );
  }
}

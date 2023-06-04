import "package:flutter/material.dart";
import 'reusable_widgets.dart';

class MpesaRoute extends StatelessWidget {
  const MpesaRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("M-PESA", style: titleTextStyle,),
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

  

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
      child: Column(
        children: [
          // show balance elevated button
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: elevatedButton(
                buttonName: "Show Balance",
                onPressedFunction: () => print("showing balance"),
                isButtonImage: false),
          ),

          // Mpesa Route Services Grid View
          Flexible(
            child: GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true,
              children: [
                // send money service 1
                mpesaServices(buttonImage: "send_money.png", buttonName: "Send\nMoney", onButtonTap:()=> print("sending money")),

                // withdraw cash service 2
                mpesaServices(buttonImage: "withdraw_cash.png", buttonName: "Withdraw\nCash", onButtonTap:()=> print("withdrawing cash")),

                // buy airtime service 3
                mpesaServices(buttonImage: "buy_airtime.png", buttonName: "Buy Airtime", onButtonTap:()=> print("buying airtime")),

                //  lipa na mpesa service 4
                mpesaServices(buttonImage: "lipa_na_mpesa.png", buttonName: "Lipa na\nM-PESA", onButtonTap:()=> print("lipa na mpesa")),

                //  bill manager service 5
                mpesaServices(buttonImage: "bill_manager.png", buttonName: "Bill\nManager", onButtonTap:()=> print("bill manager")),

                //  loans and savings service 6
                mpesaServices(buttonImage: "loans_savings.png", buttonName: "Loans &\nSavings", onButtonTap:()=> print("loans and savings")),

                //  fuliza mpesa service 7
                mpesaServices(buttonImage: "fuliza_mpesa.png", buttonName: "Fuliza\nM-PESA", onButtonTap:()=> print("fuliza mpesa")),

                //  Mpesa Global service 8
                mpesaServices(buttonImage: "mpesa_global.png", buttonName: "M-PESA\nGlobal", onButtonTap:()=> print("mpesa global")),

                //  Mpesa Global service 9
                mpesaServices(buttonImage: "account.png", buttonName: "Account", onButtonTap:()=> print("accounting")),
              ],
            ),
          ),

          // mpesa go
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: ElevatedButton(
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
                      fit: BoxFit.contain, height: 105,),
                ),
              ),
            ),
          ),

          // Mpesa statement Button
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: ElevatedButton(
              onPressed: ()=>print("Mpesa Statement"),
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

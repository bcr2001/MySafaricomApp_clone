import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MyHomeRoute extends StatefulWidget {
  const MyHomeRoute({super.key});

  @override
  State<MyHomeRoute> createState() => _HomeRouteHandler();
}

class _HomeRouteHandler extends State<MyHomeRoute> {
  // ignore: prefer_final_fields
  // handles the page change of the pageview
  PageController _pageController = PageController();

  // number of page view widgets
  final int _pageCount = 4;

  // calls the _scheduledPageSwitch when the app is first initialized
  @override
  void initState() {
    super.initState();
    _scheduledPageSwitch();
  }

  // after a given amount of time, _moveToNextPage is
  // called and _scheduledPageSwitch is recursively called
  void _scheduledPageSwitch() {
    Future.delayed(const Duration(seconds: 2), () {
      _moveToNextPage();
      _scheduledPageSwitch();
    });
  }

  // handles the automatic movement of the page view
  void _moveToNextPage() {
    int nextPage = (_pageController.page!.toInt() + 1) % _pageCount;
    _pageController.animateToPage(nextPage,
        duration: const Duration(milliseconds: 800), curve: Curves.easeInOut);
  }

  // list of widgets that will go inside the page view
  List<String> pageViewElemets = [
    "assets/images/saf_components/slide_get_extra.png",
    "assets/images/saf_components/slide_get_maps.png",
    "assets/images/saf_components/slide_power_hour.png",
    "assets/images/saf_components/slide_bonga.png",
  ];

  // takes the pageViewElements and puts them in a pageView
  Widget pageViewConstructor({required List<String> pageViewElements}) {
    return Column(
      children: [
        // pageView Builder
        Container(
          color: Colors.blue,
          width: 180,
          height: 160,
          child: PageView.builder(
              controller: _pageController,
              itemCount: pageViewElements.length,
              itemBuilder: (context, index) {
                return Image.asset(
                  pageViewElements[index],
                  height: 300,
                  fit: BoxFit.fill,
                );
              })),
        //smoothPageIndicator
        Padding(padding: const EdgeInsets.only(top: 5, bottom: 5),child:
        SmoothPageIndicator(
          controller: _pageController, 
          count: _pageCount,
          effect:  const WormEffect(
            dotColor:  Color(0xFF2E313E),
            activeDotColor: Color(0xFFFF0000),
            dotHeight: 8,
            dotWidth: 8
          ),
          ))
      ]);
  }

  // builds buttons for the services safaricom offers
  Widget serviceButtonBuilder(
      {required String serviceName,
      required String serviceImage,
      required double imageHeight,
      required double imageWidth}) {
    return Container(
        margin: const EdgeInsets.only(bottom: 10),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6))),
            onPressed: () {},
            child: SizedBox(
                height: 80,
                width: 145,

                // row contains the image(left) and service name(right)
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // service Image
                    Image.asset(
                      "assets/images/saf_icons/$serviceImage",
                      fit: BoxFit.contain,
                      height: imageHeight,
                      width: imageWidth,
                    ),

                    // service Name
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        serviceName,
                        style: const TextStyle(
                            fontSize: 14,
                            color: Color(0xFFF5F3F0),
                            letterSpacing: 1),
                      ),
                    )
                  ],
                ))));
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          actions: [],
          floating: true,
          pinned: true,
          expandedHeight: 180,
          flexibleSpace: FlexibleSpaceBar(
            title: const Text(
              "Rotich",
              style: TextStyle(fontSize: 18),
            ),
            centerTitle: true,
            background: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text("Good Morning"),
                  ),
                  Container(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      onPressed: () {
                        print("Button Was pressed");
                      },
                      child: const Text(
                        "View My Balance",
                        style:
                            TextStyle(color: Color(0xFF0AE500), fontSize: 15),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          // main row that houses the two rows(left and right)
          Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // first row that contains the automatic page view
                  // and 5 service buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          // pageView
                          pageViewConstructor(
                              pageViewElements: pageViewElemets),

                          // data and calls service
                          serviceButtonBuilder(
                              serviceName: "Data, Calls,\nSMS &\nAirtime",
                              serviceImage: "data_calls.png",
                              imageHeight: 30,
                              imageWidth: 30),

                          // my usage service
                          serviceButtonBuilder(
                              serviceName: "My Usage",
                              serviceImage: "my_usage.png",
                              imageHeight: 30,
                              imageWidth: 30),

                          // tunukiwa offers
                          serviceButtonBuilder(
                              serviceName: "Tunukiwa\nOffers",
                              serviceImage: "tunukiwa_offers.png",
                              imageHeight: 30,
                              imageWidth: 30),

                          // bonga reward
                          serviceButtonBuilder(
                              serviceName: "Bonga\nRewards",
                              serviceImage: "bonga_rewards.png",
                              imageHeight: 35,
                              imageWidth: 35)
                        ],
                      )
                    ],
                  ),

                  // second row that containes 6 service buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          // ask zuri
                          serviceButtonBuilder(
                              serviceName: "Ask Zuri\nGet Help",
                              serviceImage: "zuri.png",
                              imageHeight: 60,
                              imageWidth: 60),

                          // send money
                          serviceButtonBuilder(
                              serviceName: "Data, Calls,\nSMS &\nAirtime",
                              serviceImage: "send_money.png",
                              imageHeight: 35,
                              imageWidth: 35),

                          // Lipa na Mpesa
                          serviceButtonBuilder(
                              serviceName: "Lipa na\nM-PESA",
                              serviceImage: "lipa_na_mpesa.png",
                              imageHeight: 35,
                              imageWidth: 35),

                          // airtime topup
                          serviceButtonBuilder(
                              serviceName: "Airtime\nTop Up",
                              serviceImage: "airtime_topup.png",
                              imageHeight: 35,
                              imageWidth: 35),

                          // home internet
                          serviceButtonBuilder(
                              serviceName: "Home\nInternet",
                              serviceImage: "home_internet.png",
                              imageHeight: 35,
                              imageWidth: 35),

                          // join postpay
                          serviceButtonBuilder(
                              serviceName: "Home\nInternet",
                              serviceImage: "join_postpay.png",
                              imageHeight: 35,
                              imageWidth: 35),
                        ],
                      ),
                    ],
                  )
                ],
              )),

          // hot deals

          // For you
        ]))
      ],
    );
  }
}

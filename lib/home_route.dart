import 'package:flutter/material.dart';
import 'my_action_buttons.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MyHomeRoute extends StatefulWidget {
  const MyHomeRoute({super.key});

  @override
  State<MyHomeRoute> createState() => _HomeRouteHandler();
}

class _HomeRouteHandler extends State<MyHomeRoute> {
  // ignore: prefer_final_fields
  // handles the page change of the pageview(promotion)
  final PageController _pageControllerPromotion = PageController();

  // handles the page change of the pageview(promotion)
  final PageController _pageControllerForYou = PageController();

  // first widget in the page view(promotion)
  double _currentPagePromotion = 0;

  // first widget in the page view(for you)
  double _currentPageForYou = 0;

  @override
  void initState() {
    super.initState();
    _pageControllerPromotion.addListener(() {
      setState(() {
        _currentPagePromotion = _pageControllerPromotion.page!;
      });
    });
    _pageControllerForYou.addListener(() {
      setState(() {
        _currentPagePromotion = _pageControllerForYou.page!;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageControllerPromotion.dispose();
    _pageControllerForYou.dispose();
  }

  // list of widgets that will go inside the page view (promotion)
  List<String> pageViewElemets = [
    "assets/images/saf_components/slide_get_extra.png",
    "assets/images/saf_components/slide_get_maps.png",
    "assets/images/saf_components/slide_power_hour.png",
    "assets/images/saf_components/slide_bonga.png",
  ];

  // list of widgets for the For You section
  List<String> forYouPageView = [
    "assets/images/saf_components/for_you_monthly.png",
    "assets/images/saf_components/for_you_tips.png",
    "assets/images/saf_components/for_you_wifi.png",
    "assets/images/saf_components/for_you_baze.png",
  ];

  // takes the pageViewElements and puts them in a pageView
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
                        print("${pageViewElemets[index]} was clicked");
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
            count: pageViewElemets.length,
            effect: const WormEffect(
                dotColor: Color(0xFF2E313E),
                activeDotColor: Color(0xFFFF0000),
                dotHeight: 7,
                dotWidth: 7),
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

  // hot deals SingleChildScrollView widget
  Widget hotDealsConstructor() {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Row(
            children: [
              hotDealsButton(
                  hotDealsImage: "hot_deal_1.png",
                  onPressedFunction: () {
                    print("hot_deal_1");
                  }),
              hotDealsButton(
                  hotDealsImage: "hot_deal_2.png",
                  onPressedFunction: () {
                    print("hot_deal_2");
                  }),
              hotDealsButton(
                  hotDealsImage: "hot_deal_3.png",
                  onPressedFunction: () {
                    print("hot_deal_3");
                  }),
              hotDealsButton(
                  hotDealsImage: "hot_deal_4.png",
                  onPressedFunction: () {
                    print("hot_deal_4");
                  }),
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: Colors.black,
          actions: [
            Builder(builder: (BuildContext context) {
              return actionButtons(context);
            })
          ],
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
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () {
                      print("Button Was pressed");
                    },
                    child: const Text(
                      "View My Balance",
                      style: TextStyle(color: Color(0xFF0AE500), fontSize: 15),
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
                mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                              currentPageController: _pageControllerPromotion,
                              pageViewElements: pageViewElemets,
                              containerHeight: 160,
                              containerWidth: 180),

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
          const Padding(
            padding: EdgeInsets.only(bottom: 10, left: 15, top: 10),
            child: Text(
              "Hot Deals",
              style: TextStyle(fontSize: 20),
            ),
          ),
          hotDealsConstructor(),

          // For you
          const Padding(
            padding: EdgeInsets.only(bottom: 5, left: 15, top: 15),
            child: Text(
              "For You",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: pageViewConstructor(
                currentPageController: _pageControllerForYou,
                pageViewElements: forYouPageView,
                containerHeight: 150,
                containerWidth: 410),
          )
        ]))
      ],
    );
  }
}

// handles the hot deals creation and function operation
Widget hotDealsButton(
    {required String hotDealsImage, required VoidCallback onPressedFunction}) {
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
            "assets/images/saf_components/$hotDealsImage",
            height: 120,
            width: 220,
            fit: BoxFit.cover,
          )),
    ),
  );
}

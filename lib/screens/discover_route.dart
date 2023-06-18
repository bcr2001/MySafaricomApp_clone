import 'package:flutter/material.dart';
import '../function_ops/reusable_widgets.dart';

class DiscoverRoute extends StatelessWidget {
  const DiscoverRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Discover",
          style: titleTextStyle,
        ),
        centerTitle: true,
        actions: [actionButtons(context)],
      ),
      body: const MyDiscoverBody(),
    );
  }
}

class MyDiscoverBody extends StatefulWidget {
  const MyDiscoverBody({super.key});

  @override
  State<MyDiscoverBody> createState() => _DiscoverBodyHandler();
}

class _DiscoverBodyHandler extends State<MyDiscoverBody> {
  PageController _discoverForYouController = PageController();
  double _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _discoverForYouController.addListener(() {
      setState(() {
        _currentPage = _discoverForYouController.page!;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _discoverForYouController.dispose();
  }

  // browse categories elemets builder
  Widget browseCategories(
      {required category,
      required Color categoryColor,
      required VoidCallback categoryFunction}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: categoryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
          onPressed: categoryFunction,
          child: Image.asset("assets/images/saf_components/$category",
              height: 120)),
    );
  }

  // section 2
  Widget mainRowCategory() {
    return
        // contains the two columns
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      // column 1
      Expanded(
        child: Column(
          children: [
            // Games
            browseCategories(
                category: "browse_games.png",
                categoryColor: const Color(0xFFFF3D00),
                categoryFunction: () => print("Games Category")),

            // News
            browseCategories(
                category: "browse_news.png",
                categoryColor: const Color(0xFF9C009C),
                categoryFunction: () => print("News Category")),

            // Jobs
            browseCategories(
                category: "browse_jobs.png",
                categoryColor: const Color(0xFFFFB800),
                categoryFunction: () => print("Job Category")),

            // Masoko
            browseCategories(
                category: "browse_masoko.png",
                categoryColor: const Color(0xFF009696),
                categoryFunction: () => print("Masoko Category")),
          ],
        ),
      ),

      // column 2
      Expanded(
        child: Column(
          children: [
            // Newspapers
            browseCategories(
                category: "browse_newspapers.png",
                categoryColor: const Color(0xFF0AE500),
                categoryFunction: () => print("Newspapers Category")),

            // Education
            browseCategories(
                category: "browse_education.png",
                categoryColor: const Color(0xFF173D9D),
                categoryFunction: () => print("Education Category")),

            // Baze TV
            browseCategories(
                category: "browse_baze.png",
                categoryColor: const Color(0xFFE70000),
                categoryFunction: () => print("Baze TV Category")),

            // Shops TV
            browseCategories(
                category: "browse_shops.png",
                categoryColor: const Color(0xFF3AB934),
                categoryFunction: () => print("Shops Category")),
          ],
        ),
      ),
    ]);
  }

  // section title constructor
  Widget sectionTitleConst({required String sectionName}) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 10, left: 8),
      child: Text(
        sectionName,
        style: sectionTitles,
      ),
    );
  }

  // single child scroll bonga deals
  Widget bongaDealsScrolling() {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Bella
            singleChildViewButton(
              buttonImage: "deal_bella.png", 
              onPressedFunction: ()=> print("Bella"),
              imageHeight:221, imageWidth:181),

            // Bonfire
            singleChildViewButton(
              buttonImage: "deal_bonfire.png", 
              onPressedFunction: ()=> print("Bonfire"),
              imageHeight:221, imageWidth:181),

            // Dominos
            singleChildViewButton(
              buttonImage: "deal_dominos.png", 
              onPressedFunction: ()=> print("Dominos"),
              imageHeight:221, imageWidth:181),

            // FullSend
            singleChildViewButton(
              buttonImage: "deal_fullsend.png", 
              onPressedFunction: ()=> print("FullSend"),
              imageHeight:221, imageWidth:181),

            // Miniso
            singleChildViewButton(
              buttonImage: "deal_miniso.png", 
              onPressedFunction: ()=> print("Miniso"),
              imageHeight:221, imageWidth:181),

            // Optica
            singleChildViewButton(
              buttonImage: "deal_optica.png", 
              onPressedFunction: ()=> print("Optica"),
              imageHeight:221, imageWidth:181),

            // Samsung
            singleChildViewButton(
              buttonImage: "deal_samsung.png", 
              onPressedFunction: ()=> print("Samsung"),
              imageHeight:221, imageWidth:181),

            // Travel
            singleChildViewButton(
              buttonImage: "deal_travel.png", 
              onPressedFunction: ()=> print("Travel"),
              imageHeight:221, imageWidth:181),
          ],
        ),
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(5.0),
      children: [
        // Section 1: Browse Category
        sectionTitleConst(sectionName: "Browse Categories"),

        // main Row that contains two column widgets
        mainRowCategory(),

        // Section 2: Bonga Deals
        sectionTitleConst(sectionName: "Bonga Deals"),

        // singleChildScroll view
        bongaDealsScrolling(),

        // Section 3: For You
        sectionTitleConst(sectionName: "For You"),
        Padding(
            padding: const EdgeInsets.only(left: 10, right: 15, bottom: 10),
            child: pageViewConstructor(
                currentPageController:_discoverForYouController,
                pageViewElements: forYouPageView,
                containerHeight: 150,
                containerWidth: 420),
          )
      ],
    );
  }
}
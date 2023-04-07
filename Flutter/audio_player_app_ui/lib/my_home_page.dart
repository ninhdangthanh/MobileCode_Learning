import 'dart:convert';
import 'dart:io';
import 'package:audio_player_app_ui/my_tab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './audio/app_colors.dart' as AppColors;

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  List? popularBooks;
  ScrollController? _scrollController;
  TabController? _tabController;

  Future<void> loadJsonData() async {
    final jsonString = await rootBundle.loadString('assets/popularBooks.json');
    final data = json.decode(jsonString);
    print('this is json: $data');
  }

  @override
  void initState() {
    super.initState();
    loadJsonData();

    _tabController = TabController(length: 3, vsync: this);
    _scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ImageIcon(AssetImage("assets/img/menu1.png"),
                        size: 24, color: Colors.black),
                    Row(
                      children: const [
                        Icon(Icons.search),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(Icons.notifications)
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Text(
                      "Popular Books",
                      style: TextStyle(fontSize: 30),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 180,
                child: Stack(
                  children: [
                    Positioned(
                        top: 0,
                        left: -20,
                        right: 0,
                        child: Container(
                          height: 180,
                          child: PageView.builder(
                              controller: PageController(viewportFraction: 0.8),
                              itemCount: 5,
                              itemBuilder: (_, i) {
                                return Container(
                                  height: 180,
                                  width: MediaQuery.of(context).size.width,
                                  margin: EdgeInsets.only(right: 10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      image: const DecorationImage(
                                          image: AssetImage(
                                              'assets/img/pic-8.png'),
                                          fit: BoxFit.fill)),
                                );
                              }),
                        ))
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                  child: NestedScrollView(
                controller: _scrollController,
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  return [
                    SliverAppBar(
                      pinned: true,
                      backgroundColor: AppColors.sliverBackground,
                      bottom: PreferredSize(
                        preferredSize: const Size.fromHeight(10),
                        child: Container(
                          margin: const EdgeInsets.only(left: 10, right: 10),
                          child: TabBar(
                            indicatorPadding: EdgeInsets.all(0),
                            indicatorSize: TabBarIndicatorSize.label,
                            labelPadding: EdgeInsets.only(),
                            controller: _tabController,
                            indicator: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      blurRadius: 7,
                                      offset: const Offset(0, 0))
                                ]),
                            tabs: [
                              AppTabs(color: AppColors.menu1Color, text: "New"),
                              AppTabs(
                                  color: AppColors.menu2Color, text: "Popular"),
                              AppTabs(
                                  color: AppColors.menu3Color,
                                  text: "Trending"),
                            ],
                          ),
                        ),
                      ),
                    )
                  ];
                },
                body: TabBarView(
                  controller: _tabController,
                  children: [
                    ListView.builder(
                        itemCount: 4,
                        itemBuilder: (_, i) {
                          return Container(
                            margin: const EdgeInsets.only(
                                left: 20, right: 20, top: 10, bottom: 10),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: AppColors.tabVarViewColor,
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 2,
                                        offset: const Offset(0, 0),
                                        color: Colors.grey.withOpacity(0.2))
                                  ]),
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 90,
                                      height: 120,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/img/pic-${i + 1}.png'))),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.star,
                                              color: AppColors.starColor,
                                              size: 24,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              "4.8",
                                              style: TextStyle(
                                                  color: AppColors.menu2Color),
                                            )
                                          ],
                                        ),
                                        Text(
                                          'THE WATER CURVE $i',
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontFamily: "Evenir",
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          'Martin $i Hyatt',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontFamily: "Evenir",
                                              color: AppColors.subTitleText),
                                        ),
                                        Container(
                                          width: 50,
                                          height: 20,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: AppColors.loveColor,
                                          ),
                                          alignment: Alignment.center,
                                          child: const Text(
                                            "Love",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                    const Material(
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.grey,
                        ),
                        title: Text("Content"),
                      ),
                    ),
                    const Material(
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.grey,
                        ),
                        title: Text("Content"),
                      ),
                    ),
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: duplicate_ignore
// ignore: duplicate_ignore
// ignore: file_names
// ignore: file_names
// ignore_for_file: file_names

import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:shop/pages/homePage/components/dropdown.dart';
import 'package:shop/pages/homePage/components/tabwidget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  void dispose() {
    _tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: const Text(
            'Search Products',
            style: TextStyle(fontSize: 25, color: Colors.black),
          ),
          // ignore: prefer_const_literals_to_create_immutables
          actions: [
            const BuildDropDownButton(
              item1: 'Profile',
              item2: 'Settings',
              item3: 'Logout',
              sortby: false,
            ),
          ],
          bottom: PreferredSize(
            preferredSize: const Size(double.infinity, 120),
            child: Padding(
              padding: const EdgeInsets.only(left: 13.0),
              child: Column(
                children: [
                  Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: TextField(
                        decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.search_sharp,
                                color: Colors.grey, size: 25),
                            hintText: 'Try "Yeezy Boost 700"',
                            filled: true,
                            focusedBorder: OutlineInputBorder(
                              gapPadding: 3,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide.none),
                            fillColor: Colors.grey.withOpacity(0.2)),
                      )),
                  const SizedBox(height: 10),
                  ButtonsTabBar(
                      unselectedBackgroundColor: Colors.grey.withOpacity(0.2),
                      unselectedLabelStyle: const TextStyle(color: Colors.grey),
                      labelStyle: TextStyle(color: Colors.white, fontSize: 15),
                      controller: _tabController,
                      contentPadding: EdgeInsets.only(left: 20, right: 20),
                      radius: 10,
                      backgroundColor: Colors.black,
                      tabs: const [
                        Tab(
                          text: 'new in',
                        ),
                        Tab(text: 'clothing'),
                        Tab(text: 'shoes'),
                        Tab(
                          text: 'accessories',
                        ),
                      ]),
                ],
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 17.0),
          child: TabBarView(
            controller: _tabController,
            children: [
              const TabWidget(),
              const Icon(Icons.ac_unit),
              const Icon(Icons.play_arrow),
              const Icon(Icons.pause_circle)
            ],
          ),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:shop/pages/homePage/components/SecondContainer.dart';
import 'package:shop/pages/homePage/components/cardWidget.dart';
import 'package:shop/pages/homePage/components/dropdown.dart';

class TabWidget extends StatelessWidget {
  const TabWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const Text(
                  'Most Popular',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                const BuildDropDownButton(
                  item1: 'Latest',
                  item2: 'Old',
                  item3: 'Highest Price',
                  sortby: true,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 280,
            color: Colors.transparent,
            child: CustomScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                slivers: [
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        ...List.generate(
                          6,
                          (index) => CardWidget(
                            price: 5.256,
                            title: 'Air Jordan 1\nTravis Scott OG',
                            image: 'assets/airjordan.png',
                            index: index,
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const Text(
                  'New Releases',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                const BuildDropDownButton(
                  item1: 'Latest',
                  item2: 'Old',
                  item3: 'Highest Price',
                  sortby: true,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 120,
            child: CustomScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                slivers: [
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        ...List.generate(
                          6,
                          (index) => const SecondContainer(
                              image: 'assets/airjordan.png'),
                        ),
                      ],
                    ),
                  ),
                ]),
          ),
        ],
      ),
    );
  }
}

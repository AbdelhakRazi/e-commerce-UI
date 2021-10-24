import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shop/assets/assets.dart';
import 'package:shop/pages/homePage/components/dropdown.dart';

class DetailPage extends StatefulWidget {
  final int? index;
  DetailPage({Key? key, this.index}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  int? selectedindex;
  int? currentpage = 0;
  Color? color = Colors.black;
  @override
  PageController _pageController = PageController(
    initialPage: 0,
  );

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 2), (Timer timer) {
      if (currentpage! < 2) {
        currentpage = currentpage! + 1;
      } else {
        currentpage = 0;
      }

      _pageController.animateToPage(
        currentpage!,
        duration: Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios, size: 25, color: Colors.black),
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
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  flex: 2,
                  child: Hero(
                    tag: 'title${widget.index}',
                    child: Material(
                      color: Colors.transparent,
                      child: const Text(
                        "Air Jordan 1\nTravis Scott OG",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: PageView.builder(
                      onPageChanged: (index) {
                        setState(() {
                          currentpage = index;
                        });
                      },
                      itemCount: 3,
                      controller: _pageController,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Hero(
                          tag: 'image${index + 1}',
                          child: Image.asset(
                            'assets/${index + 1}.png',
                            fit: BoxFit.cover,
                          ),
                        );
                      }),
                ),
                Expanded(
                  child: buildAnimatedRow(),
                ),
                Flexible(
                  child: const Text(
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry"s standard dummy text ever since the 1500s',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Flexible(
                  flex: 1,
                  child: Hero(
                    tag: 'price${widget.index}',
                    child: const Material(
                      color: Colors.transparent,
                      child: Text('5.256 €',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 20),
                    child: buildButtonrow(context),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row buildAnimatedRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedContainer(
          duration: Duration(milliseconds: 500),
          width: currentpage == 0 ? 50 : 30,
          height: 10,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: currentpage == 0
                ? Colors.teal[400]
                : Colors.black.withOpacity(0.7),
          ),
        ),
        const SizedBox(width: 5),
        AnimatedContainer(
          duration: Duration(milliseconds: 500),
          width: currentpage == 1 ? 50 : 20,
          height: 10,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: currentpage == 1
                ? Colors.teal[400]
                : Colors.black.withOpacity(0.7),
          ),
        ),
        const SizedBox(width: 5),
        AnimatedContainer(
          duration: Duration(milliseconds: 500),
          width: currentpage == 2 ? 50 : 20,
          height: 10,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: currentpage == 2
                ? Colors.teal[400]
                : Colors.black.withOpacity(0.7),
          ),
        ),
      ],
    );
  }

  Row buildButtonrow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: IconButton(
            icon: Icon(
              Icons.favorite,
              color: color,
            ),
            onPressed: () {
              setState(() {
                if (color == Colors.red) {
                  color = Colors.black;
                } else {
                  color = Colors.red;
                }
              });
            },
          ),
        ),
        Expanded(
          flex: 9,
          child: ElevatedButton(
            style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                )),
                fixedSize:
                    MaterialStateProperty.all<Size>(Size(double.infinity, 50)),
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.black)),
            child: const Text(
              "BUY NOW",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              buildBottomSheet(context);
            },
          ),
        ),
      ],
    );
  }

  Future<dynamic> buildBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      elevation: 3.0,
      backgroundColor: Colors.black,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40))),
      builder: (context) => StatefulBuilder(
        builder: (context, StateSetter setState) => Padding(
          padding: const EdgeInsets.only(
            left: 20.0,
            right: 20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              const Text(
                'Size',
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              Container(
                height: 200,
                child: GridView.builder(
                    itemCount: 8,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                      childAspectRatio: 1.2,
                    ),
                    itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedindex = index;
                            });
                          },
                          child: Container(
                            child: Center(
                              child: Text(
                                Assets.list[index],
                                style: TextStyle(
                                    fontSize: 18,
                                    color: selectedindex == index
                                        ? Colors.black
                                        : Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            decoration: BoxDecoration(
                                color: selectedindex == index
                                    ? Colors.white
                                    : null,
                                border: selectedindex != index
                                    ? Border.all(width: 2, color: Colors.white)
                                    : null,
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        )),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all<Size>(
                        Size(double.infinity, 60)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    )),
                    // fixedSize:
                    //MaterialStateProperty.all<Size>(
                    //  Size(, 60)),

                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.white)),
                child: const Text(
                  "ADD TO CART",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

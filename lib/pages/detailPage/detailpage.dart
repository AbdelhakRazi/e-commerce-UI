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

  Color? color = Colors.black;

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Hero(
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
              const SizedBox(height: 30),
              AspectRatio(
                  aspectRatio: 1.5,
                  child: Hero(
                    tag: 'image${widget.index}',
                    child: Image.asset(
                      'assets/airjordan.png',
                      fit: BoxFit.fill,
                    ),
                  )),
              const SizedBox(height: 30),
              const Text(
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry"s standard dummy text ever since the 1500s',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Hero(
                tag: 'price${widget.index}',
                child: const Material(
                  color: Colors.transparent,
                  child: Text('5.256 Do',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 20),
                child: Row(
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
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            )),
                            fixedSize: MaterialStateProperty.all<Size>(
                                Size(double.infinity, 50)),
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.black)),
                        child: const Text(
                          "BUY NOW",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {
                          buildBottomSheet(context);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
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

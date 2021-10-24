// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:shop/pages/detailPage/detailpage.dart';

class CardWidget extends StatelessWidget {
  final String? image;
  final String? title;
  final double? price;
  final int? index;
  const CardWidget({Key? key, this.image, this.price, this.title, this.index})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      margin: const EdgeInsets.only(right: 25),
      padding: const EdgeInsets.only(left: 13.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey.withOpacity(0.2),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Hero(
            tag: 'title$index',
            child: Text(
              title!,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 30),
          AspectRatio(
              aspectRatio: 1.7,
              child: Hero(
                tag: 'image$index',
                child: Image.asset(
                  image!,
                  fit: BoxFit.fill,
                ),
              )),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Hero(
                tag: 'price$index',
                child: Text('${price!} Do',
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
              ),
              Container(
                decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(20),
                        topLeft: Radius.circular(20))),
                child: IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailPage(index: index)));
                    },
                    icon: const Icon(
                      Icons.arrow_forward_ios,
                      size: 25,
                      color: Colors.white,
                    )),
              )
            ],
          )
        ],
      ),
    );
  }
}

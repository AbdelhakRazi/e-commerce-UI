import 'package:flutter/material.dart';

class BuildDropDownButton extends StatelessWidget {
  final String? item1;
  final String? item2;
  final String? item3;
  final bool? sortby;
  const BuildDropDownButton(
      {Key? key, this.item1, this.item2, this.item3, this.sortby})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
        alignment: Alignment.centerRight,
        isDense: true,
        hint: sortby!
            ? const Text(
                'Sort by',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              )
            : null,
        dropdownColor: Colors.black.withOpacity(0.9),
        items: [
          DropdownMenuItem(
              child: Text(
                item1!,
                style: TextStyle(color: Colors.white),
              ),
              value: item1!),
          DropdownMenuItem(
              child: Text(item2!, style: TextStyle(color: Colors.white)),
              value: item2!),
          DropdownMenuItem(
              child: Text(item3!, style: TextStyle(color: Colors.white)),
              value: item3!),
        ],
        onChanged: (value) {},
        icon: Icon(Icons.more_vert_rounded, color: Colors.black, size: 25),
      ),
    );
  }
}

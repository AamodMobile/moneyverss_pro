import 'package:fiinzy_pro/constants/constants.dart';
import 'package:fiinzy_pro/controller/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

class FABBottomAppBarItem {
  final String iconData;
  final String text;
  final DashboardController controller;
  FABBottomAppBarItem({Key? key, required this.iconData, required this.text, required this.controller});
}

class FABBottomAppBar extends StatefulWidget {
  final List<FABBottomAppBarItem>? items;
  final String? centerItemText;
  final double? height;
  final double? iconSize;
  final Color? backgroundColor;
  final Color? color;
  final Color? selectedColor;
  final NotchedShape? notchedShape;

  FABBottomAppBar({
    Key? key,
    this.items,
    this.centerItemText,
    this.height= 42.0,
    this.iconSize= 20.0,
    this.backgroundColor,
    this.color,
    this.selectedColor,
    this.notchedShape,
  })
      : super(key: key) {
    assert(this.items!.length == 2 || this.items!.length == 4);
  }

  @override
  State<StatefulWidget> createState() => FABBottomAppBarState();
}

class FABBottomAppBarState extends State<FABBottomAppBar> {

  _updateIndex(int index) {
    setState(() {
      widget.items![0].controller.selectedIndex.value = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> items = List.generate(widget.items!.length, (int index) {
      return Obx(() => _buildTabItem(
        item: widget.items![index],
        index: index,
        onPressed: _updateIndex,
      ));
    });
    items.insert(items.length >> 1, _buildMiddleTabItem());

    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      surfaceTintColor: widget.backgroundColor,
      shadowColor: Colors.black,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: items,
      ),
      padding: EdgeInsets.all(0),
    );
  }

  Widget _buildMiddleTabItem() {
    return Expanded(
      child: SizedBox(
        height: widget.height,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: widget.iconSize),
            Text(
              widget.centerItemText ?? '',
              style: TextStyle(color: widget.color),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabItem({
    FABBottomAppBarItem? item,
    int? index,
    ValueChanged<int>? onPressed,
  }) {
    Color? color = widget.items![0].controller.selectedIndex.value == index ? widget.selectedColor : widget.color;
    return Expanded(
      child: SizedBox(
        height: widget.height,
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: () => onPressed!(index!),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(item!.iconData, color: color, height: widget.iconSize, fit: BoxFit.contain,),
                Text(
                  item.text,
                  style: TextStyle(color: color, fontSize: 12),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
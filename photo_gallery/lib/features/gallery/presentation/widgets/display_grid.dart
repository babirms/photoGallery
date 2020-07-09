import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:photo_gallery/features/image/domain/entities/image.dart'
    as imageEntity;

class DisplayGrid extends StatefulWidget {
  final List<imageEntity.Image> imageList;

  const DisplayGrid({Key key, @required this.imageList}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _DisplayGridState();
  }
}

class _DisplayGridState extends State<DisplayGrid> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: GridView.count(
          //shrinkWrap: true,
          childAspectRatio: 1.0,
          padding: EdgeInsets.only(left: 16, right: 16),
          crossAxisCount: 2,
          crossAxisSpacing: 18,
          mainAxisSpacing: 18,
          children: widget.imageList.map((data) {
            return Container(
              decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(10)),
              child: Image.network(
                data.path,
                fit: BoxFit.fitWidth,
              ),
            );
          }).toList()),
    );
  }
}

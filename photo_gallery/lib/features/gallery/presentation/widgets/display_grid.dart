import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:photo_gallery/features/gallery/presentation/widgets/single_view.dart';
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
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: GridView.count(
        childAspectRatio: 1.0,
        padding: EdgeInsets.only(left: 16, right: 16, top: 20, bottom: 20),
        crossAxisCount: 2,
        crossAxisSpacing: 18,
        mainAxisSpacing: 18,
        children: widget.imageList.map(
          (data) {
            counter++;
            return GestureDetector(
              onTap: () => {
                Navigator.of(context).push(
                  CupertinoPageRoute(
                    builder: (context) =>
                        SingleView(path: data.path, ref: counter),
                  ),
                ),
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  data.path,
                  fit: BoxFit.fitWidth,
                ),
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}

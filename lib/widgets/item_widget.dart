import 'package:flutter/material.dart';

import '../presentation/color_manager.dart';
import 'loading_container.dart';
import '../models/items.dart';

class ItemsWidget extends StatefulWidget {
  Items? itemModel;
  BuildContext? context;
  bool? netValue;
  ItemsWidget({Key? key, this.itemModel, this.context, this.netValue})
      : super(key: key);

  @override
  State<ItemsWidget> createState() => _ItemsWidgetState();
}

class _ItemsWidgetState extends State<ItemsWidget> {
  bool isLoading = false;
  int count = 0;
  @override
  Widget build(BuildContext context) {
    //String address = widget.itemModel!.address.toString();
    // for (int i = 0; i < address.length; i++) {
    //   if (address[i] == ',') {
    //     count++;
    //   }
    // }

    //var _splitAdrress = address.split(",")[1];
    //var _splitAdrress2 = address.split(",")[2];
    print("itemImage = ${widget.itemModel!.itemImageUrl} + LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL");
    return Padding(
      padding: EdgeInsets.only(top: 10, left: 15, right: 15),
      child: InkWell(
        // height: MediaQuery.of(context).size.height * 0.4,
        // width: MediaQuery.of(context).size.width,
        splashColor: Colors.red,
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child:
                  widget.itemModel!.itemImageUrl == null
                      ? Container(
                          color: ColorManager.purple1,
                          height: MediaQuery.of(context).size.height * 0.3,
                          width: MediaQuery.of(context).size.width,
                          child: const Center(
                              child: Text(
                            "Image not found", /*style: TextStyle(height: ),*/
                          )))
                      : /*widget.netValue == false
                          ? LoadingContainer()
                          : */Image.network(
                              widget.itemModel!.itemImageUrl!,
                              height: MediaQuery.of(context).size.height * 0.3,
                              width: MediaQuery.of(context).size.width,
                              fit: BoxFit.fill,
                              loadingBuilder: (BuildContext context,
                                  Widget child,
                                  ImageChunkEvent? loadingProgress) {
                                if (loadingProgress == null) return child;
                                return Center(
                                  child: /*CircularProgressIndicator*/ LoadingContainer(
                                    value: loadingProgress.expectedTotalBytes !=
                                            null
                                        ? loadingProgress
                                                .cumulativeBytesLoaded /
                                            loadingProgress.expectedTotalBytes!
                                        : null,
                                  ),
                                );
                              },
                            ),
            ),
            Text("${widget.itemModel!.itemTitle}", style: TextStyle(fontSize: 20),),
            Text("${widget.itemModel!.description}", style: TextStyle(fontSize: 18), maxLines: 2,)
           /* Padding(
              padding: const EdgeInsets.only(bottom: 0, top: 8),
              child: widget.itemModel!.itemTitle == null
                  ? const Text(
                      "Name not found",
                    )
                  : Text(
                      widget.itemModel!.itemTitle!,
                      style: TextStyle(fontSize: 20),
                    ),
            ),*/
          ],
        ),
      ),
    );
  }
}

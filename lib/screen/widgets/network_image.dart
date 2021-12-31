import 'package:assignment/app_utils/app_images.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

//Network Image Widget
class NetworkImageCustom extends StatefulWidget {
  final String imageUrl;
  const NetworkImageCustom({Key key, this.imageUrl}) : super(key: key);

  @override
  _NetworkImageCustomState createState() => _NetworkImageCustomState();
}

class _NetworkImageCustomState extends State<NetworkImageCustom> {
  final String noUrl = "";
  @override
  Widget build(BuildContext context) {
    return (widget.imageUrl != null && widget.imageUrl != "")
        ? Container(
            height: 70.0,
            width: 80.0,
            alignment: Alignment.center,
            child: CachedNetworkImage(
              imageUrl: widget.imageUrl ?? "",
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          )
        : Container(
            height: 70.0,
            width: 80.0,
            alignment: Alignment.center,
            child: Image.asset(
              AppImages.personPlaceHolder,
              fit: BoxFit.cover,
            ),
          );
  }
}

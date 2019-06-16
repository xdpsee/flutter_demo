import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:drip/model/post/post.dart';
import 'package:drip/model/post/post_content_mixed.dart' as pri;
import 'package:drip/widgets/post_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/widgets.dart' as prefix0;

class PostWidget extends StatelessWidget {
  final Post post;

  const PostWidget({Key key, @required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<pri.Image> images = PostUtils.images(post);

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      margin: EdgeInsets.only(top: 4, bottom: 4),
      child: Padding(
        padding: EdgeInsets.all(4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildHeaderSection(),
            SizedBox(
              height: 100,
              width: double.infinity,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Text(
                          post.title,
                          maxLines: 3,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 14),
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                  _buildImageWidget(images[0]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        CircleAvatar(
          backgroundImage: CachedNetworkImageProvider(post.author.avatar),
        ),
        Padding(
          padding: EdgeInsets.only(left: 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post.author.username,
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                '优秀内容发布达人',
                style: TextStyle(fontSize: 10, color: Colors.black54),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildImageWidget(pri.Image image) {
    return CachedNetworkImage(
      imageUrl: image.url,
      width: window.physicalSize.width / 3 / window.devicePixelRatio,
    );
  }

  List<Widget> _buildImageWidgets(List<pri.Image> images) {
    return images
        .map((image) => CachedNetworkImage(
              imageUrl: image.url,
              width: 200,
              height: 200,
            ))
        .toList(growable: false);
  }
}

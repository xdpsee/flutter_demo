import 'package:drip/model/post/post.dart';
import 'package:drip/model/post/post_content_mixed.dart';

class PostUtils {
  static int imageCount(Post post) {
    int count = 0;
    if (post.content.mixed != null && post.content.mixed.items.isNotEmpty) {
      post.content.mixed.items.forEach((item) {
        if (item.type == 2) {
          count++;
        }
      });
    }

    return count;
  }

  static List<Image> images(Post post) {
    List<Image> images = List();

    if (post.content.mixed != null && post.content.mixed.items.isNotEmpty) {
      post.content.mixed.items.forEach((item) {
        if (item.type == 2) {
          images.add(item);
        }
      });
    }

    return images;
  }
}

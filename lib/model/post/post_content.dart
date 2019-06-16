import 'package:drip/model/post/post_content_html.dart';
import 'package:drip/model/post/post_content_mixed.dart';

class PostContent {
  /// html
  HtmlContent html;
  /// complex content
  MixedContent mixed;

  PostContent.fromJson(Map<String, dynamic> json) {
    if (json.containsKey('html')) {
      this.html = HtmlContent.fromJson(json['html']);
    }

    if (json.containsKey('mixed')) {
      this.mixed = MixedContent.fromJson(json['mixed']);
    }
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = Map();
    json['html'] = this.html?.toJson();
    json['mixed'] = this.mixed?.toJson();
    return json;
  }
}

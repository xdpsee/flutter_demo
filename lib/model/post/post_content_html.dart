
class HtmlContent {

  String text;

  HtmlContent.fromJson(Map<String, dynamic> json) {
    this.text = json['text'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = Map();
    json['text'] = text;
    return json;
  }

}
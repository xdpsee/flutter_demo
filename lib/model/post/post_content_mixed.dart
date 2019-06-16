/// mixed post content
class MixedContent {
  List<MixedItem> items = List();

  MixedContent.fromJson(Map<String, dynamic> json) {
    List items = json['items'];
    items.forEach((itemJson) {
      int type = itemJson['type'];
      switch (type) {
        case 1:
          this.items.add(Text(itemJson['text']));
          break;
        case 2:
          this
              .items
              .add(Image(itemJson['url'], Dimens.fromJson(itemJson['dimens'])));
          break;
        case 3:
          this.items.add(Audio(itemJson['url'], itemJson['duration']));
          break;
        case 4:
          {
            Map<String, dynamic> jsonPreview = itemJson['preview'];
            this.items.add(Video(
                jsonPreview != null
                    ? Image(
                        jsonPreview['url'], Dimens.fromJson(itemJson['dimens']))
                    : null,
                itemJson['url'],
                Dimens.fromJson(itemJson['dimens']),
                itemJson['duration']));
          }
          break;
        default:
          throw Exception('invalid MixedContent');
          break;
      }
    });
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = Map();
    json['items'] = this.items.map((e) => e.toJson()).toList(growable: false);
    return json;
  }
}

abstract class MixedItem {
  final int type;

  MixedItem(this.type);

  Map<String, dynamic> toJson();
}

class Dimens {
  int width;
  int height;

  Dimens.fromJson(Map<String, dynamic> json) {
    this.width = json['width'];
    this.height = json['height'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = Map();
    json['width'] = width;
    json['height'] = height;
    return json;
  }
}

class Text extends MixedItem {
  final String text;

  Text(this.text) : super(1);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = Map();
    json['type'] = type;
    json['text'] = text;
    return json;
  }
}

class Image extends MixedItem {
  final String url;
  final Dimens dimens;

  Image(this.url, this.dimens) : super(2);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = Map();
    json['type'] = type;
    json['url'] = url;
    json['dimens'] = dimens?.toJson();
    return json;
  }
}

class Audio extends MixedItem {
  final String url;
  final int duration;

  Audio(this.url, this.duration) : super(3);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = Map();
    json['type'] = type;
    json['url'] = url;
    json['duration'] = duration;
    return json;
  }
}

class Video extends MixedItem {
  final Image preview;
  final String url;
  final Dimens dimens;
  final int duration;

  Video(this.preview, this.url, this.dimens, this.duration) : super(4);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = Map();
    json['type'] = type;
    json['preview'] = preview?.toJson();
    json['url'] = url;
    json['dimens'] = dimens?.toJson();
    json['duration'] = duration;
    return json;
  }
}

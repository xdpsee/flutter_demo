import 'package:drip/model/post/post.dart';

abstract class PostState {
  final int timestamp = DateTime.now().millisecondsSinceEpoch;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is PostNoMore &&
              runtimeType == other.runtimeType &&
              timestamp == other.timestamp;

  @override
  int get hashCode => timestamp.hashCode;
}

class PostUninitialized extends PostState {
  @override
  String toString() => 'PostUninitialized';
}

class PostError extends PostState {
  @override
  String toString() => 'PostError';
}

class PostNoMore extends PostState {
  @override
  String toString() => 'PostNoMore';
}

class PostLoaded extends PostState {
  final int start;
  final int limit;
  final List<Post> posts;

  PostLoaded({
    this.start,
    this.limit,
    this.posts,
  });

  @override
  String toString() => 'PostLoaded { posts: ${posts.length} }';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PostLoaded &&
          runtimeType == other.runtimeType &&
          start == other.start &&
          limit == other.limit &&
          posts == other.posts &&
          timestamp == other.timestamp;

  @override
  int get hashCode =>
      start.hashCode ^ limit.hashCode ^ posts.hashCode ^ timestamp.hashCode;
}

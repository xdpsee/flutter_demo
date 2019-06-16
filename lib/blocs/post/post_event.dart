import 'package:equatable/equatable.dart';

abstract class PostEvent extends Equatable {
  PostEvent(List props) : super(props);
}

class Fetch extends PostEvent {

  final int start;
  final int limit;

  Fetch(this.start, this.limit) : super([start, limit]);

  @override
  String toString() => 'Fetch';
}



import 'package:equatable/equatable.dart';

abstract class LandingEvent extends Equatable {
  final int activePage;

  LandingEvent(this.activePage);
}

class LandingInitialize extends LandingEvent {
  LandingInitialize() : super(-1);
}

class LandingSwitchPage extends LandingEvent {
  LandingSwitchPage(int activePage) : super(activePage);
}


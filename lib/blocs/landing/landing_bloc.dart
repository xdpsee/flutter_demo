import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'landing_event.dart';
import 'landing_state.dart';

class LandingBloc extends Bloc<LandingEvent, LandingState> {
  @override
  Stream<LandingState> mapEventToState(LandingEvent event) async* {
    if (event is LandingInitialize) {
      int c = await _loadCurrentPage();
      yield LandingStatePageActivated(c);
    } else {
      _saveCurrentPage(event.activePage);
      yield LandingStatePageActivated(event.activePage);
    }
  }

  @override
  LandingState get initialState => LandingStateUninitialized();

  Future<int> _loadCurrentPage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt('_currentPage') ?? 0;
  }

  Future _saveCurrentPage(page) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setInt('_currentPage', page);
  }
}

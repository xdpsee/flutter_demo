import 'package:drip/blocs/landing/landing_bloc.dart';
import 'package:drip/blocs/landing/landing_event.dart';
import 'package:drip/blocs/landing/landing_state.dart';
import 'package:drip/pages/post_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_page.dart';

class LandingPage extends StatefulWidget {
  LandingPage({Key key}) : super(key: key);

  @override
  State createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final List<Widget> _pages = [
    PostPage(),
    HomeScreen(),
    HomeScreen(),
    HomeScreen()
  ];

  final LandingBloc _bloc = LandingBloc();

  @override
  void initState() {
    super.initState();

    ///
    _bloc.dispatch(LandingInitialize());
  }

  @override
  void dispose() {
    _bloc.dispose();

    ///
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: _bloc,
      builder: (BuildContext context, LandingState state) {
        if (state is LandingStateUninitialized) {
          return _loadingIndicator();
        } else if (state is LandingStatePageActivated) {
          return Scaffold(
            bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.white,
                selectedLabelStyle: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w500,
                    fontSize: 12.0),
                selectedIconTheme: IconThemeData(color: Colors.blue),
                unselectedIconTheme: IconThemeData(color: Colors.black26),
                currentIndex: state.currentPage,
                onTap: (int index) {
                  _bloc.dispatch(LandingSwitchPage(index));
                },
                items: state.navigationBarItems),
            body: _pages[state.currentPage],
          );
        }
      },
    );
  }

  Widget _loadingIndicator() {
    return Container(
      child: Center(
        child: CircularProgressIndicator(
          strokeWidth: 1,
          backgroundColor: Colors.grey,
        ),
      ),
    );
  }
}

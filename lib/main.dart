import 'package:bloc/bloc.dart';
import 'package:drip/comm/bloc_delegate.dart';
import 'package:drip/pages/landing_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/landing/landing_bloc.dart';

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dripping',
      home: BlocProvider(
        bloc: LandingBloc(),
        child: LandingPage(),
      ),
      theme: ThemeData(primaryColor: Colors.blue),
    );
  }
}


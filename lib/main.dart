import 'package:blockpattern/service/beerservice.dart';
import 'package:blockpattern/view/beer_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RepositoryProvider(
        create: (context) => BeerService(),
        child: MyWidget(),
      ),
      
    );
  }
}

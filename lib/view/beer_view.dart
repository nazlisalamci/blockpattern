import 'package:blockpattern/bloc/beer_listing_events.dart';
import 'package:blockpattern/bloc/beer_listing_states.dart';
import 'package:blockpattern/bloc/beer_listining_bloc.dart';
import 'package:blockpattern/model/beer.dart';
import 'package:blockpattern/service/beerservice.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => BeerBloc(
              RepositoryProvider.of<BeerService>(context),
            )..add(BeerLoadEvent()),
        child: Scaffold(
          appBar: AppBar(
            title: Text("The Beer App"),
          ),
          body: BlocBuilder<BeerBloc, BeerListingState>(
            builder: (context, state) {
              if (state is BeerLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is BeerLoadedState) {
                print("loaded state");
                print(state.beer.name);
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        color: Colors.purple,
                        child: Text(
                          state.beer.id,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black, fontSize: 20.0),
                        ),
                      ),
                      Container(
                        color: Colors.amber,
                        child: Text(
                          state.beer.name,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            BlocProvider.of<BeerBloc>(context)
                                .add(BeerLoadEvent());
                          },
                          child: const Text("Load new Beer"))
                    ],
                  ),
                );
              }
              if (state is BeerErrorState) {
                return Center(
                  child: Text(state.error.toString()),
                );
              }
              return Container();
            },
          ),
        ));
  }
}

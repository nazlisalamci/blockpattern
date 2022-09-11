import 'package:blockpattern/bloc/beer_listing_events.dart';
import 'package:blockpattern/bloc/beer_listing_states.dart';
import 'package:blockpattern/service/beerservice.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BeerBloc extends Bloc<BeerListingEvent, BeerListingState> {
  final BeerService _beerService;

  BeerBloc(this._beerService) : super(BeerLoadingState()) {
    on<BeerLoadEvent>((event, emit) async {
      emit(BeerLoadingState());
      try {
        final beer = await _beerService.getBeer();
        emit(BeerLoadedState(beer));
      } catch (e) {
        emit(BeerErrorState(e.toString()));
      }
    });
  }
}

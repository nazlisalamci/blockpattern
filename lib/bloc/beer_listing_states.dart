import 'package:blockpattern/model/beer.dart';
import 'package:equatable/equatable.dart';

abstract class BeerListingState extends Equatable {}

class BeerLoadingState extends BeerListingState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class BeerLoadedState extends BeerListingState {
  final Beer beer;
  BeerLoadedState(this.beer);
  @override
  // TODO: implement props
  List<Object?> get props => [beer];
}

class BeerErrorState extends BeerListingState {
  final String error;

  BeerErrorState(this.error);
  @override
  // TODO: implement props
  List<Object?> get props => [error];
}

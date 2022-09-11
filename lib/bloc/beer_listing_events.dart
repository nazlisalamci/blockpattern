import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

 @immutable
abstract class BeerListingEvent extends Equatable {
  const BeerListingEvent();
}
class BeerLoadEvent extends BeerListingEvent{
  @override
  // TODO: implement props
  List<Object?> get props =>[];

}

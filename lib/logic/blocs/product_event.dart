part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadProducts extends ProductEvent {
  final int page;

  LoadProducts({required this.page});

  @override
  List<Object> get props => [page];
}

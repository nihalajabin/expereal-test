import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/cart.dart';
import '../../models/product.dart';
part 'cart_bloc_event.dart';
part 'cart_bloc_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartLoading());

  @override
  Stream<CartState> mapEventToState(CartEvent event) async* {
    if (event is CartStarted) {
      yield* _mapCartStartedToState();
    } else if (event is AddProduct) {
      yield* _mapAddProductToState(event, state);
    } else if (event is RemoveProduct) {
      yield* _mapRemoveProductToState(event, state);
    }
  }

  Stream<CartState> _mapAddProductToState(
      AddProduct event, CartState state) async* {
    if (state is CartLoaded) {
      try {
        yield CartLoaded(
          cart: Cart(
            products: state.cart.products! + [event.product],
          ),
        );
      } catch (_) {}
    }
  }

  Stream<CartState> _mapCartStartedToState() async* {
    yield CartLoading();
    try {
      yield CartLoaded(cart: Cart());
    } catch (_) {}
  }
}

Stream<CartState> _mapRemoveProductToState(
    RemoveProduct event, CartState state) async* {
  if (state is CartLoaded) {
    try {
      yield CartLoaded(
        cart: Cart(
          products: state.cart.products?..remove(event.product),
        ),
      );
    } catch (_) {}
  }
}

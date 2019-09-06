import 'package:kosta/models/cart.dart';
import 'package:kosta/models/product.dart';

class CartRepository {
  List<Product> productItemsList = [];
  Cart productItems = Cart(products: []);
  addToList(Product item) {
    bool isPresent = false;

    if (productItemsList.length > 0) {
      for (int i = 0; i < productItemsList.length; i++) {
        if (productItemsList[i].id == item.id) {
          increaseItemQuantity(item);
          isPresent = true;
          break;
        } else {
          isPresent = false;
        }
      }

      if (!isPresent) {
        productItemsList.add(item);
      }
    } else {
      productItemsList.add(item);
    }

    return item;
  }

  removeFromList(Product item) {
    if (item.quantity > 1) {
      decreaseItemQuantity(item);
    } else {
      productItemsList.remove(item);
    }
    return productItemsList;
  }

  void increaseItemQuantity(Product item) => item.incrementQuantity();
  void decreaseItemQuantity(Product item) => item.decrementQuantity();
}

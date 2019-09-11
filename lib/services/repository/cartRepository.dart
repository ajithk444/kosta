import 'package:kosta/models/cart.dart';
import 'package:kosta/models/product.dart';

class CartRepository {
  List<Product> productList = [];
  Cart productItems = Cart(products: []);
  addToList(Product item) {
    bool isPresent = false;

    if (productList.length > 0) {
      for (int i = 0; i < productList.length; i++) {
        if (productList[i].id == item.id) {
          increaseItemQuantity(item);
          isPresent = true;
          break;
        } else {
          isPresent = false;
        }
      }

      if (!isPresent) {
        productList.add(item);
      }
    } else {
      productList.add(item);
    }

    return item;
  }

  removeFromList(Product item) {
    if (item.quantity > 1) {
      decreaseItemQuantity(item);
    } else {
      productList.remove(item);
    }
    return productList;
  }

  void increaseItemQuantity(Product item) => item.incrementQuantity();
  void decreaseItemQuantity(Product item) => item.decrementQuantity();
}

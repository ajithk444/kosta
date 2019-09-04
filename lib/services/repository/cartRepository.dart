import 'package:kosta/models/productItem.dart';

class CartRepository {
  List<ProductItem> productItemsList = [];

  addToList(ProductItem item) {
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

  removeFromList(ProductItem item) {
    if (item.quantity > 1) {
      decreaseItemQuantity(item);
    } else {
      productItemsList.remove(item);
    }
    return productItemsList;
  }

  void increaseItemQuantity(ProductItem item) => item.incrementQuantity();
  void decreaseItemQuantity(ProductItem item) => item.decrementQuantity();
}

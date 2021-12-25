import 'package:flutter/foundation.dart';
import '../Car_Item_list.dart';

class CartProvider extends ChangeNotifier {
  List<FoodItem> foodItems = [];

  void addToList(FoodItem foodItem) {
    foodItems.add(foodItem);
    notifyListeners();
  }

  void removeFromList(FoodItem foodItem) {
    foodItems.remove(foodItem);
    notifyListeners();
  }

}

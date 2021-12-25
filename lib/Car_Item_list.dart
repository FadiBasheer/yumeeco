import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
// so we need something like this for services and also inside each service and a list of items
class CarItemList {
  List<FoodItem> foodItems;

  CarItemList({@required this.foodItems});
}

class FoodItem {
  int id;
  String title;
  String hotel;
  double price;
  String imgUrl;
  int quantity;

  FoodItem({
    @required this.id,
    @required this.title,
    @required this.hotel,
    @required this.price,
    @required this.imgUrl,
    this.quantity = 1,
  });

  void incrementQuantity() {
    this.quantity = this.quantity + 1;
  }

  void decrementQuantity() {
    this.quantity = this.quantity - 1;
  }
}


CarItemList Cevic = CarItemList(foodItems: [
  FoodItem(
    id: 1,
    title: "Beach BBQ Burger",
    hotel: "Las Vegas Hotel",
    price: 14.49,
    imgUrl: "https://drive.google.com/file/d/1XPKCvgrP-xrE-Xdvc8WcqiijQnEjMZyj/view?usp=sharing",

  ),
  FoodItem(
    id: 2,
    title: "Kick Ass Burgers",
    hotel: "Dudleys",
    price: 11.99,
    imgUrl: "https://drive.google.com/file/d/1Mcbzn8VitAVyjPiaARf6rMTVKpMfvkB_/view?usp=sharing",
  ),
  FoodItem(
    id: 1,
    title: "Supreme Pizza Burger",
    hotel: "Golf Course",
    price: 8.49,
    imgUrl: "https://www.yumeeco.com/wp-content/uploads/2020/06/car-repair-tirecare.jpg",
  ),
  FoodItem(
    id: 4,
    title: "Supreme Pizza Burger",
    hotel: "Golf Course",
    price: 8.49,
    imgUrl: "https://www.yumeeco.com/wp-content/uploads/2020/06/car-repair-tirecare.jpg",
  ),
]);

CarItemList Corolla = CarItemList(foodItems: [
  FoodItem(
    id: 1,
    title: "Beach BBQ Burger",
    hotel: "Las Vegas Hotel",
    price: 1,
    imgUrl: "https://drive.google.com/file/d/1XPKCvgrP-xrE-Xdvc8WcqiijQnEjMZyj/view?usp=sharing",

  ),
  FoodItem(
    id: 2,
    title: "Kick Ass Burgers",
    hotel: "Dudleys",
    price: 1,
    imgUrl: "https://drive.google.com/file/d/1Mcbzn8VitAVyjPiaARf6rMTVKpMfvkB_/view?usp=sharing.jpg",
  ),
  FoodItem(
    id: 1,
    title: "Supreme Pizza Burger",
    hotel: "Golf Course",
    price: 9,
    imgUrl: "https://www.yumeeco.com/wp-content/uploads/2020/06/car-repair-tirecare.jpg",
  ),
  FoodItem(
    id: 4,
    title: "Supreme Pizza Burger",
    hotel: "Golf Course",
    price: 49,
    imgUrl: "https://www.yumeeco.com/wp-content/uploads/2020/06/car-repair-tirecare.jpg",
  ),
]);
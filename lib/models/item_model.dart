class ItemModel{
  String?  name, restaurantID, categoryID,itemID ;
  int? price;
  ItemModel(
      this.name,
      this.price,
      this.restaurantID,
      this.categoryID,
      this.itemID,
      );
  ItemModel.fromJson(json)
  {
    name = json['name'];
    price=json['price'];
    restaurantID = json['restaurantID'];
    categoryID=json['categoryID'];
    itemID=json['itemID'];
  }

  Map<String, dynamic> toMap() {
    return {
      'price': price,
      'name': name,
      'restaurantID': restaurantID,
      'categoryID':categoryID,
      'itemID':itemID,
    };
  }
}
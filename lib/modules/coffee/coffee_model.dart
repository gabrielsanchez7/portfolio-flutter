class Coffee {

  int id;
  String name;
  String price;
  String detailPrice;
  String image;
  
  Coffee({
    this.id,
    this.name,
    this.price,
    this.detailPrice,
    this.image
  });
  
  static List<Coffee> defaultList() {
    Coffee coffeePrev2 = Coffee(id: 0, name: 'Vietnamese-Style Iced Coffee', price: '4,50€', detailPrice: '4,5€', image: '9.png');
    Coffee coffeePrev1 = Coffee(id: 1, name: 'Classic Irish Coffee', price: '2,00€', detailPrice: '2€', image: '11.png');
    Coffee coffee1 = Coffee(id: 2, name: 'Americano', price: '2,50€', detailPrice: '2,5€', image: '8.png');
    Coffee coffee2 = Coffee(id: 3, name: 'Caramel\nMacchiato', price: '3,00€', detailPrice: '3€', image: '1.png');
    Coffee coffee3 = Coffee(id: 4, name: 'Caramel\nCold Drink', price: '3,50€', detailPrice: '3,5€', image: '9.png');
    Coffee coffee4 = Coffee(id: 5, name: 'Iceed Coffee\nMocha', price: '4,00€', detailPrice: '4€', image: '7.png');

    List<Coffee> list = [];
    list.add(coffeePrev2);
    list.add(coffeePrev1);
    list.add(coffee1);
    list.add(coffee2);
    list.add(coffee3);
    list.add(coffee4);

    return list;
  }
  
}

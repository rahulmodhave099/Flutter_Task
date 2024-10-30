class Zomato{
  final int orderId;
  final String custName;
  final String hotelName;
  final String food;
  final double bill;

  Zomato({
    required this.orderId,
    required this.custName,
    required this.hotelName,
    required this.food,
    required this.bill,
  });

  Map<String,dynamic> zomatoMap(){
    return {"orderId":orderId,"custName":custName,"hotelName":hotelName,"food":food,"bill":bill};
  }
}
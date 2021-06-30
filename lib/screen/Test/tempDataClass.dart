class ListData {
  final int mypicpath;
  final int namePro;

  final String price;
  final String at;
  ListData({this.mypicpath, this.namePro, this.price, this.at});
  factory ListData.fromJson(Map<String, dynamic> jsonData) {
    return ListData(
      mypicpath: jsonData['mypicpath'],
      namePro: jsonData['namePro'],
      price: jsonData['price'],
      at: jsonData['at'],
    );
  }
}
import 'dart:convert';

QueryBarCode queryBarCodeFromJson(String str) =>
    QueryBarCode.fromJson(json.decode(str));

String queryBarCodeToJson(QueryBarCode data) => json.encode(data.toJson());

class QueryBarCode {
  QueryBarCode({
    this.storeStoreId,
    this.storeHasProductDate,
    this.shiftName,
    this.shiftAdminName,
    this.customerName,
    this.transVehcileNum,
    this.transVehcileDriverName,
    this.date,
    this.productName,
    this.weightNet,
    this.barcodeSerialNumber,
    this.quantity,
    this.measreName,
  });

  int storeStoreId;
  DateTime storeHasProductDate;
  String shiftName;
  String shiftAdminName;
  String customerName;
  String transVehcileNum;
  String transVehcileDriverName;
  DateTime date;
  String productName;
  int weightNet;
  String barcodeSerialNumber;
  double quantity;
  String measreName;

  factory QueryBarCode.fromJson(Map<String, dynamic> json) => QueryBarCode(
        storeStoreId:
            json["store_store_id"] == null ? null : json["store_store_id"],
        storeHasProductDate: json["store_has_productDate"] == null
            ? null
            : DateTime.parse(json["store_has_productDate"]),
        shiftName: json["shiftName"] == null ? null : json["shiftName"],
        shiftAdminName:
            json["Shift_admin_Name"] == null ? null : json["Shift_admin_Name"],
        customerName:
            json["Customer_Name"] == null ? null : json["Customer_Name"],
        transVehcileNum:
            json["transVehcile_num"] == null ? null : json["transVehcile_num"],
        transVehcileDriverName: json["transVehcile_driver_name"] == null
            ? null
            : json["transVehcile_driver_name"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        productName: json["productName"] == null ? null : json["productName"],
        weightNet: json["weight_net"] == null ? null : json["weight_net"],
        barcodeSerialNumber: json["barcode_serialNumber"] == null
            ? null
            : json["barcode_serialNumber"],
        quantity: json["Quantity"] == null
            ? null
            : double.parse(json["Quantity"].toString()),
        measreName: json["measre_name"] == null ? null : json["measre_name"],
      );

  Map<String, dynamic> toJson() => {
        "store_store_id": storeStoreId == null ? null : storeStoreId,
        "store_has_productDate": storeHasProductDate == null
            ? null
            : storeHasProductDate.toIso8601String(),
        "shiftName": shiftName == null ? null : shiftName,
        "Shift_admin_Name": shiftAdminName == null ? null : shiftAdminName,
        "Customer_Name": customerName == null ? null : customerName,
        "transVehcile_num": transVehcileNum == null ? null : transVehcileNum,
        "transVehcile_driver_name":
            transVehcileDriverName == null ? null : transVehcileDriverName,
        "date": date == null ? null : date.toIso8601String(),
        "productName": productName == null ? null : productName,
        "weight_net": weightNet == null ? null : weightNet,
        "barcode_serialNumber":
            barcodeSerialNumber == null ? null : barcodeSerialNumber,
        "Quantity": quantity == null ? null : quantity,
        "measre_name": measreName == null ? null : measreName,
      };
}

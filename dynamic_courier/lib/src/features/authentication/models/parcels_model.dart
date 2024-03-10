class ParcelModel {

  final String? id;
  final String merchantID;
  final String senderName;
  final String receiverName;
  final String parcelQTY;
  final String senderAddress;
  final String senderPhone;
  final String receiverAddress;
  final String receiverPhone;
  final String status;
  final String dataCreated;


  ParcelModel({
    this.id,
    required this.merchantID,
    required this.senderName,
    required this.receiverName,
    required this.parcelQTY,
    required this.senderAddress,
    required this.senderPhone,
    required this.receiverAddress,
    required this.receiverPhone,
    required this.status,
    required this.dataCreated,

  });

  toJson() {
    return {
      "Merchant_ID":merchantID,
      "Sender Name": senderName,
      "Receiver Name": receiverName,
      "Items":parcelQTY,
      "From": senderAddress,
      "Sender Phone": senderPhone,
      "To": receiverAddress,
      "Receiver Phone": receiverPhone,
      "Status": status,
      "Date Created": dataCreated,

    };
  }
}
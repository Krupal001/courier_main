class FirmLocationModel{
   final String firmAddress;

  FirmLocationModel({required this.firmAddress});

  toJson(){
    return{
      "address":firmAddress,
    };
  }
}
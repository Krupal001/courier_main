class FirmLocationModel{
   final String firmAddress;
   final String firmName;

  FirmLocationModel({required this.firmAddress,required this.firmName});

  toJson(){
    return{
      "firm-name":firmName,
      "address":firmAddress,
    };
  }
}
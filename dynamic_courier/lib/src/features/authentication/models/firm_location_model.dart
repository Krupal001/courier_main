class FirmLocationModel{
   final String firmAddress;

  FirmLocationModel({required this.firmAddress});

  toJson(){
    return{
      "firm location":firmAddress,
    };
  }
}
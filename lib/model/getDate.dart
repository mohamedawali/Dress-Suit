class GetDate{
  String getDate(){
    DateTime dateTime=DateTime.now();
    return'${dateTime.day}-${dateTime.month}-${dateTime.year}';
  }
  String time(){
    DateTime dateTime=DateTime.now();
    return'${dateTime.microsecondsSinceEpoch}';
  }
}
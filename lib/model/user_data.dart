class UserData{
  String? id;
  String? name;
  String? phone;
  String? adress;
  String? image;

  UserData(this.id,this.name, this.phone, this.adress, this.image);
  Map<String,dynamic>tomap(){
    return{'id':id,'name':name,'phone':phone,'adress':adress,'image':image};
  }

  UserData.fromMap(Map<String,dynamic>map){

    name=map['name'];
    phone=map['phone'];
    adress=map['adress'];

  }


}
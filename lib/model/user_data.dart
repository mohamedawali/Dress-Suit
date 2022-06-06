class UserData{
  String? id;
  String? name;
  String? phone;
  String? adress;
  String? email;

  UserData(this.name, this.email,this.adress,this.phone );
  Map<String,dynamic>tomap(){
    return{'name':name,'email':email,'adress':adress,'phone':phone};
  }

  UserData.fromMap(Map<String,dynamic>map){

    name=map['name'];
    email=map['email'];
    adress=map['adress'];
    phone=map['phone'];


  }

  UserData.phoneNumberFromMap(Map<String,dynamic>map){


    phone=map['phone'];

  }

}
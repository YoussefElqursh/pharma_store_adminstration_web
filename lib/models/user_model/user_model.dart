class UserModel {
  String? firstName ;
  String? lastName ;
  String? email ;
  String? phoneNumber ;
  String? userName ;
  String? password ;
  String? createdAt ;
  String? modifiedAt ;
  String? accessToken ;

  UserModel(
      this.firstName,
      this.lastName,
      this.email,
      this.phoneNumber,
      this.userName,
      this.password,
      this.createdAt,
      this.modifiedAt,
      this.accessToken);

  UserModel.fromJson({required Map<String, dynamic>data}){
    firstName = data['firstName'];
    lastName = data['lastName'];
    email = data['email'];
    phoneNumber = data['phoneNumber'];
    userName = data['userName'];
    password = data['password'];
    createdAt = data['createdAt'];
    modifiedAt = data['modifiedAt'];
    accessToken = data['accessToken'];
  }
}
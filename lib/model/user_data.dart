class UserData {
  final String uid;
  final String username;
  final String email;
  final String phonenumber;
  final String eductionbackground;
  final int? age;
  final String? gender; 
  // Change the data type to String

  UserData( {
    required this.uid,
    required this.username,
    required this.email,
    required this.phonenumber,
    required this.eductionbackground,

    this.age,
    this.gender, // Change the data type to String
  });
}

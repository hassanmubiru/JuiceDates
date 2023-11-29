
// class User {
//   final String? username;
//   final List<String>? imageUrl;
//   final String? uid;
//   final int age;
//   final Map<String, dynamic> editInfo;

//   User({
//     this.username,
//     this.imageUrl,
//     this.uid,
//     required this.age,
//     required this.editInfo,
//   });

// }

class User {
  final String id;
  final String username;
  final int age;
  final List<String>? imageUrl;

  final Map<String, dynamic> editInfo; 

  // Constructor
  User({
    this.imageUrl,
    required this.id,
    required this.username,
    required this.age,
    required this.editInfo,
  });
}

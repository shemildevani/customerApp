class UserModel {
  final String firstName;
  final String lastName;
  String? email;
  final String phoneNumber;
  final String city;
  final String state;
  final String pincode;
  final bool? isSubscribed;
  final String? planType;

  UserModel({
    required this.firstName,
    required this.lastName,
    this.email,
    required this.phoneNumber,
    required this.city,
    required this.state,
    required this.pincode,
    this.isSubscribed,
    this.planType,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      email: json['email'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
      city: json['city'] ?? '',
      state: json['state'] ?? '',
      pincode: json['pincode'] ?? '',
      isSubscribed: json['isSubscribed'],
      planType: json['planType'],
    );
  }

  factory UserModel.fromOwnerJson(Map<String,dynamic> bundle) {
    return UserModel(
      firstName: bundle['firstName'] ?? '',
      lastName: bundle['lastName'] ?? '',
      email: bundle['email'] ?? '',
      phoneNumber: bundle['phoneNumber'] ?? '',
      city: bundle['city'] ?? '',
      state: bundle['state'] ?? '',
      pincode: bundle['pincode'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phoneNumber': phoneNumber,
      'city': city,
      'state': state,
      'pincode': pincode,
    };
  }
}

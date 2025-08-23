import 'dart:io';

import 'package:customer_app/models/address_model.dart';
import 'package:customer_app/models/user_model.dart';

class BusinessModel {
  final String id;
  final String userId;
  final String businessName;
  final File businessLogo;
  final File bannerImage;
  final String businessType;
  final String shopCategory;
  AddressModel addressModel;
  final String gstIN;
  final String description;
  final String googleMapURL;
  final String instagramAccountLink;
  final String facebookAccountLink;
  final String openTime;
  final String closeTime;
  final List<String> dayOff;
  final double ratings;
  final bool isOpen;
  final bool isVerified;
  final List<UserModel>? businessOwners;

  BusinessModel({
    required this.id,
    required this.userId,
    required this.businessName,
    required this.businessLogo,
    required this.bannerImage,
    required this.businessType,
    required this.shopCategory,
    required this.addressModel,
    required this.gstIN,
    required this.description,
    required this.googleMapURL,
    required this.instagramAccountLink,
    required this.facebookAccountLink,
    required this.openTime,
    required this.closeTime,
    required this.dayOff,
    this.ratings = 0.0,
    this.isOpen = false,
    this.isVerified = false,
    this.businessOwners,
  });

  factory BusinessModel.fromJson(Map<String, dynamic> json) {
    return BusinessModel(
      id: json['id'] ?? '',
      userId: json['userId'] ?? '',
      businessName: json['businessName'] ?? '',
      businessLogo: File(json['businessLogo'] ?? ''),
      bannerImage: File(json['bannerImage'] ?? ''),
      businessType: json['businessType'] ?? '',
      shopCategory: json['shopCategory'] ?? '',
      addressModel: AddressModel.fromJson(json['addressModel'] ?? {}),
      gstIN: json['gstIN'] ?? '',
      description: json['description'] ?? '',
      googleMapURL: json['googleMapURL'] ?? '',
      instagramAccountLink: json['instagramAccountLink'] ?? '',
      facebookAccountLink: json['facebookAccountLink'] ?? '',
      openTime: json['openTime'] ?? '',
      closeTime: json['closeTime'] ?? '',
      dayOff: List<String>.from(json['dayOff'] ?? []),
      ratings: (json['ratings'] as num?)?.toDouble() ?? 0.0,
      isOpen: json['isOpen'] ?? false,
      isVerified: json['isVerified'] ?? false,
      businessOwners:
          (json['businessOwners'] as List<dynamic>?)
              ?.map((e) => UserModel.fromOwnerJson(e as Map<String, dynamic>))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'businessName': businessName,
      'businessLogo': businessLogo.path,
      'bannerImage': bannerImage.path,
      'businessType': businessType,
      'shopCategory': shopCategory,
      'addressModel': addressModel.toJson(),
      'gstIN': gstIN,
      'description': description,
      'googleMapURL': googleMapURL,
      'instagramAccountLink': instagramAccountLink,
      'facebookAccountLink': facebookAccountLink,
      'openTime': openTime,
      'closeTime': closeTime,
      'dayOff': dayOff,
      'ratings': ratings,
      'isOpen': isOpen,
      'isVerified': isVerified,
      'businessOwners':
          businessOwners?.map((owner) => owner.toJson()).toList() ?? [],
    };
  }
}

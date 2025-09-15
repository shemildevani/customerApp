class OfferModel {
  final String id;
  final String title;
  final String description;
  final List<String> banner;
  final String startDate;
  final String endDate;
  final String? businessId;

  OfferModel({
    required this.id,
    required this.title,
    required this.description,
    required this.banner,
    required this.startDate,
    required this.endDate,
    this.businessId,
  });

  factory OfferModel.fromJson(Map<String, dynamic> json) {
    return OfferModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      banner: List<String>.from(json['banner']),
      startDate: json['startDate'],
      endDate: json['endDate'],
      businessId: json['businessId'],
    );
  }
}

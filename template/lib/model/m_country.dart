class MCountry {
  String? country;
  String? image_file;

  MCountry({this.country,this.image_file});

  MCountry.fromJson(Map<String, dynamic> json) {
    country = json['country'];
    image_file = json['image_file'];
  }
}
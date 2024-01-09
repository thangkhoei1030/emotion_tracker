class Address {
  Address({
    this.id,
    this.addressId,
    this.customerId,
    this.addressName,
    this.phone,
    this.address,
    this.countryId,
    this.cityId,
    this.districtId,
    this.wardId,
    this.countryName,
    this.cityName,
    this.districtName,
    this.wardName,
    this.fullAddress,
    this.zipCode,
    this.isDefault,
  });

  final int? id;
  final int? addressId;
  final int? customerId;
  final String? addressName;
  final dynamic phone;
  final dynamic address;
  final int? countryId;
  final dynamic cityId;
  final dynamic districtId;
  final dynamic wardId;
  final String? countryName;
  final dynamic cityName;
  final dynamic districtName;
  final dynamic wardName;
  final dynamic fullAddress;
  final dynamic zipCode;
  final int? isDefault;

  Address copyWith({
    int? id,
    int? addressId,
    int? customerId,
    String? addressName,
    dynamic? phone,
    dynamic? address,
    int? countryId,
    dynamic? cityId,
    dynamic? districtId,
    dynamic? wardId,
    String? countryName,
    dynamic? cityName,
    dynamic? districtName,
    dynamic? wardName,
    dynamic? fullAddress,
    dynamic? zipCode,
    int? isDefault,
  }) {
    return Address(
      id: id ?? this.id,
      addressId: addressId ?? this.addressId,
      customerId: customerId ?? this.customerId,
      addressName: addressName ?? this.addressName,
      phone: phone ?? this.phone,
      address: address ?? this.address,
      countryId: countryId ?? this.countryId,
      cityId: cityId ?? this.cityId,
      districtId: districtId ?? this.districtId,
      wardId: wardId ?? this.wardId,
      countryName: countryName ?? this.countryName,
      cityName: cityName ?? this.cityName,
      districtName: districtName ?? this.districtName,
      wardName: wardName ?? this.wardName,
      fullAddress: fullAddress ?? this.fullAddress,
      zipCode: zipCode ?? this.zipCode,
      isDefault: isDefault ?? this.isDefault,
    );
  }

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      id: json["id"],
      addressId: json["address_id"],
      customerId: json["customer_id"],
      addressName: json["address_name"],
      phone: json["phone"],
      address: json["address"],
      countryId: json["country_id"],
      cityId: json["city_id"],
      districtId: json["district_id"],
      wardId: json["ward_id"],
      countryName: json["country_name"],
      cityName: json["city_name"],
      districtName: json["district_name"],
      wardName: json["ward_name"],
      fullAddress: json["full_address"],
      zipCode: json["zip_code"],
      isDefault: json["is_default"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "address_id": addressId,
        "customer_id": customerId,
        "address_name": addressName,
        "phone": phone,
        "address": address,
        "country_id": countryId,
        "city_id": cityId,
        "district_id": districtId,
        "ward_id": wardId,
        "country_name": countryName,
        "city_name": cityName,
        "district_name": districtName,
        "ward_name": wardName,
        "full_address": fullAddress,
        "zip_code": zipCode,
        "is_default": isDefault,
      };

  @override
  String toString() {
    return "$id, $addressId, $customerId, $addressName, $phone, $address, $countryId, $cityId, $districtId, $wardId, $countryName, $cityName, $districtName, $wardName, $fullAddress, $zipCode, $isDefault, ";
  }
}

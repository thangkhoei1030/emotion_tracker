import 'package:flutter/foundation.dart';

import 'package:emotion_tracker/feature/src_feature.dart';

class UserInfoResponse {
  UserInfoResponse({
    this.id,
    this.customerId,
    this.code,
    this.fullName,
    this.email,
    this.phone,
    this.birthday,
    this.avatar,
    this.sex,
    this.note,
    this.nation,
    this.jobPosition,
    this.positionGroup,
    this.contract,
    this.level,
    this.subject,
    this.identificationNumber,
    this.classId,
    this.staffName,
    this.status,
    this.created,
    this.updated,
    this.addressId,
    this.addressName,
    this.address,
    this.fullAddress,
    this.countryId,
    this.cityId,
    this.districtId,
    this.wardId,
    this.countryName,
    this.cityName,
    this.districtName,
    this.wardName,
    this.zipCode,
    this.addresses = const [],
    this.bank = const [],
    this.nationName,
  });

  final int? id;
  final int? customerId;
  final String? code;
  final String? fullName;
  final String? email;
  final dynamic phone;
  final String? birthday;
  final String? avatar;
  final String? sex;
  final dynamic note;
  final int? nation;
  final dynamic jobPosition;
  final dynamic positionGroup;
  final dynamic contract;
  final dynamic level;
  final dynamic subject;
  final dynamic identificationNumber;
  final int? classId;
  final dynamic staffName;
  final int? status;
  final String? created;
  final dynamic updated;
  final int? addressId;
  final String? addressName;
  final dynamic address;
  final dynamic fullAddress;
  final int? countryId;
  final dynamic cityId;
  final dynamic districtId;
  final dynamic wardId;
  final String? countryName;
  final dynamic cityName;
  final dynamic districtName;
  final dynamic wardName;
  final dynamic zipCode;
  final List<Address> addresses;
  final List<dynamic> bank;
  final String? nationName;

  UserInfoResponse copyWith({
    int? id,
    int? customerId,
    String? code,
    String? fullName,
    String? email,
    dynamic? phone,
    String? birthday,
    dynamic? avatar,
    String? sex,
    dynamic? note,
    int? nation,
    dynamic? jobPosition,
    dynamic? positionGroup,
    dynamic? contract,
    dynamic? level,
    dynamic? subject,
    dynamic? identificationNumber,
    int? classId,
    dynamic? staffName,
    int? status,
    String? created,
    dynamic? updated,
    int? addressId,
    String? addressName,
    dynamic? address,
    dynamic? fullAddress,
    int? countryId,
    dynamic? cityId,
    dynamic? districtId,
    dynamic? wardId,
    String? countryName,
    dynamic? cityName,
    dynamic? districtName,
    dynamic? wardName,
    dynamic? zipCode,
    List<Address>? addresses,
    List<dynamic>? bank,
    String? nationName,
  }) {
    return UserInfoResponse(
      id: id ?? this.id,
      customerId: customerId ?? this.customerId,
      code: code ?? this.code,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      birthday: birthday ?? this.birthday,
      avatar: avatar ?? this.avatar,
      sex: sex ?? this.sex,
      note: note ?? this.note,
      nation: nation ?? this.nation,
      jobPosition: jobPosition ?? this.jobPosition,
      positionGroup: positionGroup ?? this.positionGroup,
      contract: contract ?? this.contract,
      level: level ?? this.level,
      subject: subject ?? this.subject,
      identificationNumber: identificationNumber ?? this.identificationNumber,
      classId: classId ?? this.classId,
      staffName: staffName ?? this.staffName,
      status: status ?? this.status,
      created: created ?? this.created,
      updated: updated ?? this.updated,
      addressId: addressId ?? this.addressId,
      addressName: addressName ?? this.addressName,
      address: address ?? this.address,
      fullAddress: fullAddress ?? this.fullAddress,
      countryId: countryId ?? this.countryId,
      cityId: cityId ?? this.cityId,
      districtId: districtId ?? this.districtId,
      wardId: wardId ?? this.wardId,
      countryName: countryName ?? this.countryName,
      cityName: cityName ?? this.cityName,
      districtName: districtName ?? this.districtName,
      wardName: wardName ?? this.wardName,
      zipCode: zipCode ?? this.zipCode,
      addresses: addresses ?? this.addresses,
      bank: bank ?? this.bank,
      nationName: nationName ?? this.nationName,
    );
  }

  factory UserInfoResponse.fromJson(Map<String, dynamic> json) {
    return UserInfoResponse(
      id: json["id"],
      customerId: json["customer_id"],
      code: json["code"],
      fullName: json["full_name"],
      email: json["email"],
      phone: json["phone"],
      birthday: json["birthday"],
      avatar: json["avatar"],
      sex: json["sex"],
      note: json["note"],
      nation: json["nation"],
      jobPosition: json["job_position"],
      positionGroup: json["position_group"],
      contract: json["contract"],
      level: json["level"],
      subject: json["subject"],
      identificationNumber: json["identification_number"],
      classId: json["class_id"],
      staffName: json["staff_name"],
      status: json["status"],
      created: json["created"],
      updated: json["updated"],
      addressId: json["address_id"],
      addressName: json["address_name"],
      address: json["address"],
      fullAddress: json["full_address"],
      countryId: json["country_id"],
      cityId: json["city_id"],
      districtId: json["district_id"],
      wardId: json["ward_id"],
      countryName: json["country_name"],
      cityName: json["city_name"],
      districtName: json["district_name"],
      wardName: json["ward_name"],
      zipCode: json["zip_code"],
      addresses: json["addresses"] == null
          ? []
          : List<Address>.from(
              json["addresses"]!.map((x) => Address.fromJson(x))),
      bank: json["bank"] == null
          ? []
          : List<dynamic>.from(json["bank"]!.map((x) => x)),
      nationName: json["nation_name"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "customer_id": customerId,
        "code": code,
        "full_name": fullName,
        "email": email,
        "phone": phone,
        "birthday": birthday,
        "avatar": avatar,
        "sex": sex,
        "note": note,
        "nation": nation,
        "job_position": jobPosition,
        "position_group": positionGroup,
        "contract": contract,
        "level": level,
        "subject": subject,
        "identification_number": identificationNumber,
        "class_id": classId,
        "staff_name": staffName,
        "status": status,
        "created": created,
        "updated": updated,
        "address_id": addressId,
        "address_name": addressName,
        "address": address,
        "full_address": fullAddress,
        "country_id": countryId,
        "city_id": cityId,
        "district_id": districtId,
        "ward_id": wardId,
        "country_name": countryName,
        "city_name": cityName,
        "district_name": districtName,
        "ward_name": wardName,
        "zip_code": zipCode,
        "addresses": addresses.map((x) => x.toJson()).toList(),
        "bank": bank.map((x) => x).toList(),
        "nation_name": nationName,
      };

  @override
  String toString() {
    return "$id, $customerId, $code, $fullName, $email, $phone, $birthday, $avatar, $sex, $note, $nation, $jobPosition, $positionGroup, $contract, $level, $subject, $identificationNumber, $classId, $staffName, $status, $created, $updated, $addressId, $addressName, $address, $fullAddress, $countryId, $cityId, $districtId, $wardId, $countryName, $cityName, $districtName, $wardName, $zipCode, $addresses, $bank, $nationName, ";
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserInfoResponse &&
        other.id == id &&
        other.customerId == customerId &&
        other.code == code &&
        other.fullName == fullName &&
        other.email == email &&
        other.phone == phone &&
        other.birthday == birthday &&
        other.avatar == avatar &&
        other.sex == sex &&
        other.note == note &&
        other.nation == nation &&
        other.jobPosition == jobPosition &&
        other.positionGroup == positionGroup &&
        other.contract == contract &&
        other.level == level &&
        other.subject == subject &&
        other.identificationNumber == identificationNumber &&
        other.classId == classId &&
        other.staffName == staffName &&
        other.status == status &&
        other.created == created &&
        other.updated == updated &&
        other.addressId == addressId &&
        other.addressName == addressName &&
        other.address == address &&
        other.fullAddress == fullAddress &&
        other.countryId == countryId &&
        other.cityId == cityId &&
        other.districtId == districtId &&
        other.wardId == wardId &&
        other.countryName == countryName &&
        other.cityName == cityName &&
        other.districtName == districtName &&
        other.wardName == wardName &&
        other.zipCode == zipCode &&
        listEquals(other.addresses, addresses) &&
        listEquals(other.bank, bank) &&
        other.nationName == nationName;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        customerId.hashCode ^
        code.hashCode ^
        fullName.hashCode ^
        email.hashCode ^
        phone.hashCode ^
        birthday.hashCode ^
        avatar.hashCode ^
        sex.hashCode ^
        note.hashCode ^
        nation.hashCode ^
        jobPosition.hashCode ^
        positionGroup.hashCode ^
        contract.hashCode ^
        level.hashCode ^
        subject.hashCode ^
        identificationNumber.hashCode ^
        classId.hashCode ^
        staffName.hashCode ^
        status.hashCode ^
        created.hashCode ^
        updated.hashCode ^
        addressId.hashCode ^
        addressName.hashCode ^
        address.hashCode ^
        fullAddress.hashCode ^
        countryId.hashCode ^
        cityId.hashCode ^
        districtId.hashCode ^
        wardId.hashCode ^
        countryName.hashCode ^
        cityName.hashCode ^
        districtName.hashCode ^
        wardName.hashCode ^
        zipCode.hashCode ^
        addresses.hashCode ^
        bank.hashCode ^
        nationName.hashCode;
  }
}

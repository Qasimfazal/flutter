class Hotels {
  int code;
  Name name;
  Name description;
  String countryCode;
  String stateCode;
  String destinationCode;
  int zoneCode;
  Coordinates coordinates;
  String categoryCode;
  String categoryGroupCode;
  String chainCode;
  String accommodationTypeCode;
  // List<String> boardCodes;

  // List<Null> segmentCodes;
  Address address;
  String postalCode;
  Name city;
  String email;
  List<Phones> phones;
  // List<Rooms> rooms;
  List<Facilities> facilities;
  List<Issues> issues;
  List<Images> images;
  String web;
  String lastUpdate;
  String s2C;
  int ranking;

  Hotels(
      {this.code,
      this.name,
      this.description,
      this.countryCode,
      this.stateCode,
      this.destinationCode,
      this.zoneCode,
      this.coordinates,
      this.categoryCode,
      this.categoryGroupCode,
      this.chainCode,
      this.accommodationTypeCode,
      // this.boardCodes,
      // this.segmentCodes,
      this.address,
      this.postalCode,
      this.city,
      this.email,
      this.phones,
      // this.rooms,
      this.facilities,
      this.issues,
      this.images,
      this.web,
      this.lastUpdate,
      this.s2C,
      this.ranking});

  Hotels.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    name = json['name'] != null ? new Name.fromJson(json['name']) : null;
    description = json['description'] != null
        ? new Name.fromJson(json['description'])
        : null;
    countryCode = json['countryCode'];
    stateCode = json['stateCode'];
    destinationCode = json['destinationCode'];
    zoneCode = json['zoneCode'];
    coordinates = json['coordinates'] != null
        ? new Coordinates.fromJson(json['coordinates'])
        : null;
    categoryCode = json['categoryCode'];
    categoryGroupCode = json['categoryGroupCode'];
    chainCode = json['chainCode'];
    accommodationTypeCode = json['accommodationTypeCode'];
    // boardCodes = json['boardCodes'].cast<String>();
    // if (json['segmentCodes'] != null) {
    //   segmentCodes = new List<Null>();
    //   json['segmentCodes'].forEach((v) {
    //     segmentCodes.add(new Null.fromJson(v));
    //   });
    // }
    address =
        json['address'] != null ? new Address.fromJson(json['address']) : null;
    postalCode = json['postalCode'];
    city = json['city'] != null ? new Name.fromJson(json['city']) : null;
    email = json['email'];
    if (json['phones'] != null) {
      phones = new List<Phones>();
      json['phones'].forEach((v) {
        phones.add(new Phones.fromJson(v));
      });
    }
    // if (json['rooms'] != null) {
    //   rooms = new List<Rooms>();
    //   json['rooms'].forEach((v) {
    //     rooms.add(new Rooms.fromJson(v));
    //   });
    // }
    if (json['facilities'] != null) {
      facilities = new List<Facilities>();
      json['facilities'].forEach((v) {
        facilities.add(new Facilities.fromJson(v));
      });
    }
    if (json['issues'] != null) {
      issues = new List<Issues>();
      json['issues'].forEach((v) {
        issues.add(new Issues.fromJson(v));
      });
    }
    if (json['images'] != null) {
      images = new List<Images>();
      json['images'].forEach((v) {
        images.add(new Images.fromJson(v));
      });
    }
    web = json['web'];
    lastUpdate = json['lastUpdate'];
    s2C = json['S2C'];
    ranking = json['ranking'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    if (this.name != null) {
      data['name'] = this.name.toJson();
    }
    if (this.description != null) {
      data['description'] = this.description.toJson();
    }
    data['countryCode'] = this.countryCode;
    data['stateCode'] = this.stateCode;
    data['destinationCode'] = this.destinationCode;
    data['zoneCode'] = this.zoneCode;
    if (this.coordinates != null) {
      data['coordinates'] = this.coordinates.toJson();
    }
    data['categoryCode'] = this.categoryCode;
    data['categoryGroupCode'] = this.categoryGroupCode;
    data['chainCode'] = this.chainCode;
    data['accommodationTypeCode'] = this.accommodationTypeCode;
    // data['boardCodes'] = this.boardCodes;
    // if (this.segmentCodes != null) {
    //   data['segmentCodes'] = this.segmentCodes.map((v) => v.toJson()).toList();
    // }
    if (this.address != null) {
      data['address'] = this.address.toJson();
    }
    data['postalCode'] = this.postalCode;
    if (this.city != null) {
      data['city'] = this.city.toJson();
    }
    data['email'] = this.email;
    if (this.phones != null) {
      data['phones'] = this.phones.map((v) => v.toJson()).toList();
    }
    // if (this.rooms != null) {
    //   data['rooms'] = this.rooms.map((v) => v.toJson()).toList();
    // }
    if (this.facilities != null) {
      data['facilities'] = this.facilities.map((v) => v.toJson()).toList();
    }
    if (this.issues != null) {
      data['issues'] = this.issues.map((v) => v.toJson()).toList();
    }
    if (this.images != null) {
      data['images'] = this.images.map((v) => v.toJson()).toList();
    }
    data['web'] = this.web;
    data['lastUpdate'] = this.lastUpdate;
    data['S2C'] = this.s2C;
    data['ranking'] = this.ranking;
    return data;
  }

  @override
  String toString() {
    // TODO: implement toString
    return code.toString();
  }
}

class Name {
  String content;

  Name({this.content});

  Name.fromJson(Map<String, dynamic> json) {
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['content'] = this.content;
    return data;
  }
}

class Coordinates {
  double longitude;
  double latitude;

  Coordinates({this.longitude, this.latitude});

  Coordinates.fromJson(Map<String, dynamic> json) {
    longitude = json['longitude'];
    latitude = json['latitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['longitude'] = this.longitude;
    data['latitude'] = this.latitude;
    return data;
  }
}

class Address {
  String content;
  String street;

  Address({this.content, this.street});

  Address.fromJson(Map<String, dynamic> json) {
    content = json['content'];
    street = json['street'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['content'] = this.content;
    data['street'] = this.street;
    return data;
  }
}

class Phones {
  String phoneNumber;
  String phoneType;

  Phones({this.phoneNumber, this.phoneType});

  Phones.fromJson(Map<String, dynamic> json) {
    phoneNumber = json['phoneNumber'];
    phoneType = json['phoneType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phoneNumber'] = this.phoneNumber;
    data['phoneType'] = this.phoneType;
    return data;
  }
}

// class Rooms {
//   String roomCode;
//   bool isParentRoom;
//   int minPax;
//   int maxPax;
//   int maxAdults;
//   int maxChildren;
//   int minAdults;
//   String roomType;
//   String characteristicCode;
//   List<RoomFacilities> roomFacilities;
//   List<RoomStays> roomStays;
//
//   Rooms(
//       {this.roomCode,
//       this.isParentRoom,
//       this.minPax,
//       this.maxPax,
//       this.maxAdults,
//       this.maxChildren,
//       this.minAdults,
//       this.roomType,
//       this.characteristicCode,
//       this.roomFacilities,
//       this.roomStays});
//
//   Rooms.fromJson(Map<String, dynamic> json) {
//     roomCode = json['roomCode'];
//     isParentRoom = json['isParentRoom'];
//     minPax = json['minPax'];
//     maxPax = json['maxPax'];
//     maxAdults = json['maxAdults'];
//     maxChildren = json['maxChildren'];
//     minAdults = json['minAdults'];
//     roomType = json['roomType'];
//     characteristicCode = json['characteristicCode'];
//     if (json['roomFacilities'] != null) {
//       roomFacilities = new List<RoomFacilities>();
//       json['roomFacilities'].forEach((v) {
//         roomFacilities.add(new RoomFacilities.fromJson(v));
//       });
//     }
//     if (json['roomStays'] != null) {
//       roomStays = new List<RoomStays>();
//       json['roomStays'].forEach((v) {
//         roomStays.add(new RoomStays.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['roomCode'] = this.roomCode;
//     data['isParentRoom'] = this.isParentRoom;
//     data['minPax'] = this.minPax;
//     data['maxPax'] = this.maxPax;
//     data['maxAdults'] = this.maxAdults;
//     data['maxChildren'] = this.maxChildren;
//     data['minAdults'] = this.minAdults;
//     data['roomType'] = this.roomType;
//     data['characteristicCode'] = this.characteristicCode;
//     if (this.roomFacilities != null) {
//       data['roomFacilities'] =
//           this.roomFacilities.map((v) => v.toJson()).toList();
//     }
//     if (this.roomStays != null) {
//       data['roomStays'] = this.roomStays.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

class RoomFacilities {
  int facilityCode;
  int facilityGroupCode;
  bool indLogic;
  bool indFee;
  bool voucher;
  bool indYesOrNo;
  int number;

  RoomFacilities(
      {this.facilityCode,
      this.facilityGroupCode,
      this.indLogic,
      this.indFee,
      this.voucher,
      this.indYesOrNo,
      this.number});

  RoomFacilities.fromJson(Map<String, dynamic> json) {
    facilityCode = json['facilityCode'];
    facilityGroupCode = json['facilityGroupCode'];
    indLogic = json['indLogic'];
    indFee = json['indFee'];
    voucher = json['voucher'];
    indYesOrNo = json['indYesOrNo'];
    number = json['number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['facilityCode'] = this.facilityCode;
    data['facilityGroupCode'] = this.facilityGroupCode;
    data['indLogic'] = this.indLogic;
    data['indFee'] = this.indFee;
    data['voucher'] = this.voucher;
    data['indYesOrNo'] = this.indYesOrNo;
    data['number'] = this.number;
    return data;
  }
}

class RoomStays {
  String stayType;
  String order;
  String description;
  List<RoomStayFacilities> roomStayFacilities;

  RoomStays(
      {this.stayType, this.order, this.description, this.roomStayFacilities});

  RoomStays.fromJson(Map<String, dynamic> json) {
    stayType = json['stayType'];
    order = json['order'];
    description = json['description'];
    if (json['roomStayFacilities'] != null) {
      roomStayFacilities = new List<RoomStayFacilities>();
      json['roomStayFacilities'].forEach((v) {
        roomStayFacilities.add(new RoomStayFacilities.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['stayType'] = this.stayType;
    data['order'] = this.order;
    data['description'] = this.description;
    if (this.roomStayFacilities != null) {
      data['roomStayFacilities'] =
          this.roomStayFacilities.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RoomStayFacilities {
  int facilityCode;
  int facilityGroupCode;
  int number;

  RoomStayFacilities({this.facilityCode, this.facilityGroupCode, this.number});

  RoomStayFacilities.fromJson(Map<String, dynamic> json) {
    facilityCode = json['facilityCode'];
    facilityGroupCode = json['facilityGroupCode'];
    number = json['number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['facilityCode'] = this.facilityCode;
    data['facilityGroupCode'] = this.facilityGroupCode;
    data['number'] = this.number;
    return data;
  }
}

class Facilities {
  int facilityCode;
  int facilityGroupCode;
  int order;
  int number;
  bool voucher;
  bool indYesOrNo;
  bool indLogic;
  bool indFee;
  int distance;
  dynamic amount;
  String currency;
  String applicationType;
  String timeFrom;
  String timeTo;
  String dateTo;

  Facilities(
      {this.facilityCode,
      this.facilityGroupCode,
      this.order,
      this.number,
      this.voucher,
      this.indYesOrNo,
      this.indLogic,
      this.indFee,
      this.distance,
      this.amount,
      this.currency,
      this.applicationType,
      this.timeFrom,
      this.timeTo,
      this.dateTo});

  Facilities.fromJson(Map<String, dynamic> json) {
    facilityCode = json['facilityCode'];
    facilityGroupCode = json['facilityGroupCode'];
    order = json['order'];
    number = json['number'];
    voucher = json['voucher'];
    indYesOrNo = json['indYesOrNo'];
    indLogic = json['indLogic'];
    indFee = json['indFee'];
    distance = json['distance'];
    // if (json['amount'] == null)
    //   amount = 0.0;
    // else
      amount = (json['amount']);
    currency = json['currency'];
    applicationType = json['applicationType'];
    timeFrom = json['timeFrom'];
    timeTo = json['timeTo'];
    dateTo = json['dateTo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['facilityCode'] = this.facilityCode;
    data['facilityGroupCode'] = this.facilityGroupCode;
    data['order'] = this.order;
    data['number'] = this.number;
    data['voucher'] = this.voucher;
    data['indYesOrNo'] = this.indYesOrNo;
    data['indLogic'] = this.indLogic;
    data['indFee'] = this.indFee;
    data['distance'] = this.distance;
    // if (data['amount'] == null)
    //   data['amount'] = 0.0;
    // else
      data['amount'] = this.amount;
    data['currency'] = this.currency;
    data['applicationType'] = this.applicationType;
    data['timeFrom'] = this.timeFrom;
    data['timeTo'] = this.timeTo;
    data['dateTo'] = this.dateTo;
    return data;
  }
}

class Issues {
  String issueCode;
  String issueType;
  String dateFrom;
  String dateTo;
  int order;
  bool alternative;

  Issues(
      {this.issueCode,
      this.issueType,
      this.dateFrom,
      this.dateTo,
      this.order,
      this.alternative});

  Issues.fromJson(Map<String, dynamic> json) {
    issueCode = json['issueCode'];
    issueType = json['issueType'];
    dateFrom = json['dateFrom'];
    dateTo = json['dateTo'];
    order = json['order'];
    alternative = json['alternative'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['issueCode'] = this.issueCode;
    data['issueType'] = this.issueType;
    data['dateFrom'] = this.dateFrom;
    data['dateTo'] = this.dateTo;
    data['order'] = this.order;
    data['alternative'] = this.alternative;
    return data;
  }
}

class Images {
  String imageTypeCode;
  String path;
  int order;
  int visualOrder;
  String roomCode;
  String roomType;
  String characteristicCode;

  Images(
      {this.imageTypeCode,
      this.path,
      this.order,
      this.visualOrder,
      this.roomCode,
      this.roomType,
      this.characteristicCode});

  Images.fromJson(Map<String, dynamic> json) {
    imageTypeCode = json['imageTypeCode'];
    path = json['path'];
    order = json['order'];
    visualOrder = json['visualOrder'];
    roomCode = json['roomCode'];
    roomType = json['roomType'];
    characteristicCode = json['characteristicCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imageTypeCode'] = this.imageTypeCode;
    data['path'] = this.path;
    data['order'] = this.order;
    data['visualOrder'] = this.visualOrder;
    data['roomCode'] = this.roomCode;
    data['roomType'] = this.roomType;
    data['characteristicCode'] = this.characteristicCode;
    return data;
  }
}

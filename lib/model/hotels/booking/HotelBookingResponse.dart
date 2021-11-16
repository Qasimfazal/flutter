class HotelBookingResponse {
  Booking booking;

  HotelBookingResponse({this.booking});

  HotelBookingResponse.fromJson(Map<String, dynamic> json) {
    booking =
    json['booking'] != null ? new Booking.fromJson(json['booking']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.booking != null) {
      data['booking'] = this.booking.toJson();
    }
    return data;
  }
}

class Booking {
  String reference;
  String clientReference;
  String creationDate;
  String status;
  ModificationPolicies modificationPolicies;
  String creationUser;
  Holder holder;
  BookedHotel hotel;
  String remark;
  InvoiceCompany invoiceCompany;
  double totalNet;
  double pendingAmount;
  String currency;

  Booking(
      {this.reference,
        this.clientReference,
        this.creationDate,
        this.status,
        this.modificationPolicies,
        this.creationUser,
        this.holder,
        this.hotel,
        this.remark,
        this.invoiceCompany,
        this.totalNet,
        this.pendingAmount,
        this.currency});

  Booking.fromJson(Map<String, dynamic> json) {
    reference = json['reference'];
    clientReference = json['clientReference'];
    creationDate = json['creationDate'];
    status = json['status'];
    modificationPolicies = json['modificationPolicies'] != null
        ? new ModificationPolicies.fromJson(json['modificationPolicies'])
        : null;
    creationUser = json['creationUser'];
    holder =
    json['holder'] != null ? new Holder.fromJson(json['holder']) : null;
    hotel = json['hotel'] != null ? new BookedHotel.fromJson(json['hotel']) : null;
    remark = json['remark'];
    invoiceCompany = json['invoiceCompany'] != null
        ? new InvoiceCompany.fromJson(json['invoiceCompany'])
        : null;
    totalNet = json['totalNet'];
    pendingAmount = json['pendingAmount'];
    currency = json['currency'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['reference'] = this.reference;
    data['clientReference'] = this.clientReference;
    data['creationDate'] = this.creationDate;
    data['status'] = this.status;
    if (this.modificationPolicies != null) {
      data['modificationPolicies'] = this.modificationPolicies.toJson();
    }
    data['creationUser'] = this.creationUser;
    if (this.holder != null) {
      data['holder'] = this.holder.toJson();
    }
    if (this.hotel != null) {
      data['hotel'] = this.hotel.toJson();
    }
    data['remark'] = this.remark;
    if (this.invoiceCompany != null) {
      data['invoiceCompany'] = this.invoiceCompany.toJson();
    }
    data['totalNet'] = this.totalNet;
    data['pendingAmount'] = this.pendingAmount;
    data['currency'] = this.currency;
    return data;
  }
}

class ModificationPolicies {
  bool cancellation;
  bool modification;

  ModificationPolicies({this.cancellation, this.modification});

  ModificationPolicies.fromJson(Map<String, dynamic> json) {
    cancellation = json['cancellation'];
    modification = json['modification'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cancellation'] = this.cancellation;
    data['modification'] = this.modification;
    return data;
  }
}

class Holder {
  String name;
  String surname;

  Holder({this.name, this.surname});

  Holder.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    surname = json['surname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['surname'] = this.surname;
    return data;
  }
}

class BookedHotel {
  String checkOut;
  String checkIn;
  int code;
  String name;
  String categoryCode;
  String categoryName;
  String destinationCode;
  String destinationName;
  int zoneCode;
  String zoneName;
  String latitude;
  String longitude;
  List<BookedRooms> rooms;
  String totalNet;
  String currency;
  Supplier supplier;

  BookedHotel(
      {this.checkOut,
        this.checkIn,
        this.code,
        this.name,
        this.categoryCode,
        this.categoryName,
        this.destinationCode,
        this.destinationName,
        this.zoneCode,
        this.zoneName,
        this.latitude,
        this.longitude,
        this.rooms,
        this.totalNet,
        this.currency,
        this.supplier});

  BookedHotel.fromJson(Map<String, dynamic> json) {
    checkOut = json['checkOut'];
    checkIn = json['checkIn'];
    code = json['code'];
    name = json['name'];
    categoryCode = json['categoryCode'];
    categoryName = json['categoryName'];
    destinationCode = json['destinationCode'];
    destinationName = json['destinationName'];
    zoneCode = json['zoneCode'];
    zoneName = json['zoneName'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    if (json['rooms'] != null) {
      rooms = new List<BookedRooms>();
      json['rooms'].forEach((v) {
        rooms.add(new BookedRooms.fromJson(v));
      });
    }
    totalNet = json['totalNet'];
    currency = json['currency'];
    supplier = json['supplier'] != null
        ? new Supplier.fromJson(json['supplier'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['checkOut'] = this.checkOut;
    data['checkIn'] = this.checkIn;
    data['code'] = this.code;
    data['name'] = this.name;
    data['categoryCode'] = this.categoryCode;
    data['categoryName'] = this.categoryName;
    data['destinationCode'] = this.destinationCode;
    data['destinationName'] = this.destinationName;
    data['zoneCode'] = this.zoneCode;
    data['zoneName'] = this.zoneName;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    if (this.rooms != null) {
      data['rooms'] = this.rooms.map((v) => v.toJson()).toList();
    }
    data['totalNet'] = this.totalNet;
    data['currency'] = this.currency;
    if (this.supplier != null) {
      data['supplier'] = this.supplier.toJson();
    }
    return data;
  }
}

class BookedRooms {
  String status;
  int id;
  String code;
  String name;
  String supplierReference;
  List<Paxes> paxes;
  List<Rates> rates;

  BookedRooms(
      {this.status,
        this.id,
        this.code,
        this.name,
        this.supplierReference,
        this.paxes,
        this.rates});

  BookedRooms.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    id = json['id'];
    code = json['code'];
    name = json['name'];
    supplierReference = json['supplierReference'];
    if (json['paxes'] != null) {
      paxes = new List<Paxes>();
      json['paxes'].forEach((v) {
        paxes.add(new Paxes.fromJson(v));
      });
    }
    if (json['rates'] != null) {
      rates = new List<Rates>();
      json['rates'].forEach((v) {
        rates.add(new Rates.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['id'] = this.id;
    data['code'] = this.code;
    data['name'] = this.name;
    data['supplierReference'] = this.supplierReference;
    if (this.paxes != null) {
      data['paxes'] = this.paxes.map((v) => v.toJson()).toList();
    }
    if (this.rates != null) {
      data['rates'] = this.rates.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Paxes {
  int roomId;
  String type;
  String name;
  String surname;

  Paxes({this.roomId, this.type, this.name, this.surname});

  Paxes.fromJson(Map<String, dynamic> json) {
    roomId = json['roomId'];
    type = json['type'];
    name = json['name'];
    surname = json['surname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['roomId'] = this.roomId;
    data['type'] = this.type;
    data['name'] = this.name;
    data['surname'] = this.surname;
    return data;
  }
}

class Rates {
  String rateClass;
  String net;
  String rateComments;
  String paymentType;
  bool packaging;
  String boardCode;
  String boardName;
  List<CancellationPolicies> cancellationPolicies;
  int rooms;
  int adults;
  int children;

  Rates(
      {this.rateClass,
        this.net,
        this.rateComments,
        this.paymentType,
        this.packaging,
        this.boardCode,
        this.boardName,
        this.cancellationPolicies,
        this.rooms,
        this.adults,
        this.children});

  Rates.fromJson(Map<String, dynamic> json) {
    rateClass = json['rateClass'];
    net = json['net'];
    rateComments = json['rateComments'];
    paymentType = json['paymentType'];
    packaging = json['packaging'];
    boardCode = json['boardCode'];
    boardName = json['boardName'];
    if (json['cancellationPolicies'] != null) {
      cancellationPolicies = new List<CancellationPolicies>();
      json['cancellationPolicies'].forEach((v) {
        cancellationPolicies.add(new CancellationPolicies.fromJson(v));
      });
    }
    rooms = json['rooms'];
    adults = json['adults'];
    children = json['children'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rateClass'] = this.rateClass;
    data['net'] = this.net;
    data['rateComments'] = this.rateComments;
    data['paymentType'] = this.paymentType;
    data['packaging'] = this.packaging;
    data['boardCode'] = this.boardCode;
    data['boardName'] = this.boardName;
    if (this.cancellationPolicies != null) {
      data['cancellationPolicies'] =
          this.cancellationPolicies.map((v) => v.toJson()).toList();
    }
    data['rooms'] = this.rooms;
    data['adults'] = this.adults;
    data['children'] = this.children;
    return data;
  }
}

class CancellationPolicies {
  String amount;
  String from;

  CancellationPolicies({this.amount, this.from});

  CancellationPolicies.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    from = json['from'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amount'] = this.amount;
    data['from'] = this.from;
    return data;
  }
}

class Supplier {
  String name;
  String vatNumber;

  Supplier({this.name, this.vatNumber});

  Supplier.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    vatNumber = json['vatNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['vatNumber'] = this.vatNumber;
    return data;
  }
}

class InvoiceCompany {
  String code;
  String company;
  String registrationNumber;

  InvoiceCompany({this.code, this.company, this.registrationNumber});

  InvoiceCompany.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    company = json['company'];
    registrationNumber = json['registrationNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['company'] = this.company;
    data['registrationNumber'] = this.registrationNumber;
    return data;
  }
}
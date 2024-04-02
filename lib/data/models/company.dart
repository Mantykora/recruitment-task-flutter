import 'package:hive/hive.dart';
import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'company.g.dart';

List<Company> companyFromJson(String str) => List<Company>.from(json.decode(str).map((x) => Company.fromJson(x)));

String companyToJson(List<Company> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@JsonSerializable()
@HiveType(typeId: 1)
class Company {
  @HiveField(1)
  String symbol;
  @HiveField(2)
  double price;
  @HiveField(3)
  double beta;
  @HiveField(4)
  int volAvg;
  @HiveField(5)
  int mktCap;
  @HiveField(6)
  double lastDiv;
  @HiveField(7)
  String range;
  @HiveField(8)
  double changes;
  @HiveField(9)
  String companyName;
  @HiveField(10)
  String currency;
  @HiveField(11)
  String cik;
  @HiveField(12)
  String isin;
  @HiveField(13)
  String cusip;
  @HiveField(14)
  String exchange;
  @HiveField(15)
  String exchangeShortName;
  @HiveField(16)
  String industry;
  @HiveField(17)
  String website;
  @HiveField(18)
  String description;
  @HiveField(19)
  String ceo;
  @HiveField(20)
  String sector;
  @HiveField(21)
  String country;
  @HiveField(22)
  String fullTimeEmployees;
  @HiveField(23)
  String phone;
  @HiveField(24)
  String address;
  @HiveField(25)
  String city;
  @HiveField(26)
  String state;
  @HiveField(27)
  String zip;
  @HiveField(28)
  double dcfDiff;
  @HiveField(29)
  double dcf;
  @HiveField(30)
  String image;
  @HiveField(31)
  DateTime ipoDate;
  @HiveField(32)
  bool defaultImage;
  @HiveField(33)
  bool isEtf;
  @HiveField(34)
  bool isActivelyTrading;
  @HiveField(35)
  bool isAdr;
  @HiveField(36)
  bool isFund;

  Company({
    required this.symbol,
    required this.price,
    required this.beta,
    required this.volAvg,
    required this.mktCap,
    required this.lastDiv,
    required this.range,
    required this.changes,
    required this.companyName,
    required this.currency,
    required this.cik,
    required this.isin,
    required this.cusip,
    required this.exchange,
    required this.exchangeShortName,
    required this.industry,
    required this.website,
    required this.description,
    required this.ceo,
    required this.sector,
    required this.country,
    required this.fullTimeEmployees,
    required this.phone,
    required this.address,
    required this.city,
    required this.state,
    required this.zip,
    required this.dcfDiff,
    required this.dcf,
    required this.image,
    required this.ipoDate,
    required this.defaultImage,
    required this.isEtf,
    required this.isActivelyTrading,
    required this.isAdr,
    required this.isFund,
  });

  factory Company.fromJson(Map<String, dynamic> json) => Company(
    symbol: json["symbol"],
    price: json["price"]?.toDouble(),
    beta: json["beta"]?.toDouble(),
    volAvg: json["volAvg"],
    mktCap: json["mktCap"],
    lastDiv: json["lastDiv"]?.toDouble(),
    range: json["range"],
    changes: json["changes"]?.toDouble(),
    companyName: json["companyName"],
    currency: json["currency"],
    cik: json["cik"],
    isin: json["isin"],
    cusip: json["cusip"],
    exchange: json["exchange"],
    exchangeShortName: json["exchangeShortName"],
    industry: json["industry"],
    website: json["website"],
    description: json["description"],
    ceo: json["ceo"],
    sector: json["sector"],
    country: json["country"],
    fullTimeEmployees: json["fullTimeEmployees"],
    phone: json["phone"],
    address: json["address"],
    city: json["city"],
    state: json["state"],
    zip: json["zip"],
    dcfDiff: json["dcfDiff"]?.toDouble(),
    dcf: json["dcf"]?.toDouble(),
    image: json["image"],
    ipoDate: DateTime.parse(json["ipoDate"]),
    defaultImage: json["defaultImage"],
    isEtf: json["isEtf"],
    isActivelyTrading: json["isActivelyTrading"],
    isAdr: json["isAdr"],
    isFund: json["isFund"],
  );

  Map<String, dynamic> toJson() => {
    "symbol": symbol,
    "price": price,
    "beta": beta,
    "volAvg": volAvg,
    "mktCap": mktCap,
    "lastDiv": lastDiv,
    "range": range,
    "changes": changes,
    "companyName": companyName,
    "currency": currency,
    "cik": cik,
    "isin": isin,
    "cusip": cusip,
    "exchange": exchange,
    "exchangeShortName": exchangeShortName,
    "industry": industry,
    "website": website,
    "description": description,
    "ceo": ceo,
    "sector": sector,
    "country": country,
    "fullTimeEmployees": fullTimeEmployees,
    "phone": phone,
    "address": address,
    "city": city,
    "state": state,
    "zip": zip,
    "dcfDiff": dcfDiff,
    "dcf": dcf,
    "image": image,
    "ipoDate": "${ipoDate.year.toString().padLeft(4, '0')}-${ipoDate.month.toString().padLeft(2, '0')}-${ipoDate.day.toString().padLeft(2, '0')}",
    "defaultImage": defaultImage,
    "isEtf": isEtf,
    "isActivelyTrading": isActivelyTrading,
    "isAdr": isAdr,
    "isFund": isFund,
  };
}

import '../../../constants/constants.dart';

import 'package:equatable/equatable.dart';

typedef ProductID = String;

class Product extends Equatable {
  const Product({
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.brandName,
    required this.description,
    required this.price,
    required this.availableQuantity,
    this.priceAfetDiscount,
    this.dicountpercent,
    this.avgRating = 0,
    this.numRatings = 0,
  });

  final ProductID id;
  final String imageUrl;
  final String title;
  final String brandName;
  final String description;
  final double price;
  final int availableQuantity;
  final double avgRating;
  final int numRatings;
  final double? priceAfetDiscount;
  final int? dicountpercent;

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] as String,
      imageUrl: map['imageUrl'] as String,
      title: map['title'] ?? '',
      brandName: map['brandName'] ?? '',
      priceAfetDiscount: map['priceAfetDiscount']?.toDouble() ?? 0.0,
      dicountpercent: map['dicountpercent']?.toInt() ?? 0,
      description: map['description'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
      availableQuantity: map['availableQuantity']?.toInt() ?? 0,
      avgRating: map['avgRating']?.toDouble() ?? 0.0,
      numRatings: map['numRatings']?.toInt() ?? 0,
    );
  }

  Map<String, dynamic> toMap() => {
        'id': id,
        'imageUrl': imageUrl,
        'title': title,
        'description': description,
        'brandName': brandName,
        'priceAfetDiscount': priceAfetDiscount,
        'dicountpercent': dicountpercent,
        'price': price,
        'availableQuantity': availableQuantity,
        'avgRating': avgRating,
        'numRatings': numRatings,
      };

  Product copyWith({
    ProductID? id,
    String? imageUrl,
    String? title,
    String? description,
    double? price,
    String? brandName,
    double? priceAfetDiscount,
    int? dicountpercent,
    int? availableQuantity,
    double? avgRating,
    int? numRatings,
  }) {
    return Product(
      id: id ?? this.id,
      imageUrl: imageUrl ?? this.imageUrl,
      title: title ?? this.title,
      brandName: brandName ?? this.brandName,
      priceAfetDiscount: priceAfetDiscount ?? this.priceAfetDiscount,
      dicountpercent: dicountpercent ?? this.dicountpercent,
      description: description ?? this.description,
      price: price ?? this.price,
      availableQuantity: availableQuantity ?? this.availableQuantity,
      avgRating: avgRating ?? this.avgRating,
      numRatings: numRatings ?? this.numRatings,
    );
  }

  @override
  List<Object?> get props => [
        id,
        imageUrl,
        title,
        brandName,
        description,
        dicountpercent,
        priceAfetDiscount,
        price,
        availableQuantity,
        avgRating,
        numRatings
      ];

  @override
  bool? get stringify => true;
}

List<Product> demoPopularProducts = [
  const Product(
    id: '1',
    imageUrl: productDemoImg1,
    title: "Mountain Warehouse for Women",
    price: 540,
    brandName: "Lipsy london",
    priceAfetDiscount: 420,
    dicountpercent: 20,
    description:
        "A cool gray cap in soft corduroy. Watch me.' By buying cotton products from Lindex, you’re supporting more responsibly...",
    availableQuantity: 4,
  ),
  const Product(
    id: '2',
    imageUrl: productDemoImg4,
    title: "Mountain Beta Warehouse",
    brandName: "Lipsy london",
    price: 800,
    description:
        "A cool gray cap in soft corduroy. Watch me.' By buying cotton products from Lindex, you’re supporting more responsibly...",
    availableQuantity: 0,
  ),
  const Product(
    id: '3',
    description:
        "A cool gray cap in soft corduroy. Watch me.' By buying cotton products from Lindex, you’re supporting more responsibly...",
    availableQuantity: 4,
    imageUrl: productDemoImg5,
    title: "FS - Nike Air Max 270 Really React",
    brandName: "Lipsy london",
    price: 650.62,
    priceAfetDiscount: 390.36,
    dicountpercent: 40,
  ),
  const Product(
    id: '4',
    imageUrl: productDemoImg6,
    title: "Green Poplin Ruched Front",
    description:
        "A cool gray cap in soft corduroy. Watch me.' By buying cotton products from Lindex, you’re supporting more responsibly...",
    availableQuantity: 4,
    brandName: "Lipsy london",
    price: 1264,
    priceAfetDiscount: 1200.8,
    dicountpercent: 5,
  ),
  const Product(
    id: '5',
    imageUrl: "https://i.imgur.com/tXyOMMG.png",
    title: "Green Poplin Ruched Front",
    brandName: "Lipsy london",
    description:
        "A cool gray cap in soft corduroy. Watch me.' By buying cotton products from Lindex, you’re supporting more responsibly...",
    availableQuantity: 4,
    price: 650.62,
    priceAfetDiscount: 390.36,
    dicountpercent: 40,
  ),
  const Product(
    id: '6',
    imageUrl: "https://i.imgur.com/h2LqppX.png",
    title: "white satin corset top",
    brandName: "Lipsy london",
    description:
        "A cool gray cap in soft corduroy. Watch me.' By buying cotton products from Lindex, you’re supporting more responsibly...",
    availableQuantity: 4,
    price: 1264,
    priceAfetDiscount: 1200.8,
    dicountpercent: 5,
  ),
];
List<Product> demoFlashSaleProducts = [
  const Product(
    id: '7',
    imageUrl: productDemoImg5,
    title: "FS - Nike Air Max 270 Really React",
    brandName: "Lipsy london",
    description:
        "A cool gray cap in soft corduroy. Watch me.' By buying cotton products from Lindex, you’re supporting more responsibly...",
    availableQuantity: 4,
    price: 650.62,
    priceAfetDiscount: 390.36,
    dicountpercent: 40,
  ),
  const Product(
    id: '8',
    imageUrl: productDemoImg6,
    title: "Green Poplin Ruched Front",
    brandName: "Lipsy london",
    description:
        "A cool gray cap in soft corduroy. Watch me.' By buying cotton products from Lindex, you’re supporting more responsibly...",
    availableQuantity: 4,
    price: 1264,
    priceAfetDiscount: 1200.8,
    dicountpercent: 5,
  ),
  const Product(
    id: '9',
    imageUrl: productDemoImg4,
    title: "Mountain Beta Warehouse",
    brandName: "Lipsy london",
    description:
        "A cool gray cap in soft corduroy. Watch me.' By buying cotton products from Lindex, you’re supporting more responsibly...",
    availableQuantity: 4,
    price: 800,
    priceAfetDiscount: 680,
    dicountpercent: 15,
  ),
];
List<Product> demoBestSellersProducts = [
  const Product(
    id: '10',
    imageUrl: "https://i.imgur.com/tXyOMMG.png",
    title: "Green Poplin Ruched Front",
    brandName: "Lipsy london",
    description:
        "A cool gray cap in soft corduroy. Watch me.' By buying cotton products from Lindex, you’re supporting more responsibly...",
    availableQuantity: 4,
    price: 650.62,
    priceAfetDiscount: 390.36,
    dicountpercent: 40,
  ),
  const Product(
    id: '11',
    imageUrl: "https://i.imgur.com/h2LqppX.png",
    title: "white satin corset top",
    brandName: "Lipsy london",
    description:
        "A cool gray cap in soft corduroy. Watch me.' By buying cotton products from Lindex, you’re supporting more responsibly...",
    availableQuantity: 4,
    price: 1264,
    priceAfetDiscount: 1200.8,
    dicountpercent: 5,
  ),
  const Product(
    id: '12',
    imageUrl: productDemoImg4,
    title: "Mountain Beta Warehouse",
    brandName: "Lipsy london",
    description:
        "A cool gray cap in soft corduroy. Watch me.' By buying cotton products from Lindex, you’re supporting more responsibly...",
    availableQuantity: 4,
    price: 800,
    priceAfetDiscount: 680,
    dicountpercent: 15,
  ),
];
List<Product> kidsProducts = [
  const Product(
    id: '13',
    imageUrl: "https://i.imgur.com/dbbT6PA.png",
    title: "Green Poplin Ruched Front",
    brandName: "Lipsy london",
    price: 650.62,
    description:
        "A cool gray cap in soft corduroy. Watch me.' By buying cotton products from Lindex, you’re supporting more responsibly...",
    availableQuantity: 4,
    priceAfetDiscount: 590.36,
    dicountpercent: 24,
  ),
  const Product(
    id: '14',
    imageUrl: "https://i.imgur.com/7fSxC7k.png",
    title: "Printed Sleeveless Tiered Swing Dress",
    description:
        "A cool gray cap in soft corduroy. Watch me.' By buying cotton products from Lindex, you’re supporting more responsibly...",
    availableQuantity: 4,
    brandName: "Lipsy london",
    price: 650.62,
  ),
  const Product(
    id: '15',
    imageUrl: "https://i.imgur.com/pXnYE9Q.png",
    title: "Ruffle-Sleeve Ponte-Knit Sheath ",
    description:
        "A cool gray cap in soft corduroy. Watch me.' By buying cotton products from Lindex, you’re supporting more responsibly...",
    availableQuantity: 4,
    brandName: "Lipsy london",
    price: 400,
  ),
  const Product(
    id: '16',
    imageUrl: "https://i.imgur.com/V1MXgfa.png",
    title: "Green Mountain Beta Warehouse",
    brandName: "Lipsy london",
    price: 400,
    description:
        "A cool gray cap in soft corduroy. Watch me.' By buying cotton products from Lindex, you’re supporting more responsibly...",
    availableQuantity: 4,
    priceAfetDiscount: 360,
    dicountpercent: 20,
  ),
  const Product(
    id: '17',
    imageUrl: "https://i.imgur.com/8gvE5Ss.png",
    title: "Printed Sleeveless Tiered Swing Dress",
    description:
        "A cool gray cap in soft corduroy. Watch me.' By buying cotton products from Lindex, you’re supporting more responsibly...",
    availableQuantity: 4,
    brandName: "Lipsy london",
    price: 654,
  ),
  const Product(
    id: '18',
    imageUrl: "https://i.imgur.com/cBvB5YB.png",
    title: "Mountain Beta Warehouse",
    description:
        "A cool gray cap in soft corduroy. Watch me.' By buying cotton products from Lindex, you’re supporting more responsibly...",
    availableQuantity: 4,
    brandName: "Lipsy london",
    price: 250,
  ),
];

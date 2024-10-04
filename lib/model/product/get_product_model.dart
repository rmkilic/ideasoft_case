class ProductModel {
  int? id;
  String? name;
  String? fullName;
  String? slug;
  String? sku;
  String? barcode;
  double? stockAmount;
  double? price1;
  Currency? currency;
  double? discount;
  int? discountType;
  double? moneyOrderDiscount;
  double? buyingPrice;
  String? marketPriceDetail;
  int? taxIncluded;
  int? tax;
  int? warranty;
  double? volumetricWeight;
  String? stockTypeLabel;
  int? customShippingDisabled;
  double? customShippingCost;
  String? distributor;
  int? hasGift;
  String? gift;
  int? status;
  int? hasOption;
  String? installmentThreshold;
  int? homeSortOrder;
  int? popularSortOrder;
  int? brandSortOrder;
  int? featuredSortOrder;
  int? campaignedSortOrder;
  int? newSortOrder;
  int? discountedSortOrder;
  int? categoryShowcaseStatus;
  int? midblockSortOrder;
  String? pageTitle;
  String? metaDescription;
  String? metaKeywords;
  String? canonicalUrl;
  dynamic parent;
  dynamic brand;
  dynamic detail;
  List<Category>? categories;
  dynamic prices;
  List<Images>? images;
  dynamic optionGroups;
  String? updatedAt;
  String? createdAt;

  ProductModel(
      {this.id,
      this.name,
      this.fullName,
      this.slug,
      this.sku,
      this.barcode,
      this.stockAmount,
      this.price1,
      this.currency,
      this.discount,
      this.discountType,
      this.moneyOrderDiscount,
      this.buyingPrice,
      this.marketPriceDetail,
      this.taxIncluded,
      this.tax,
      this.warranty,
      this.volumetricWeight,
      this.stockTypeLabel,
      this.customShippingDisabled,
      this.customShippingCost,
      this.distributor,
      this.hasGift,
      this.gift,
      this.status,
      this.hasOption,
      this.installmentThreshold,
      this.homeSortOrder,
      this.popularSortOrder,
      this.brandSortOrder,
      this.featuredSortOrder,
      this.campaignedSortOrder,
      this.newSortOrder,
      this.discountedSortOrder,
      this.categoryShowcaseStatus,
      this.midblockSortOrder,
      this.pageTitle,
      this.metaDescription,
      this.metaKeywords,
      this.canonicalUrl,
      this.parent,
      this.brand,
      this.detail,
      this.categories,
      this.prices,
      this.images,
      this.optionGroups,
      this.updatedAt,
      this.createdAt});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    fullName = json['fullName'];
    slug = json['slug'];
    sku = json['sku'];
    barcode = json['barcode'];
    stockAmount = json['stockAmount'];
    price1 = json['price1'];
    currency = json['currency'] != null
        ? new Currency.fromJson(json['currency'])
        : null;
    discount = json['discount'];
    discountType = json['discountType'];
    moneyOrderDiscount = json['moneyOrderDiscount'];
    buyingPrice = json['buyingPrice'];
    marketPriceDetail = json['marketPriceDetail'];
    taxIncluded = json['taxIncluded'];
    tax = json['tax'];
    warranty = json['warranty'];
    volumetricWeight = json['volumetricWeight'];
    stockTypeLabel = json['stockTypeLabel'];
    customShippingDisabled = json['customShippingDisabled'];
    customShippingCost = json['customShippingCost'];
    distributor = json['distributor'];
    hasGift = json['hasGift'];
    gift = json['gift'];
    status = json['status'];
    hasOption = json['hasOption'];
    installmentThreshold = json['installmentThreshold'];
    homeSortOrder = json['homeSortOrder'];
    popularSortOrder = json['popularSortOrder'];
    brandSortOrder = json['brandSortOrder'];
    featuredSortOrder = json['featuredSortOrder'];
    campaignedSortOrder = json['campaignedSortOrder'];
    newSortOrder = json['newSortOrder'];
    discountedSortOrder = json['discountedSortOrder'];
    categoryShowcaseStatus = json['categoryShowcaseStatus'];
    midblockSortOrder = json['midblockSortOrder'];
    pageTitle = json['pageTitle'];
    metaDescription = json['metaDescription'];
    metaKeywords = json['metaKeywords'];
    canonicalUrl = json['canonicalUrl'];
    parent = json['parent'];
    brand = json['brand'];
    detail = json['detail'];
    if (json['categories'] != null) {
      categories = <Category>[];
      json['categories'].forEach((v) {
        categories!.add(Category.fromJson(v));
      });
    }

    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }

    updatedAt = json['updatedAt'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['fullName'] = this.fullName;
    data['slug'] = this.slug;
    data['sku'] = this.sku;
    data['barcode'] = this.barcode;
    data['stockAmount'] = this.stockAmount;
    data['price1'] = this.price1;
    if (this.currency != null) {
      data['currency'] = this.currency!.toJson();
    }
    data['discount'] = this.discount;
    data['discountType'] = this.discountType;
    data['moneyOrderDiscount'] = this.moneyOrderDiscount;
    data['buyingPrice'] = this.buyingPrice;
    data['marketPriceDetail'] = this.marketPriceDetail;
    data['taxIncluded'] = this.taxIncluded;
    data['tax'] = this.tax;
    data['warranty'] = this.warranty;
    data['volumetricWeight'] = this.volumetricWeight;
    data['stockTypeLabel'] = this.stockTypeLabel;
    data['customShippingDisabled'] = this.customShippingDisabled;
    data['customShippingCost'] = this.customShippingCost;
    data['distributor'] = this.distributor;
    data['hasGift'] = this.hasGift;
    data['gift'] = this.gift;
    data['status'] = this.status;
    data['hasOption'] = this.hasOption;
    data['installmentThreshold'] = this.installmentThreshold;
    data['homeSortOrder'] = this.homeSortOrder;
    data['popularSortOrder'] = this.popularSortOrder;
    data['brandSortOrder'] = this.brandSortOrder;
    data['featuredSortOrder'] = this.featuredSortOrder;
    data['campaignedSortOrder'] = this.campaignedSortOrder;
    data['newSortOrder'] = this.newSortOrder;
    data['discountedSortOrder'] = this.discountedSortOrder;
    data['categoryShowcaseStatus'] = this.categoryShowcaseStatus;
    data['midblockSortOrder'] = this.midblockSortOrder;
    data['pageTitle'] = this.pageTitle;
    data['metaDescription'] = this.metaDescription;
    data['metaKeywords'] = this.metaKeywords;
    data['canonicalUrl'] = this.canonicalUrl;
    data['parent'] = this.parent;
    data['brand'] = this.brand;
    data['detail'] = this.detail;
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    if (this.prices != null) {
      data['prices'] = this.prices!.map((v) => v.toJson()).toList();
    }
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    if (this.optionGroups != null) {
      data['optionGroups'] = this.optionGroups!.map((v) => v.toJson()).toList();
    }
    data['updatedAt'] = this.updatedAt;
    data['createdAt'] = this.createdAt;
    return data;
  }
}

class Currency {
  int? id;
  String? label;
  String? abbr;

  Currency({this.id, this.label, this.abbr});

  Currency.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    label = json['label'];
    abbr = json['abbr'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['label'] = this.label;
    data['abbr'] = this.abbr;
    return data;
  }
}

class Images {
  int? id;
  String? filename;
  String? extension;
  String? thumbUrl;
  String? originalUrl;

  Images(
      {this.id,
      this.filename,
      this.extension,
      this.thumbUrl,
      this.originalUrl});

  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    filename = json['filename'];
    extension = json['extension'];
    thumbUrl = json['thumbUrl'];
    originalUrl = json['originalUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['filename'] = this.filename;
    data['extension'] = this.extension;
    data['thumbUrl'] = this.thumbUrl;
    data['originalUrl'] = this.originalUrl;
    return data;
  }
}

class Category {
  int? id;
  String? name;
  int? sortOrder;
  String? showcaseSortOrder;
  String? pageTitle;
  String? metaDescription;
  String? metaKeywords;
  String? canonicalUrl;
  String? tree;
  String? imageUrl;

  Category(
      {this.id,
      this.name,
      this.sortOrder,
      this.showcaseSortOrder,
      this.pageTitle,
      this.metaDescription,
      this.metaKeywords,
      this.canonicalUrl,
      this.tree,
      this.imageUrl});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    sortOrder = json['sortOrder'];
    showcaseSortOrder = json['showcaseSortOrder'];
    pageTitle = json['pageTitle'];
    metaDescription = json['metaDescription'];
    metaKeywords = json['metaKeywords'];
    canonicalUrl = json['canonicalUrl'];
    tree = json['tree'];
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['sortOrder'] = this.sortOrder;
    data['showcaseSortOrder'] = this.showcaseSortOrder;
    data['pageTitle'] = this.pageTitle;
    data['metaDescription'] = this.metaDescription;
    data['metaKeywords'] = this.metaKeywords;
    data['canonicalUrl'] = this.canonicalUrl;
    data['tree'] = this.tree;
    data['imageUrl'] = this.imageUrl;
    return data;
  }
}


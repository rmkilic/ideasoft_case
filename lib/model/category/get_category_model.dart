class CategoryModel {
  int? id;
  String? name;
  String? slug;
  int? sortOrder;
  int? status;
  String? distributor;
  String? distributorCode;
  double? percent;
  String? imageFile;
  int? displayShowcaseContent;
  String? showcaseContent;
  int? showcaseContentDisplayType;
  int? displayShowcaseFooterContent;
  String? showcaseFooterContent;
  int? showcaseFooterContentDisplayType;
  int? hasChildren;
  String? pageTitle;
  String? metaDescription;
  String? metaKeywords;
  String? canonicalUrl;
  String? tree;
  String? attachment;
  Parent? parent;
  String? imageUrl;
  int? isCombine;
  Parent? seoSetting;
  String? createdAt;

  CategoryModel(
      {this.id,
      this.name,
      this.slug,
      this.sortOrder,
      this.status,
      this.distributor,
      this.distributorCode,
      this.percent,
      this.imageFile,
      this.displayShowcaseContent,
      this.showcaseContent,
      this.showcaseContentDisplayType,
      this.displayShowcaseFooterContent,
      this.showcaseFooterContent,
      this.showcaseFooterContentDisplayType,
      this.hasChildren,
      this.pageTitle,
      this.metaDescription,
      this.metaKeywords,
      this.canonicalUrl,
      this.tree,
      this.attachment,
      this.parent,
      this.imageUrl,
      this.isCombine,
      this.seoSetting,
      this.createdAt});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    sortOrder = json['sortOrder'];
    status = json['status'];
    distributor = json['distributor'];
    distributorCode = json['distributorCode'];
    percent = json['percent'];
    imageFile = json['imageFile'];
    displayShowcaseContent = json['displayShowcaseContent'];
    showcaseContent = json['showcaseContent'];
    showcaseContentDisplayType = json['showcaseContentDisplayType'];
    displayShowcaseFooterContent = json['displayShowcaseFooterContent'];
    showcaseFooterContent = json['showcaseFooterContent'];
    showcaseFooterContentDisplayType = json['showcaseFooterContentDisplayType'];
    hasChildren = json['hasChildren'];
    pageTitle = json['pageTitle'];
    metaDescription = json['metaDescription'];
    metaKeywords = json['metaKeywords'];
    canonicalUrl = json['canonicalUrl'];
    tree = json['tree'];
    attachment = json['attachment'];
    parent =
        json['parent'] != null ? new Parent.fromJson(json['parent']) : null;

    imageUrl = json['imageUrl'];
    isCombine = json['isCombine'];
    seoSetting = json['seoSetting'] != null
        ? new Parent.fromJson(json['seoSetting'])
        : null;
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['sortOrder'] = this.sortOrder;
    data['status'] = this.status;
    data['distributor'] = this.distributor;
    data['distributorCode'] = this.distributorCode;
    data['percent'] = this.percent;
    data['imageFile'] = this.imageFile;
    data['displayShowcaseContent'] = this.displayShowcaseContent;
    data['showcaseContent'] = this.showcaseContent;
    data['showcaseContentDisplayType'] = this.showcaseContentDisplayType;
    data['displayShowcaseFooterContent'] = this.displayShowcaseFooterContent;
    data['showcaseFooterContent'] = this.showcaseFooterContent;
    data['showcaseFooterContentDisplayType'] =
        this.showcaseFooterContentDisplayType;
    data['hasChildren'] = this.hasChildren;
    data['pageTitle'] = this.pageTitle;
    data['metaDescription'] = this.metaDescription;
    data['metaKeywords'] = this.metaKeywords;
    data['canonicalUrl'] = this.canonicalUrl;
    data['tree'] = this.tree;
    data['attachment'] = this.attachment;
    if (this.parent != null) {
      data['parent'] = this.parent!.toJson();
    }

    data['imageUrl'] = this.imageUrl;
    data['isCombine'] = this.isCombine;
    if (this.seoSetting != null) {
      data['seoSetting'] = this.seoSetting!.toJson();
    }
    data['createdAt'] = this.createdAt;
    return data;
  }
}

class Parent {
  List<String>? property1;
  List<String>? property2;

  Parent({this.property1, this.property2});

  Parent.fromJson(Map<String, dynamic> json) {
    property1 = json['property1'].cast<String>();
    property2 = json['property2'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['property1'] = this.property1;
    data['property2'] = this.property2;
    return data;
  }
}

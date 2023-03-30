class ProductsDataModel {
  String? code;
  String? message;
  Data? data;

  ProductsDataModel({this.code, this.message, this.data});

  ProductsDataModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<Products>? products;
  String? category;
  dynamic maxSellingPrice;
  dynamic minSellingPrice;
  List<String>? subCategoryIds;
  String? headerSearch;
  String? stock;
  dynamic myRangeMin;
  dynamic myRangeMax;
  String? sortby;
  Pagination? pagination;

  Data(
      {this.products,
      this.category,
      this.maxSellingPrice,
      this.minSellingPrice,
      this.subCategoryIds,
      this.headerSearch,
      this.stock,
      this.myRangeMin,
      this.myRangeMax,
      this.sortby,
      this.pagination});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
    category = json['category'];
    maxSellingPrice = json['maxSellingPrice'];
    minSellingPrice = json['minSellingPrice'];
    subCategoryIds = json['subCategoryIds'].cast<String>();
    headerSearch = json['header_search'];
    stock = json['stock'];
    myRangeMin = json['my_range_min'];
    myRangeMax = json['my_range_max'];
    sortby = json['sortby'];
    pagination = json['pagination'] != null
        ? new Pagination.fromJson(json['pagination'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    data['category'] = this.category;
    data['maxSellingPrice'] = this.maxSellingPrice;
    data['minSellingPrice'] = this.minSellingPrice;
    data['subCategoryIds'] = this.subCategoryIds;
    data['header_search'] = this.headerSearch;
    data['stock'] = this.stock;
    data['my_range_min'] = this.myRangeMin;
    data['my_range_max'] = this.myRangeMax;
    data['sortby'] = this.sortby;
    if (this.pagination != null) {
      data['pagination'] = this.pagination!.toJson();
    }
    return data;
  }
}

class Products {
  String? id;
  String? title;
  String? categoryId;
  String? subCategoryId;
  String? brandId;
  String? brandName;
  String? productVariantId;
  String? price;
  String? sellingPrice;
  String? discount;
  VariantDetail? variantDetail;
  SubVariantDetail? subVariantDetail;
  String? singleImage;
  String? ratingAverage;
  String? ratingCount;
  dynamic wishlistExist;

  Products(
      {this.id,
      this.title,
      this.categoryId,
      this.subCategoryId,
      this.brandId,
      this.brandName,
      this.productVariantId,
      this.price,
      this.sellingPrice,
      this.discount,
      this.variantDetail,
      this.subVariantDetail,
      this.singleImage,
      this.ratingAverage,
      this.ratingCount,
      this.wishlistExist});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    categoryId = json['category_id'];
    subCategoryId = json['sub_category_id'];
    brandId = json['brand_id'];
    brandName = json['brand_name'];
    productVariantId = json['product_variant_id'];
    price = json['price'];
    sellingPrice = json['selling_price'];
    discount = json['discount'];
    variantDetail = json['variant_detail'] != null
        ? new VariantDetail.fromJson(json['variant_detail'])
        : null;
    subVariantDetail = json['sub_variant_detail'] != null
        ? new SubVariantDetail.fromJson(json['sub_variant_detail'])
        : null;
    singleImage = json['single_image'];
    ratingAverage = json['rating_average'];
    ratingCount = json['rating_count'];
    wishlistExist = json['wishlistExist'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['category_id'] = this.categoryId;
    data['sub_category_id'] = this.subCategoryId;
    data['brand_id'] = this.brandId;
    data['brand_name'] = this.brandName;
    data['product_variant_id'] = this.productVariantId;
    data['price'] = this.price;
    data['selling_price'] = this.sellingPrice;
    data['discount'] = this.discount;
    if (this.variantDetail != null) {
      data['variant_detail'] = this.variantDetail!.toJson();
    }
    if (this.subVariantDetail != null) {
      data['sub_variant_detail'] = this.subVariantDetail!.toJson();
    }
    data['single_image'] = this.singleImage;
    data['rating_average'] = this.ratingAverage;
    data['rating_count'] = this.ratingCount;
    data['wishlistExist'] = this.wishlistExist;
    return data;
  }
}

class VariantDetail {
  int? id;
  String? name;
  int? status;
  Null? deletedAt;
  String? createdAt;
  String? updatedAt;
  int? type;

  VariantDetail(
      {this.id,
      this.name,
      this.status,
      this.deletedAt,
      this.createdAt,
      this.updatedAt,
      this.type});

  VariantDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['status'] = this.status;
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['type'] = this.type;
    return data;
  }
}

class SubVariantDetail {
  int? id;
  int? variantId;
  String? name;
  int? sequenceNo;
  String? code;
  int? status;
  Null? deletedAt;
  String? createdAt;
  String? updatedAt;

  SubVariantDetail(
      {this.id,
      this.variantId,
      this.name,
      this.sequenceNo,
      this.code,
      this.status,
      this.deletedAt,
      this.createdAt,
      this.updatedAt});

  SubVariantDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    variantId = json['variant_id'];
    name = json['name'];
    sequenceNo = json['sequence_no'];
    code = json['code'];
    status = json['status'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['variant_id'] = this.variantId;
    data['name'] = this.name;
    data['sequence_no'] = this.sequenceNo;
    data['code'] = this.code;
    data['status'] = this.status;
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Pagination {
  int? currentPage;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  String? nextPageUrl;
  String? path;
  int? perPage;
  dynamic prevPageUrl;
  int? to;
  int? total;

  Pagination(
      {this.currentPage,
      this.firstPageUrl,
      this.from,
      this.lastPage,
      this.lastPageUrl,
      this.nextPageUrl,
      this.path,
      this.perPage,
      this.prevPageUrl,
      this.to,
      this.total});

  Pagination.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    data['first_page_url'] = this.firstPageUrl;
    data['from'] = this.from;
    data['last_page'] = this.lastPage;
    data['last_page_url'] = this.lastPageUrl;
    data['next_page_url'] = this.nextPageUrl;
    data['path'] = this.path;
    data['per_page'] = this.perPage;
    data['prev_page_url'] = this.prevPageUrl;
    data['to'] = this.to;
    data['total'] = this.total;
    return data;
  }
}

class ImageModel {
  String? sId;
  String? name;
  String? alternativeText;
  String? caption;
  String? hash;
  String? ext;
  String? mime;
  double? size;
  int? width;
  int? height;
  String? url;
  // Formats? formats;
  String? provider;
  List<String>? related;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? id;

  ImageModel(
      {this.sId,
      this.name,
      this.alternativeText,
      this.caption,
      this.hash,
      this.ext,
      this.mime,
      this.size,
      this.width,
      this.height,
      this.url,
      // this.formats,
      this.provider,
      this.related,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.id});

  ImageModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    alternativeText = json['alternativeText'];
    caption = json['caption'];
    hash = json['hash'];
    ext = json['ext'];
    mime = json['mime'];
    size = json['size'];
    width = json['width'];
    height = json['height'];
    url = json['url'];
    // formats =
    //     json['formats'] != null ? new Formats.fromJson(json['formats']) : null;
    provider = json['provider'];
    related = json['related'].cast<String>();
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['alternativeText'] = this.alternativeText;
    data['caption'] = this.caption;
    data['hash'] = this.hash;
    data['ext'] = this.ext;
    data['mime'] = this.mime;
    data['size'] = this.size;
    data['width'] = this.width;
    data['height'] = this.height;
    data['url'] = this.url;
    // if (this.formats != null) {
    //   data['formats'] = this.formats!.toJson();
    // }
    data['provider'] = this.provider;
    data['related'] = this.related;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['id'] = this.id;
    return data;
  }
}

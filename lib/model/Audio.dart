class Audio {
  String? sId;
  String? name;
  String? alternativeText;
  String? caption;
  String? hash;
  String? ext;
  String? mime;
  double? size;
  String? url;
  String? provider;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? id;

  Audio(
      {this.sId,
      this.name,
      this.alternativeText,
      this.caption,
      this.hash,
      this.ext,
      this.mime,
      this.size,
      this.url,
      this.provider,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.id});

  Audio.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    alternativeText = json['alternativeText'];
    caption = json['caption'];
    hash = json['hash'];
    ext = json['ext'];
    mime = json['mime'];
    size = json['size'];
    url = json['url'];
    provider = json['provider'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    id = json['id'];
  }
}

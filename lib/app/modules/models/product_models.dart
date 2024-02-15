class ProductModels {
  String? id;
  String? name;
  String? description;
  String? image;
  double? hargaModal;
  double? hargaJual;
  int? kuantitas;

  ProductModels({
    this.id,
    this.name,
    this.description,
    this.image,
    this.hargaJual,
    this.hargaModal,
    this.kuantitas,
  });

  Map<String, dynamic> tojson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'image': image,
      'hargaModal': hargaModal,
      'hargaJual': hargaJual,
      'kuantitas': kuantitas,
    };
  }

  factory ProductModels.fromJson(Map<String, dynamic> json) {
    return ProductModels(
      id: json['id'], // handle nullable id
      name: json['name'],
      description: json['description'],
      image: json['image'],
      hargaJual: json['hargaJual'],
    );
  }
}

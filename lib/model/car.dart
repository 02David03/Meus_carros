class Car {
  String anoFabricacao;
  String anoModelo;
  String foto;
  String marca;
  String modelo;
  String placa;

  Car({
      this.anoFabricacao,
      this.anoModelo,
      this.foto,
      this.marca,
      this.modelo,
      this.placa
  });

  Car.fromMap(Map<String, dynamic> map) :
        this.anoFabricacao = map['anoFabricacao'],
        this.anoModelo = map['anoModelo'],
        this.foto = map['foto'],
        this.marca = map['marca'],
        this.modelo = map['modelo'],
        this.placa = map['placa'];
}
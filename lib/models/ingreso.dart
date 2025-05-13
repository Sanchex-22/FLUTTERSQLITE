class Ingreso {
  int? id;
  String descripcion;
  double monto;
  String fecha;

  Ingreso({this.id, required this.descripcion, required this.monto, required this.fecha});

  Map<String, dynamic> toMap() => {
    'id': id,
    'descripcion': descripcion,
    'monto': monto,
    'fecha': fecha,
  };

  factory Ingreso.fromMap(Map<String, dynamic> map) => Ingreso(
    id: map['id'],
    descripcion: map['descripcion'],
    monto: map['monto'],
    fecha: map['fecha'],
  );
}
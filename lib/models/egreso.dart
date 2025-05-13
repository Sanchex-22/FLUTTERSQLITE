class Egreso {
  final int? id;
  final String descripcion;
  final double monto;
  final String fecha;

  Egreso({this.id, required this.descripcion, required this.monto, required this.fecha});

  factory Egreso.fromMap(Map<String, dynamic> json) => Egreso(
    id: json['id'],
    descripcion: json['descripcion'],
    monto: json['monto'],
    fecha: json['fecha'],
  );

  Map<String, dynamic> toMap() => {
    'id': id,
    'descripcion': descripcion,
    'monto': monto,
    'fecha': fecha,
  };
}

class Producto {
  final int? id;
  final String nombre;
  final int cantidad;
  final double precio;

  Producto({this.id, required this.nombre, required this.cantidad, required this.precio});

  factory Producto.fromMap(Map<String, dynamic> json) => Producto(
    id: json['id'],
    nombre: json['nombre'],
    cantidad: json['cantidad'],
    precio: json['precio'],
  );

  Map<String, dynamic> toMap() => {
    'id': id,
    'nombre': nombre,
    'cantidad': cantidad,
    'precio': precio,
  };
}

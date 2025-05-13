class Cliente {
  final int? id;
  final String nombre;
  final String telefono;
  final String correo;

  Cliente({this.id, required this.nombre, required this.telefono, required this.correo});

  factory Cliente.fromMap(Map<String, dynamic> json) => Cliente(
    id: json['id'],
    nombre: json['nombre'],
    telefono: json['telefono'],
    correo: json['correo'],
  );

  Map<String, dynamic> toMap() => {
    'id': id,
    'nombre': nombre,
    'telefono': telefono,
    'correo': correo,
  };
}

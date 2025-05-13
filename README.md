# AZ Íntima - App de Gestión

AZ Íntima es una aplicación móvil desarrollada en Flutter para la gestión de ingresos, egresos, clientes e inventario. Está diseñada para facilitar el control financiero y operativo de un negocio desde un dispositivo móvil.

## 📦 Características

- Registro y visualización de **ingresos** y **egresos**.
- Gestión de **inventario** y **productos**.
- Administración de **clientes**.
- Almacenamiento de datos local usando **SQLite**.
- Preparada para integración con **Firebase** (si aplica).

## 🚀 Instalación

### 1. Clonar el repositorio

```bash
git clone https://github.com/usuario/az-intima.git
cd az-intima
```

### 2. Instalar las dependencias
```bash
flutter pub get
```

### 3. Configurar archivos locales (si aplica)

Si estás usando Firebase, asegúrate de agregar estos archivos:

android/app/google-services.json

ios/Runner/GoogleService-Info.plist

lib/firebase_options.dart (puedes generarlo con el comando flutterfire configure)

Si usas variables de entorno, crea un archivo .env con el contenido adecuado.

### 4. Ejecutar la app
```bash
flutter run
```

🗃️ Base de datos local
Esta app utiliza SQLite a través del paquete sqflite. Los datos se almacenan localmente en el dispositivo.

🛠️ Herramientas usadas
Flutter

Dart

SQLite (sqflite)

Firebase (opcional)

Provider (o Riverpod, GetX, según el estado de tu proyecto)
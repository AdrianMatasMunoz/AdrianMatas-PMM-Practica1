import 'GPSLocation.dart';

abstract class Vehicle with GPSLocation {
  String id;
  int bateriaPercentatge = 100;
  bool enUs = false;
  double preuPerMinut;

  Vehicle(this.id, this.preuPerMinut);

  String estatBateria() {
    switch (this.bateriaPercentatge) {
      case >= 80:
        return "Alta";
      case >= 20 && <= 79:
        return "Mitjana";
      default:
        return "Crítica (Requereix càrrega)";
    }
  }

  double calcularCostReserva(int minuts);

  @override
  String toString() {
    return "Vehicle $id ($bateriaPercentatge% de bateria) | ${enUs ? "En us" : "Lliure"} | $preuPerMinut€/min";
  }
}

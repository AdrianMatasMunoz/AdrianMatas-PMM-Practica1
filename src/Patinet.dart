import 'Vehicle.dart';
import 'User.dart';

class Patinet extends Vehicle {
  int velocitatMaxima;

  Patinet(super.id, super.preuPerMinut, this.velocitatMaxima);

  @override
  double calcularCostReserva(int minuts, [User? user]) =>
      (minuts * this.preuPerMinut) * ((user != null && user.esVIP) ? 0.9 : 1);

  @override
  String toString() {
    return "Patinet $id ($bateriaPercentatge% de bateria) | ${enUs ? "En us" : "Lliure"} | Limit: $velocitatMaxima km/h |$preuPerMinut€/min";
  }
}

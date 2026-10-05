import 'Vehicle.dart';

class Cotxe extends Vehicle {
  static const double SUPLEMENT_FILTRE_ECOLOGIC = 2;

  int places;
  bool requereixLlicencia;

  Cotxe(super.id, super.preuPerMinut, this.places, this.requereixLlicencia);

  @override
  double calcularCostReserva(int minuts) =>
      (minuts * this.preuPerMinut) + SUPLEMENT_FILTRE_ECOLOGIC;

  @override
  String toString() {
    return "Cotxe $id ($bateriaPercentatge% de bateria) ($places places) ${requereixLlicencia ? "[REQUEREIX LLICENCIA]" : ""} | ${enUs ? "En us" : "Lliure"} | $preuPerMinut€/min + $SUPLEMENT_FILTRE_ECOLOGIC€";
  }
}

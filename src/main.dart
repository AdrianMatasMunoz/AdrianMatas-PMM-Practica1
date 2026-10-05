import 'dart:math';

import 'Cotxe.dart';
import 'Patinet.dart';
import 'User.dart';
import 'Vehicle.dart';

final Random RAND = new Random();

void main() {
  // Inicialitzacio

  List<Vehicle> flota = [];
  for (int i = 0; i < 5; i++) {
    Vehicle vehicle;
    i < 3
        ? vehicle = new Patinet("v$i", 0.5, 25)
        : vehicle = new Cotxe("v$i", 1, 5, true);
    vehicle.enUs = RAND.nextBool();
    vehicle.bateriaPercentatge = RAND.nextInt(101);
    vehicle.actualitzarUbicacio(
      RAND.nextDouble() * 180 - 90,
      RAND.nextDouble() * 360 - 180,
    );
    flota.add(vehicle);
  }

  // Cerca i Filtres
  print("Vehicle amb mes bateria: ");
  print(
    flota.reduce(
      (value, element) =>
          ((value.bateriaPercentatge > element.bateriaPercentatge)
          ? value
          : element),
    ),
  );
  print("\nVehicle amb bateria major al 20% que estiguin lliures: ");
  print(flota.where((v) => !v.enUs && v.bateriaPercentatge > 20).toList());

  // Simulacio d'us i destructuracio de Records
  User user = User.nou(
    id: "u000",
    nom: "Adrian Matas",
    correu: "adrianmatas@paucasesnovescifp.cat",
  );
  user.esVIP = true;
  Patinet patinetReservat = new Patinet("v6", 0.5, 25);
  double costReserva = patinetReservat.calcularCostReserva(15, user);
  print(
    "\nCost del patinet reservat (amb VIP) durant 15 minuts: ${costReserva}€",
  );
  patinetReservat.actualitzarUbicacio(
    RAND.nextDouble() * 180 - 90,
    RAND.nextDouble() * 360 - 180,
  );
  var (lat, lng) = patinetReservat.obtenirCoordenades();
  print("Coordenades del patinet: ($lat, $lng)");

  // Maneig d'Errors
  try {
    user.recarregarSaldo(-10);
  } catch (err) {
    print("\nS'ha atrapat un error correctament:\n$err");
  }
  print("El programa segueix funcionant.");
}

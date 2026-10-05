typedef LocationRecord = (double lat, double lng);

mixin GPSLocation {
  double latitud = 0, longitud = 0;

  void actualitzarUbicacio(double lat, double lng) {
    this.latitud = lat;
    this.longitud = lng;
  }

  LocationRecord obtenirCoordenades() => (latitud, longitud);
}

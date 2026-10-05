class User {
  String _id;
  String _nomComplet;
  double _saldo;
  String correu;
  bool esVIP;

  User(
    this._id,
    this._nomComplet,
    this._saldo,
    this.correu, [
    this.esVIP = false,
  ]);
  User.nou({required String id, required String nom, required String correu})
    : this(id, nom, 0, correu);

  double get saldo => _saldo;
  String get id => _id;

  void recarregarSaldo(double quantitat) {
    if (quantitat <= 0) {
      throw ArgumentError("El saldo a recarregar ha de ser major que 0.");
    }
    _saldo += quantitat;
  }

  @override
  String toString() {
    return "$_nomComplet ($_id) ${esVIP ? "[VIP]" : ""} | $correu | $saldo€";
  }
}

class Usuario {
  String _nome;
  String _email;
  String _senha;

  Usuario(this._nome, this._email, this._senha);

  // Getters
  String get nome => _nome;
  String get email => _email;
  String get senha => _senha;

  // Setters
  set nome(String nome) {
    _nome = nome;
  }

  set email(String email) {
    _email = email;
  }

  set senha(String senha) {
    _senha = senha;
  }
}

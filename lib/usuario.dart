class Usuario {
  String _email;
  String _senha;

  Usuario(this._email, this._senha);

  // Métodos getter e setter para o email
  String get email => _email;
  set email(String value) => _email = value;

  // Métodos getter e setter para a senha
  String get senha => _senha;
  set senha(String value) => _senha = value;
}

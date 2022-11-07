class Acesso {
  static int valorTipoUsuario = 0;
  static tipoUsuario(String ator) {
    List<String> atores = ["Visitante", "Cliente", "Funcionário", "Gerente"];
    if (atores.contains(ator)) {
      valorTipoUsuario = atores.indexOf(ator);
    }
  }
}

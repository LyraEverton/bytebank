import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/material.dart';

const _tituloAppBar = "Criando Transferência";
const _rotuloCampoValor = "Valor";
const _dicaCampoValor ="0.00";

const _rotuloCampoConta = "Número da Conta";
const _dicaCampoConta = "XXXXX-X";

const _textBotaoConfirmar = "Confirmar";

class FormularioTransferencia extends StatefulWidget {
  final TextEditingController _controladorCampoNumeroConta =
    TextEditingController();
  final TextEditingController _controladorCampoValor = 
    TextEditingController();

  @override
  State<StatefulWidget> createState() {
    return FormularioTransferenciaState();
  }
}
class FormularioTransferenciaState extends State<FormularioTransferencia>{
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),
      body: SingleChildScrollView(
              child: Column(
          children: <Widget>[
            Editor(
              controlador: widget._controladorCampoNumeroConta,
              dica: _dicaCampoConta,
              rotulo: _rotuloCampoConta,
            ),
            Editor(
              controlador: widget._controladorCampoValor,
              dica: _dicaCampoValor,
              rotulo: _rotuloCampoValor,
              icone: Icons.monetization_on,
            ),
            RaisedButton(
              child: Text(_textBotaoConfirmar),
              onPressed: () => _criaTransferencia(context),
            ),
          ],
        ),
      ),
    );
  }
    void _criaTransferencia(BuildContext context) {
    final int numeroConta = int.tryParse(widget._controladorCampoNumeroConta.text);
    final double valor = double.tryParse(widget._controladorCampoValor.text);

    if (numeroConta != null && valor != null) {
      final transferenciaCriada = Transferencia(valor, numeroConta);
      Navigator.pop(context, transferenciaCriada);
    }
  }

}
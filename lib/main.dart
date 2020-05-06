import 'package:flutter/material.dart';
//
void main() =>runApp(BytebankApp());

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListaTransferencia(),
      ),
    );
  }
}

class FormularioTransferencia extends StatelessWidget {
  
  final TextEditingController _controladorCampoNumeroConta = TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text('Criando Área de Transferência'), 
      ),
      body: Column(
        children: <Widget>[
          Editor(
            controlador: _controladorCampoNumeroConta, 
            dica: '0000', 
            rotulo: 'numero da conta',
          ),
          Editor(
            controlador: _controladorCampoValor,
            dica: '0.00',
            rotulo: 'Valor',
            icone: Icons.monetization_on,
          ),
          RaisedButton(
            child:Text('Submit'),
            onPressed: () => _criaTransferencia(context),
          )
        ],
      ), 
    );
  }

  void _criaTransferencia(BuildContext context) {
    final int numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
    final double valor = double.tryParse(_controladorCampoValor.text);
    
    if(numeroConta != null && valor != null){
      final transferenciaCriada =  Transferencia(valor, numeroConta);
      debugPrint('Criando transferencia');
      Navigator.pop(context, transferenciaCriada);
    }
  }
}

class ListaTransferencia extends StatelessWidget{
  final List<Transferencia> _transferencias = List();
  @override
  Widget build(BuildContext context) {
  return Scaffold(
      appBar: AppBar(
        title: Text('Transferências'),
      ),
      body: ListView.builder(
        itemCount: _transferencias.length,
        itemBuilder: (context, indice){
          final transferencia = _transferencias[indice];

          return ItemTransferencia(transferencia);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {  
          final Future<Transferencia> future = Navigator.push(context, MaterialPageRoute(builder:(context) {
           return FormularioTransferencia();
          }));
          future.then((transferenciaRecebida){
          _transferencias.add(transferenciaRecebida);
          });
        },
      ),
      
    );
  }
}

class ItemTransferencia extends StatelessWidget{
  final Transferencia _transferencia;

  ItemTransferencia(this._transferencia);
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_transferencia.valor.toString()),
        subtitle: Text(_transferencia.numeroConta.toString()),
      ),
    );
  }
}

class Transferencia {
  final double valor;
  final int numeroConta;

  Transferencia(this.valor, this.numeroConta);

  @override
  String toString(){
    return 'transferencia{valor: $valor, numeroConta: $numeroConta}';
  }

  }
  class Editor extends StatelessWidget {
    final TextEditingController controlador;
    final String rotulo;
    final String dica;
    final IconData icone;

    Editor({this.controlador, this.rotulo, this.dica, this.icone});
    @override
    Widget build(BuildContext context) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: controlador,
          style: TextStyle(fontSize: 24.0),
          decoration: InputDecoration(
            icon: icone != null ? Icon(icone) : null,
            labelText: rotulo,
            hintText: dica,
          ),
          keyboardType: TextInputType.number,
        ),
      );
    }
  }

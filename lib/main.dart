import 'package:flutter/material.dart';
//
void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('Transferências'),
      ),
      body: ListaTransferencia(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
      ),
    ) ,
  ));
}

class ListaTransferencia extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
  return Column(
        children: <Widget>[
          ItemTransferencia(Transferencia(100.0, 1000)),
          ItemTransferencia(Transferencia(120.0, 100220)),
          ItemTransferencia(Transferencia(130.0, 3211)),
        ],
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
  }
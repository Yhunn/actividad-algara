import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_app_1/caracteristicas/verificacion/vista_creandose.dart';
import 'package:flutter_app_1/caracteristicas/verificacion/vista_en_espera.dart';
import 'package:flutter_app_1/caracteristicas/bloc.dart';

void main() {
  runApp(const AplicacionInyectada());
}

class AplicacionInyectada extends StatelessWidget {
  const AplicacionInyectada({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        BlocVerificacion blocVerificacion = BlocVerificacion();
        Future.delayed(Duration(seconds: 2), () {
          blocVerificacion.add(Creado());
        });

        return blocVerificacion;
      },
      child: const Aplicacion(),
    );
  }
}

class Aplicacion extends StatelessWidget {
  const Aplicacion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text('Clase 30/08/22')),
        body: Builder(
          builder: (context) {
            var estado = context.watch<BlocVerificacion>().state;
            if (estado is Creandose) {
              return Center(child: const VistaCreandose());
            }
            if (estado is SolicitandoNombre) {
              return VistaSolicitandoNombre();
            }
            return const Center(child: Text('huye'));
          },
        ),
      ),
    );
  }
}
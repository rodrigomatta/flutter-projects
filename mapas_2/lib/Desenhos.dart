import 'dart:async'; 
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Desenhos extends StatefulWidget { 
  const Desenhos({super.key});

  @override
  State<Desenhos> createState() => _DesenhosState(); 
}

class _DesenhosState extends State<Desenhos> { 
  Completer<GoogleMapController> controller = Completer(); 
  Set<Polygon> listaPoligonos = {};
  Set<Polyline> listaLinhas = {};

  desenharLinhas() {
    Set<Polyline> linhas = {};
    Polyline linha1 = Polyline(
      polylineId: PolylineId("linha1"),
      color: Colors.red,
      width: 5,
      points: [
        LatLng(-51.96145901234215, -60.05370489563581),
        LatLng(-52.027656101355454, -59.85949537367413),
        LatLng(-51.87108113457069, -59.80313993084265),
        LatLng(-51.40834603609273, -59.926260090551665),
        LatLng(-51.4421293199768, -59.248003923290284),
      ],
      startCap: Cap.roundCap,
      endCap: Cap.roundCap,
      jointType: JointType.bevel
    );
    linhas.add(linha1);
    setState(() {
      listaLinhas = linhas;
    });
  }

  desenharPoligonos(){
    Set<Polygon> poligonos = {};

    Polygon poligono1 = Polygon(
      polygonId: PolygonId("poligono1"),
      fillColor: Color.fromRGBO(203, 238, 7, 0.555),
      strokeColor: Colors.black,
      strokeWidth: 2,
      points: [
        LatLng(-51.468279, -59.882598),
        LatLng(-51.525184, -58.574797),
        LatLng(-52.075213, -59.727912),
      ],
      zIndex: 0,
      consumeTapEvents: true,
      onTap: () {
        print("Poligono 1 clicado");
      }
    );
    Polygon poligono2 = Polygon(
      polygonId: PolygonId("poligono2"),
      fillColor: Color.fromRGBO(20, 9, 175, 0.49),
      strokeColor: Colors.green,
      strokeWidth: 2,
      points: [
        LatLng(-51.686757, -60.251736),
        LatLng(-52.202517, -60.568139),
        LatLng(-51.858612, -61.053292),
      ],
      zIndex: 1,
      consumeTapEvents: true,
      onTap: () {
        print("Poligono 2 clicado");
      }
    );
    poligonos.add(poligono1);
    poligonos.add(poligono2);
    setState(() {
      listaPoligonos = poligonos;
    });
  }

  onMapCreated(GoogleMapController googleMapController) { 
    controller.complete(googleMapController); 
  }

  @override 
  void initState() {
    super.initState();
    desenharPoligonos();
    desenharLinhas();
  }

  @override 
  Widget build(BuildContext context) { 
    return Scaffold(
      appBar: AppBar( 
        title: const Text("Mapas") 
      ),
      body: Container( 
        child: GoogleMap(
          mapType: MapType.hybrid, 
          initialCameraPosition: const CameraPosition( 
            target: LatLng(-51.732504, -59.520492),
            zoom: 8 
          ),
          onMapCreated: onMapCreated,
          polygons: listaPoligonos,
          polylines: listaLinhas,
        )
      ),
    );
  }
}

import 'dart:async'; 
import 'dart:ui' as ui;
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; 
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class Principal extends StatefulWidget { 
  const Principal({super.key});

  @override
  State<Principal> createState() => _PrincipalState(); 
}

class _PrincipalState extends State<Principal> {
  Completer<GoogleMapController> controller = Completer();
  late CameraPosition localCamera;

  Set<Marker> listaMarcadores = {};

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!.buffer.asUint8List();
  }

  onMapCreated(GoogleMapController googleMapController) { 
    controller.complete(googleMapController); 
  }

  mudarCamera(CameraPosition localCamera) async { 
    GoogleMapController googleMapController = await controller.future;
    googleMapController.animateCamera(
      // CameraUpdate.newCameraPosition( 
      //   const CameraPosition( 
      //     target: LatLng(-23.362119, -51.173073), 
      //     zoom: 16, 
      //     tilt: 30, 
      //     bearing: 30 
      //   )
      // )
      CameraUpdate.newCameraPosition(localCamera)
    );
  }

  criarMarcadores(Position position) async {
    Set<Marker> marcadoresLocal = {};
    Marker marcador1 = Marker(
      markerId: const MarkerId("Marcador 1"),
      position: const LatLng(-23.362119, -51.173073),
      infoWindow: const InfoWindow(
        title: "Marcando o primeiro local"
      ),
    );
    Marker marcador2 = Marker(
      markerId: const MarkerId("Marcador 2"),
      position: const LatLng(-23.361733, -51.180243),
      infoWindow: const InfoWindow(
        title: "Marcando o segundo local"
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor.hueYellow
      ),
      onTap: () {
        print("marcador clicado");
      }
    );
    final Uint8List iconePersonalizado = await getBytesFromAsset('images/nicolascage.png', 200);
    Marker marcador3 = Marker(
      markerId: const MarkerId("Marcador 3"),
      position: LatLng(position.latitude, position.longitude),
      infoWindow: const InfoWindow(
        title: "Marcando o Nicolas Cage"
      ),
      icon: BitmapDescriptor.fromBytes(iconePersonalizado),
      onTap: () {
        print("marcador clicado");
      }
    );
    marcadoresLocal.add(marcador1);
    marcadoresLocal.add(marcador2);
    marcadoresLocal.add(marcador3);
    setState(() {
      listaMarcadores = marcadoresLocal;
    });
  }

  localizarDispositivo() async {
    bool servicosAtivos;
    LocationPermission permission;

    servicosAtivos = await Geolocator.isLocationServiceEnabled();
    if (!servicosAtivos) {
      return Future.error("Serviços de localização desabilitados");
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error("Permissão para acesso a localização negada");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error("Permissão para acesso a localização negada até o planeta sumir");
    }

    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    criarMarcadores(position);
    setState(() {
      localCamera = CameraPosition(
        target: LatLng(position.latitude, position.longitude),
        zoom: 17,
      );
    });
  }

  movimentarCamera(CameraPosition localCamera) async {
    GoogleMapController googleMapController = await controller.future;
    googleMapController.animateCamera(
      CameraUpdate.newCameraPosition(localCamera)
    );
  }

  ouvirLocalizacao() async {
    var configuracaoLocalizacao = LocationSettings(
      accuracy: LocationAccuracy.bestForNavigation,
      distanceFilter: 5,
    );

    Geolocator.getPositionStream(locationSettings: configuracaoLocalizacao).listen((Position position) {
      setState(() {
        localCamera = CameraPosition(
          target: LatLng(position.latitude, position.longitude),
          zoom: 16,
        );
        movimentarCamera(localCamera);
        criarMarcadores(position);
      });
    });
  }
  
  @override
  void initState() {
    super.initState();
    //criarMarcadores();
    localizarDispositivo();
    ouvirLocalizacao();
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
          initialCameraPosition: localCamera,
          // initialCameraPosition: const CameraPosition( 
          //   target: LatLng(-23.362119, -51.173073),
          //   zoom: 16 
          // ),
          onMapCreated: onMapCreated,
          markers: listaMarcadores, //lista de marcadores
        )
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: const Icon(Icons.pinch_rounded), 
      //   onPressed: mudarCamera,
      //   backgroundColor: Colors.red 
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.startFloat, 
    );
  }
}
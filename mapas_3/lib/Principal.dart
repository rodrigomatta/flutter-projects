import 'dart:async'; 
import 'dart:ui' as ui;
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; 
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class Principal extends StatefulWidget {
  // Construtor principal da classe StatefulWidget
  const Principal({super.key});

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  Completer<GoogleMapController> controller = Completer();
  late CameraPosition localCamera;
  Timer? timer;

  Set<Marker> listaMarcadores = {};

  // Função chamada quando o mapa é criado
  onMapCreated(GoogleMapController googleMapController) {
    controller.complete(googleMapController);
  }

  // Função para criar marcadores com base na posição atual do dispositivo
  localizarDispositivo() async {
    bool servicosAtivos;
    LocationPermission permissao;

    // Verifica se os serviços de localização estão ativos
    servicosAtivos = await Geolocator.isLocationServiceEnabled();
    if (!servicosAtivos) {
      return Future.error("Serviços de localização desabilitados");
    }

    // Verifica a permissão de acesso à localização
    permissao = await Geolocator.checkPermission();
    if (permissao == LocationPermission.denied) {
      permissao = await Geolocator.requestPermission();
      if (permissao == LocationPermission.denied) {
        return Future.error("Permissão para acesso negada.");
      }
    }

    // Verifica se a permissão foi negada permanentemente
    if (permissao == LocationPermission.deniedForever) {
      return Future.error("Permissão para acesso à localização negada permanentemente");
    }

    // Obtém a posição atual do dispositivo
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    // Atualiza o estado com a nova posição e cria marcadores
    setState(() {
      criarMarcadores(position);
      localCamera = CameraPosition(
        target: LatLng(position.latitude, position.longitude),
        zoom: 17,
      );
      print("${position.latitude} ${position.longitude}");
    });

    // Muda a câmera para a nova posição
    mudarCamera(localCamera);
  }

  // Função para mudar a câmera do mapa para uma nova posição
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
      CameraUpdate.newCameraPosition(localCamera),
    );
  }

  // Função para obter bytes de um asset (imagem)
  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(
      data.buffer.asUint8List(),
      targetWidth: width,
    );
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!.buffer.asUint8List();
  }

  // Função para criar marcadores na posição atual do dispositivo
  criarMarcadores(Position position) async {
    Set<Marker> marcadoresLocal = {};
    // Marker marcador1 = Marker(
    //   markerId: const MarkerId("Marcador 1"),
    //   position: const LatLng(-23.362119, -51.173073),
    //   infoWindow: const InfoWindow(
    //     title: "Marcando o primeiro local"
    //   ),
    // );
    // Marker marcador2 = Marker(
    //   markerId: const MarkerId("Marcador 2"),
    //   position: const LatLng(-23.361733, -51.180243),
    //   infoWindow: const InfoWindow(
    //     title: "Marcando o segundo local"
    //   ),
    //   icon: BitmapDescriptor.defaultMarkerWithHue(
    //     BitmapDescriptor.hueYellow
    //   ),
    //   onTap: () {
    //     print("marcador clicado");
    //   }
    // );
    // Obtém um ícone personalizado para o marcador
    final Uint8List iconePersonalizado = await getBytesFromAsset(
      'images/nicolascage.png',
      200,
    );

    // Cria um marcador com o ícone personalizado na posição atual
    Marker marcador3 = Marker(
      markerId: const MarkerId("Marcador 3"),
      position: LatLng(position.latitude, position.longitude),
      infoWindow: const InfoWindow(
        title: "Marcando o Nicolas Cage",
      ),
      icon: BitmapDescriptor.fromBytes(iconePersonalizado),
      onTap: () {
        print("marcador clicado");
      },
    );
    // marcadoresLocal.add(marcador1);
    // marcadoresLocal.add(marcador2);
    // Atualiza o estado com o novo marcador
    setState(() {
      marcadoresLocal.add(marcador3);
      listaMarcadores = marcadoresLocal;
    });
  }

  // Função para movimentar a câmera do mapa para uma nova posição
  movimentarCamera(CameraPosition localCamera) async {
    GoogleMapController googleMapController = await controller.future;
    googleMapController.animateCamera(
      CameraUpdate.newCameraPosition(localCamera),
    );
  }

  // Função para ouvir as atualizações de localização do dispositivo
  ouvirLocalizacao() async {
    var configuracaoLocalizacao = LocationSettings(
      accuracy: LocationAccuracy.bestForNavigation,
      distanceFilter: 5,
    );

    Geolocator.getPositionStream(locationSettings: configuracaoLocalizacao).listen((Position position) {
      // Atualiza o estado com a nova posição e movimenta a câmera
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
    // Inicializa o estado e configura um timer para atualizar a localização a cada 5 segundos
    super.initState();
    timer = Timer.periodic(Duration(seconds: 5), (Timer t) {
      setState(() {
        localizarDispositivo();
      });
      //criarMarcadores();
    });
  }

  @override
  void dispose() {
    // Cancela o timer ao finalizar
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mapas"),
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
          markers: listaMarcadores,
        ),
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

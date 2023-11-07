import 'package:flutter/material.dart'; // Importa o pacote Material Design do Flutter.
import 'dart:async'; // Importa a biblioteca de programação assíncrona do Dart.
import 'package:google_maps_flutter/google_maps_flutter.dart'; // Importa o pacote do Google Maps para Flutter.

class Principal extends StatefulWidget { // Cria uma classe Principal que é um widget com estado.
  const Principal({super.key}); // Construtor da classe, que opcionalmente aceita uma chave.

  @override // Sobrescreve o método createState para criar o estado do widget.
  State<Principal> createState() => _PrincipalState(); // Retorna uma instância de _PrincipalState, que é a implementação do estado de Principal.
}

class _PrincipalState extends State<Principal> { // Cria a classe _PrincipalState que contém o estado para o widget Principal.
  Completer<GoogleMapController> controller = Completer(); // Inicializa um Completer que será usado para obter uma referência ao controlador do mapa.

  onMapCreated(GoogleMapController googleMapController) { // Método chamado quando o mapa é criado.
    controller.complete(googleMapController); // Completa o Completer com o controlador do mapa fornecido.
  }

  mudarCamera() async { // Método assíncrono para mudar a posição da câmera do mapa.
    GoogleMapController googleMapController = await controller.future; // Aguarda a conclusão do Completer para obter o controlador do mapa.
    googleMapController.animateCamera( // Inicia uma animação de câmera no mapa.
      CameraUpdate.newCameraPosition( // Cria uma nova posição de câmera.
        CameraPosition( // Define a posição da câmera com coordenadas, zoom, inclinação e orientação.
          target: LatLng(-23.362119, -51.173073), // Coordenadas de latitude e longitude.
          zoom: 16, // Nível de zoom.
          tilt: 30, // Ângulo de inclinação.
          bearing: 30 // Orientação da câmera.
        )
      )
    );
  }

  @override // Sobrescreve o método build para construir o widget.
  Widget build(BuildContext context) { // Método que constrói o widget.
    return Scaffold( // Retorna um Scaffold, que é o layout básico para uma tela do Material Design.
      appBar: AppBar( // Define uma AppBar, que é a barra superior em aplicações Material Design.
        title: Text("Mapas") // Define o título da AppBar.
      ),
      body: Container( // Cria um container para o corpo do Scaffold.
        child: GoogleMap( // Inclui um widget GoogleMap.
          mapType: MapType.hybrid, // Define o tipo do mapa como híbrido.
          initialCameraPosition: CameraPosition( // Define a posição inicial da câmera do mapa.
            target: LatLng(-23.362119, -51.173073), // Define as coordenadas iniciais.
            zoom: 16 // Define o nível de zoom inicial.
          ),
          onMapCreated: onMapCreated // Define o método a ser chamado quando o mapa for criado.
        )
      ),
      floatingActionButton: FloatingActionButton( // Cria um botão de ação flutuante.
        child: Icon(Icons.pinch_rounded), // Define o ícone do botão.
        onPressed: mudarCamera, // Define o método a ser chamado quando o botão for pressionado.
        backgroundColor: Colors.red // Define a cor de fundo do botão.
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat, // Define a localização do botão de ação flutuante.
    );
  }
}
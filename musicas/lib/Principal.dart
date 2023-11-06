import 'package:flutter/material.dart'; // Importando o pacote do Flutter Material Design
import 'package:audioplayers/audioplayers.dart'; // Importando o pacote para tocar áudio

class Principal extends StatefulWidget { // Criando uma classe Principal que é um StatefulWidget
  const Principal({super.key}); // Construtor da classe Principal

  @override
  State<Principal> createState() => _PrincipalState(); // Criando o estado para a classe Principal
}

class _PrincipalState extends State<Principal> { // Classe de estado para a classe Principal
  AudioPlayer audioPlayer = AudioPlayer(); // Inicializando o player de áudio
  Duration _position = Duration(); // Inicializando a posição do áudio
  Duration _duration = Duration(); // Inicializando a duração do áudio
  AssetSource musica = AssetSource("musicas/amigo.mp3"); // Definindo a fonte do áudio
  double volume = 0.5; // Definindo o volume inicial
  double velocidadeAtual = 1.0; // Definindo a velocidade inicial
  final List<double> velocidadesDisponiveis = [1.0, 1.25, 1.5, 1.75, 2.0]; // Lista de velocidades disponíveis
  int velocidadeIndex = 0; // Índice da velocidade atual

  @override
  void initState() { // Método que é chamado quando o objeto é inserido na árvore de objetos
    super.initState();
    audioPlayer.onPositionChanged.listen((Duration p) { // Ouvinte para mudanças na posição do áudio
      setState(() {
        _position = p; // Atualizando a posição do áudio
      });
    });
    audioPlayer.onDurationChanged.listen((Duration d) { // Ouvinte para mudanças na duração do áudio
      setState(() {
        _duration = d; // Atualizando a duração do áudio
      });
    });
  }

  tocarMusica() {
    audioPlayer.play(musica); // Tocar a música
    audioPlayer.setVolume(volume); // Definir o volume da música
    audioPlayer.setPlaybackRate(velocidadeAtual); // Definir a velocidade de reprodução da música
  }

  pausarMusica() {
    audioPlayer.pause(); // Pausar a música
  }

  pararMusica() {
    audioPlayer.stop(); // Parar a música
  }

  changeSpeed() {
    setState(() { // Atualizar o estado
      velocidadeIndex = (velocidadeIndex + 1) % velocidadesDisponiveis.length; // Alterar o índice da velocidade
      velocidadeAtual = velocidadesDisponiveis[velocidadeIndex]; // Atualizar a velocidade atual
      audioPlayer.setPlaybackRate(velocidadeAtual); // Definir a nova velocidade de reprodução
    });
  }

  @override
  Widget build(BuildContext context) { // Método para construir a interface do usuário
    tocarMusica(); // Tocar a música quando a interface do usuário é construída
    return Scaffold( // Retornar um Scaffold, que é a estrutura básica de layout visual do Material Design
      appBar: AppBar( // Barra de aplicativo na parte superior
        title: Text("Musicas e Sons"), // Título da barra de aplicativo
      ),
      body: Column( // Corpo do Scaffold, que é uma coluna de widgets
        children: [ // Lista de widgets filhos
          Slider( // Slider para controlar o volume
            value: volume, // Valor atual do volume
            min: 0, // Valor mínimo do volume
            max: 1, // Valor máximo do volume
            onChanged: (valor) { // Função chamada quando o valor do volume é alterado
              setState(() { // Atualizar o estado
                volume = valor; // Atualizar o volume
                audioPlayer.setVolume(volume); // Definir o novo volume
              });
              print("Volume ${volume.toString()}"); // Imprimir o volume atual no console
            },
          ),
          Slider( // Slider para controlar a posição do áudio
            value: _position.inSeconds.toDouble(), // Valor atual da posição do áudio
            min: 0.0, // Valor mínimo da posição do áudio
            max: _duration.inSeconds.toDouble(), // Valor máximo da posição do áudio
            onChanged: (double value) { // Função chamada quando a posição do áudio é alterada
              final result = audioPlayer.seek(Duration(seconds: value.toInt())); // Buscar a nova posição do áudio
              if (result == 1) { // Se a busca foi bem-sucedida
                setState(() { // Atualizar o estado
                  _position = Duration(seconds: value.toInt()); // Atualizar a posição do áudio
                });
              }
            },
          ),
          Row( // Linha de botões
            mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Alinhamento dos botões
            children: [ // Lista de botões
              ElevatedButton( // Botão para tocar a música
                  onPressed: () {
                    tocarMusica();
                  },
                  child: Icon(Icons.play_arrow_rounded)),
              ElevatedButton( // Botão para pausar a música
                  onPressed: () {
                    pausarMusica();
                  },
                  child: Icon(Icons.pause_circle)),
              ElevatedButton( // Botão para parar a música
                  onPressed: () {
                    pararMusica();
                  },
                  child: Icon(Icons.stop_circle)),
              ElevatedButton( // Botão para alterar a velocidade de reprodução
                  onPressed: () {
                    changeSpeed();
                  },
                  child: Text('Vel: ${velocidadeAtual}x')),
            ],
          ),
        ],
      ),
    );
  }
}


import 'package:flutter/material.dart';

class PsicossociaisForm extends StatefulWidget {
  @override
  _PsicossociaisFormState createState() => _PsicossociaisFormState();
}

class _PsicossociaisFormState extends State<PsicossociaisForm> {
  // Variáveis para armazenar os estados dos campos
  bool solicitaAtencao = false;
  bool necessidadeAtencao = false;
  String comoSolicitaAtencao = '';
  String sentimentos = '';
  String manifestacaoSentimentos = '';
  bool comunicacaoVerbalNormal = true;
  String causaComunicacaoPrejudicada = '';
  bool participacaoGrupo = false;
  bool recebeVisita = false;
  String quemVisita = '';
  bool solicitaVisita = false;
  bool interageResidentes = false;
  bool agrideResidentes = false;
  bool sofreAgressao = false;
  bool realizaPasseios = false;
  String atividadesGosta = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Necessidades Psicossociais'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Seção: Atenção e Aceitação
            Text('Atenção e Aceitação', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            CheckboxListTile(
              title: Text('Solicita Atenção'),
              value: solicitaAtencao,
              onChanged: (bool? value) {
                setState(() {
                  solicitaAtencao = value ?? false;
                });
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Como:'),
              onChanged: (value) {
                setState(() {
                  comoSolicitaAtencao = value;
                });
              },
            ),
            CheckboxListTile(
              title: Text('Necessidade de Atenção'),
              value: necessidadeAtencao,
              onChanged: (bool? value) {
                setState(() {
                  necessidadeAtencao = value ?? false;
                });
              },
            ),
            // Sentimentos
            Text('Sentimentos:'),
            CheckboxListTile(
              title: Text('Tristeza'),
              value: sentimentos == 'Tristeza',
              onChanged: (bool? value) {
                setState(() {
                  sentimentos = value! ? 'Tristeza' : '';
                });
              },
            ),
            CheckboxListTile(
              title: Text('Solidão'),
              value: sentimentos == 'Solidão',
              onChanged: (bool? value) {
                setState(() {
                  sentimentos = value! ? 'Solidão' : '';
                });
              },
            ),
            CheckboxListTile(
              title: Text('Felicidade'),
              value: sentimentos == 'Felicidade',
              onChanged: (bool? value) {
                setState(() {
                  sentimentos = value! ? 'Felicidade' : '';
                });
              },
            ),
            // Manifestação de Sentimentos e Emoções
            Text('Manifestação de sentimentos e emoções:'),
            Wrap(
              children: [
                'Choro',
                'Deprimidos',
                'Isolamento',
                'Irritado',
                'Agressivo',
                'Inquieto',
                'Pensamento negativo de si mesmo'
              ].map((manifestacao) {
                return CheckboxListTile(
                  title: Text(manifestacao),
                  value: manifestacaoSentimentos.contains(manifestacao),
                  onChanged: (bool? value) {
                    setState(() {
                      if (value == true) {
                        manifestacaoSentimentos += '$manifestacao ';
                      } else {
                        manifestacaoSentimentos = manifestacaoSentimentos.replaceAll('$manifestacao ', '');
                      }
                    });
                  },
                );
              }).toList(),
            ),
            Divider(),

            // Seção: Comunicação
            Text('Comunicação', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            CheckboxListTile(
              title: Text('Comunicação Verbal Normal'),
              value: comunicacaoVerbalNormal,
              onChanged: (bool? value) {
                setState(() {
                  comunicacaoVerbalNormal = value ?? true;
                });
              },
            ),
            if (!comunicacaoVerbalNormal)
              TextField(
                decoration: InputDecoration(labelText: 'Causa da comunicação prejudicada:'),
                onChanged: (value) {
                  setState(() {
                    causaComunicacaoPrejudicada = value;
                  });
                },
              ),
            CheckboxListTile(
              title: Text('Comunicação Não Verbal'),
              value: true,
              onChanged: null,
            ),
            Wrap(
              children: ['Expressões Faciais', 'Gesto', 'Expressão Corporal'].map((comunicacao) {
                return CheckboxListTile(
                  title: Text(comunicacao),
                  value: manifestacaoSentimentos.contains(comunicacao),
                  onChanged: (bool? value) {
                    setState(() {
                      if (value == true) {
                        manifestacaoSentimentos += '$comunicacao ';
                      } else {
                        manifestacaoSentimentos = manifestacaoSentimentos.replaceAll('$comunicacao ', '');
                      }
                    });
                  },
                );
              }).toList(),
            ),
            Divider(),

            // Seção: Interação social e lazer
            Text('Interação Social e Lazer', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            CheckboxListTile(
              title: Text('Participa de atividades em grupo'),
              value: participacaoGrupo,
              onChanged: (bool? value) {
                setState(() {
                  participacaoGrupo = value ?? false;
                });
              },
            ),
            CheckboxListTile(
              title: Text('Recebe Visita'),
              value: recebeVisita,
              onChanged: (bool? value) {
                setState(() {
                  recebeVisita = value ?? false;
                });
              },
            ),
            if (recebeVisita)
              TextField(
                decoration: InputDecoration(labelText: 'De quem:'),
                onChanged: (value) {
                  setState(() {
                    quemVisita = value;
                  });
                },
              ),
            CheckboxListTile(
              title: Text('Solicita Visita'),
              value: solicitaVisita,
              onChanged: (bool? value) {
                setState(() {
                  solicitaVisita = value ?? false;
                });
              },
            ),
            CheckboxListTile(
              title: Text('Interage com os outros residentes'),
              value: interageResidentes,
              onChanged: (bool? value) {
                setState(() {
                  interageResidentes = value ?? false;
                });
              },
            ),
            CheckboxListTile(
              title: Text('Agride os residentes'),
              value: agrideResidentes,
              onChanged: (bool? value) {
                setState(() {
                  agrideResidentes = value ?? false;
                });
              },
            ),
            CheckboxListTile(
              title: Text('Sofre agressão dos residentes'),
              value: sofreAgressao,
              onChanged: (bool? value) {
                setState(() {
                  sofreAgressao = value ?? false;
                });
              },
            ),
            CheckboxListTile(
              title: Text('Realiza Passeios'),
              value: realizaPasseios,
              onChanged: (bool? value) {
                setState(() {
                  realizaPasseios = value ?? false;
                });
              },
            ),
            // Atividades que gosta de participar
            Text('Atividades que gosta de participar:'),
            Wrap(
              children: ['Jogos', 'Música', 'Dança', 'Artesanato', 'Leitura', 'Ações Educativas', 'Outras'].map((atividade) {
                return CheckboxListTile(
                  title: Text(atividade),
                  value: atividadesGosta.contains(atividade),
                  onChanged: (bool? value) {
                    setState(() {
                      if (value == true) {
                        atividadesGosta += '$atividade ';
                      } else {
                        atividadesGosta = atividadesGosta.replaceAll('$atividade ', '');
                      }
                    });
                  },
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

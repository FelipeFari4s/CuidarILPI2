import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cuidar_ilpi/models/idoso_modelo.dart';
import 'package:cuidar_ilpi/models/antecedentes_pessoais_modelo.dart';
import 'package:cuidar_ilpi/models/necessidadesPsicobiologicas/regulacao_neurologica_modelo.dart';
import 'package:cuidar_ilpi/models/necessidadesPsicobiologicas/nutricao_modelo.dart';
import 'package:cuidar_ilpi/models/necessidadesPsicobiologicas/hidratacao_modelo.dart';
import 'package:cuidar_ilpi/models/necessidadesPsicobiologicas/eliminacao_modelo.dart';
import 'package:cuidar_ilpi/models/necessidadesPsicobiologicas/sensopercepcao_modelo.dart';
import 'package:cuidar_ilpi/models/necessidadesPsicobiologicas/integridade_pele_modelo.dart';
import 'package:cuidar_ilpi/models/necessidadesPsicobiologicas/sono_repouso_modelo.dart';
import 'package:cuidar_ilpi/models/necessidadesPsicobiologicas/cuidado_corporal_modelo.dart';
import 'package:cuidar_ilpi/models/necessidadesPsicobiologicas/locomocao_modelo.dart';
import 'package:cuidar_ilpi/models/necessidadesPsicobiologicas/sexualidade_modelo.dart';
import 'package:cuidar_ilpi/models/necessidadesPsicobiologicas/seguranca_fisica_modelo.dart';
import 'package:cuidar_ilpi/models/necessidadesPsicossociais/atencao_aceitacao_modelo.dart';
import 'package:cuidar_ilpi/models/necessidadesPsicossociais/comunicacao_modelo.dart';
import 'package:cuidar_ilpi/models/necessidadesPsicossociais/interacao_social_lazer_modelo.dart';
import 'package:cuidar_ilpi/models/necessidadesPsicoespirituais/espiritualidade_modelo.dart';
import 'package:cuidar_ilpi/models/medicacao_modelo.dart';
import 'package:cuidar_ilpi/models/sinais_vitais_modelo.dart';

class IdosoService {
  String userId;
  IdosoService() : userId = FirebaseAuth.instance.currentUser!.uid;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> createIdoso(IdosoModelo idosoModelo) async {
    await _firestore.collection(userId).doc(idosoModelo.id).set(idosoModelo.toMap());
    await _firestore.collection('usuarios').doc(userId).collection('idosos').doc(idosoModelo.id).set(idosoModelo.toMap());
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> conectarStreamIdosos(bool descending){
    return _firestore.collection('usuarios').doc(userId).collection('idosos').orderBy("nome", descending: descending).snapshots();
  }

  Future<void> deleteIdoso({required String idosoId}) async {
    await _firestore.collection('usuarios').doc(userId).collection('idosos').doc(idosoId).delete();
  }

  //Antecedentes Pessoais

  Future<void> addAntecedentesPessoais(String idosoId, AntecedentesPessoaisModelo antecedentesPessoaisModelo) async { 
    await _firestore.collection('usuarios').doc(userId).collection('idosos').doc(idosoId).collection('antecedentesPessoais').doc(antecedentesPessoaisModelo.id).set(antecedentesPessoaisModelo.toMap());
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> conectarStreamAntecedentesPessoais(String idosoId){
    return _firestore.collection('usuarios').doc(userId).collection('idosos').doc(idosoId).collection('antecedentesPessoais').snapshots();
  }

  // Regulação Neurológica
  Stream<DocumentSnapshot<Map<String, dynamic>>> getRegulacaoNeurologica(String idosoId) {
    return _firestore
        .collection('usuarios')
        .doc(userId)
        .collection('idosos')
        .doc(idosoId)
        .collection('necessidadesPsicobiologicas')
        .doc('regulacaoNeurologica')
        .snapshots();
  }

  Future<void> salvarRegulacaoNeurologica(String idosoId, RegulacaoNeurologicaModelo regulacaoNeurologica) {
    return _firestore
        .collection('usuarios')
        .doc(userId)
        .collection('idosos')
        .doc(idosoId)
        .collection('necessidadesPsicobiologicas')
        .doc('regulacaoNeurologica')
        .set(regulacaoNeurologica.toMap());
  }

  // Nutrição
  Stream<DocumentSnapshot<Map<String, dynamic>>> getNutricao(String idosoId) {
    return _firestore
        .collection('usuarios')
        .doc(userId)
        .collection('idosos')
        .doc(idosoId)
        .collection('necessidadesPsicobiologicas')
        .doc('nutricao')
        .snapshots();
  }

  Future<void> salvarNutricao(String idosoId, NutricaoModelo nutricao) {
    return _firestore
        .collection('usuarios')
        .doc(userId)
        .collection('idosos')
        .doc(idosoId)
        .collection('necessidadesPsicobiologicas')
        .doc('nutricao')
        .set(nutricao.toMap());
  }

  // Hidratação
  Stream<DocumentSnapshot<Map<String, dynamic>>> getHidratacao(String idosoId) {
    return _firestore
        .collection('usuarios')
        .doc(userId)
        .collection('idosos')
        .doc(idosoId)
        .collection('necessidadesPsicobiologicas')
        .doc('hidratacao')
        .snapshots();
  }

  Future<void> salvarHidratacao(String idosoId, HidratacaoModelo hidratacao) {
    return _firestore
        .collection('usuarios')
        .doc(userId)
        .collection('idosos')
        .doc(idosoId)
        .collection('necessidadesPsicobiologicas')
        .doc('hidratacao')
        .set(hidratacao.toMap());
  }

  // Eliminação
  Stream<DocumentSnapshot<Map<String, dynamic>>> getEliminacao(String idosoId) {
    return _firestore
        .collection('usuarios')
        .doc(userId)
        .collection('idosos')
        .doc(idosoId)
        .collection('necessidadesPsicobiologicas')
        .doc('eliminacao')
        .snapshots();
  }

  Future<void> salvarEliminacao(String idosoId, EliminacaoModelo eliminacao) {
    return _firestore
        .collection('usuarios')
        .doc(userId)
        .collection('idosos')
        .doc(idosoId)
        .collection('necessidadesPsicobiologicas')
        .doc('eliminacao')
        .set(eliminacao.toMap());
  }

  // Sensopercepção
  Stream<DocumentSnapshot<Map<String, dynamic>>> getSensopercepcao(String idosoId) {
    return _firestore
        .collection('usuarios')
        .doc(userId)
        .collection('idosos')
        .doc(idosoId)
        .collection('necessidadesPsicobiologicas')
        .doc('sensopercepcao')
        .snapshots();
  }

  Future<void> salvarSensopercepcao(String idosoId, SensopercepcaoModelo sensopercepcao) {
    return _firestore
        .collection('usuarios')
        .doc(userId)
        .collection('idosos')
        .doc(idosoId)
        .collection('necessidadesPsicobiologicas')
        .doc('sensopercepcao')
        .set(sensopercepcao.toMap());
  }

  // Integridade da Pele
  Stream<DocumentSnapshot<Map<String, dynamic>>> getIntegridadePele(String idosoId) {
    return _firestore
        .collection('usuarios')
        .doc(userId)
        .collection('idosos')
        .doc(idosoId)
        .collection('necessidadesPsicobiologicas')
        .doc('integridadePele')
        .snapshots();
  }

  Future<void> salvarIntegridadePele(String idosoId, IntegridadePeleModelo integridadePele) {
    return _firestore
        .collection('usuarios')
        .doc(userId)
        .collection('idosos')
        .doc(idosoId)
        .collection('necessidadesPsicobiologicas')
        .doc('integridadePele')
        .set(integridadePele.toMap());
  }

  // Sono e Repouso
  Stream<DocumentSnapshot<Map<String, dynamic>>> getSonoRepouso(String idosoId) {
    return _firestore
        .collection('usuarios')
        .doc(userId)
        .collection('idosos')
        .doc(idosoId)
        .collection('necessidadesPsicobiologicas')
        .doc('sonoRepouso')
        .snapshots();
  }

  Future<void> salvarSonoRepouso(String idosoId, SonoRepousoModelo sonoRepouso) {
    return _firestore
        .collection('usuarios')
        .doc(userId)
        .collection('idosos')
        .doc(idosoId)
        .collection('necessidadesPsicobiologicas')
        .doc('sonoRepouso')
        .set(sonoRepouso.toMap());
  }

  // Cuidado Corporal
  Stream<DocumentSnapshot<Map<String, dynamic>>> getCuidadoCorporal(String idosoId) {
    return _firestore
        .collection('usuarios')
        .doc(userId)
        .collection('idosos')
        .doc(idosoId)
        .collection('necessidadesPsicobiologicas')
        .doc('cuidadoCorporal')
        .snapshots();
  }

  Future<void> salvarCuidadoCorporal(String idosoId, CuidadoCorporalModelo cuidadoCorporal) {
    return _firestore
        .collection('usuarios')
        .doc(userId)
        .collection('idosos')
        .doc(idosoId)
        .collection('necessidadesPsicobiologicas')
        .doc('cuidadoCorporal')
        .set(cuidadoCorporal.toMap());
  }

  // Locomoção e Atividade Física
  Stream<DocumentSnapshot<Map<String, dynamic>>> getLocomocao(String idosoId) {
    return _firestore
        .collection('usuarios')
        .doc(userId)
        .collection('idosos')
        .doc(idosoId)
        .collection('necessidadesPsicobiologicas')
        .doc('locomocao')
        .snapshots();
  }

  Future<void> salvarLocomocao(String idosoId, LocomocaoModelo locomocao) {
    return _firestore
        .collection('usuarios')
        .doc(userId)
        .collection('idosos')
        .doc(idosoId)
        .collection('necessidadesPsicobiologicas')
        .doc('locomocao')
        .set(locomocao.toMap());
  }

  // Sexualidade
  Stream<DocumentSnapshot<Map<String, dynamic>>> getSexualidade(String idosoId) {
    return _firestore
        .collection('usuarios')
        .doc(userId)
        .collection('idosos')
        .doc(idosoId)
        .collection('necessidadesPsicobiologicas')
        .doc('sexualidade')
        .snapshots();
  }

  Future<void> salvarSexualidade(String idosoId, SexualidadeModelo sexualidade) {
    return _firestore
        .collection('usuarios')
        .doc(userId)
        .collection('idosos')
        .doc(idosoId)
        .collection('necessidadesPsicobiologicas')
        .doc('sexualidade')
        .set(sexualidade.toMap());
  }

  // Segurança Física e Meio Ambiente
  Stream<DocumentSnapshot<Map<String, dynamic>>> getSegurancaFisica(String idosoId) {
    return _firestore
        .collection('usuarios')
        .doc(userId)
        .collection('idosos')
        .doc(idosoId)
        .collection('necessidadesPsicobiologicas')
        .doc('segurancaFisica')
        .snapshots();
  }

  Future<void> salvarSegurancaFisica(String idosoId, SegurancaFisicaModelo segurancaFisica) {
    return _firestore
        .collection('usuarios')
        .doc(userId)
        .collection('idosos')
        .doc(idosoId)
        .collection('necessidadesPsicobiologicas')
        .doc('segurancaFisica')
        .set(segurancaFisica.toMap());
  }

  // Atenção e Aceitação
  Stream<DocumentSnapshot<Map<String, dynamic>>> getAtencaoAceitacao(String idosoId) {
    return _firestore
        .collection('usuarios')
        .doc(userId)
        .collection('idosos')
        .doc(idosoId)
        .collection('necessidadesPsicossociais')
        .doc('atencaoAceitacao')
        .snapshots();
  }

  Future<void> salvarAtencaoAceitacao(String idosoId, AtencaoAceitacaoModelo atencaoAceitacao) {
    return _firestore
        .collection('usuarios')
        .doc(userId)
        .collection('idosos')
        .doc(idosoId)
        .collection('necessidadesPsicossociais')
        .doc('atencaoAceitacao')
        .set(atencaoAceitacao.toMap());
  }

  // Comunicação
  Stream<DocumentSnapshot<Map<String, dynamic>>> getComunicacao(String idosoId) {
    return _firestore
        .collection('usuarios')
        .doc(userId)
        .collection('idosos')
        .doc(idosoId)
        .collection('necessidadesPsicossociais')
        .doc('comunicacao')
        .snapshots();
  }

  Future<void> salvarComunicacao(String idosoId, ComunicacaoModelo comunicacao) {
    return _firestore
        .collection('usuarios')
        .doc(userId)
        .collection('idosos')
        .doc(idosoId)
        .collection('necessidadesPsicossociais')
        .doc('comunicacao')
        .set(comunicacao.toMap());
  }

  // Interação Social e Lazer
  Stream<DocumentSnapshot<Map<String, dynamic>>> getInteracaoSocialLazer(String idosoId) {
    return _firestore
        .collection('usuarios')
        .doc(userId)
        .collection('idosos')
        .doc(idosoId)
        .collection('necessidadesPsicossociais')
        .doc('interacaoSocialLazer')
        .snapshots();
  }

  Future<void> salvarInteracaoSocialLazer(String idosoId, InteracaoSocialLazerModelo interacaoSocialLazer) {
    return _firestore
        .collection('usuarios')
        .doc(userId)
        .collection('idosos')
        .doc(idosoId)
        .collection('necessidadesPsicossociais')
        .doc('interacaoSocialLazer')
        .set(interacaoSocialLazer.toMap());
  }

  // Espiritualidade
  Stream<DocumentSnapshot<Map<String, dynamic>>> getEspiritualidade(String idosoId) {
    return _firestore
        .collection('usuarios')
        .doc(userId)
        .collection('idosos')
        .doc(idosoId)
        .collection('necessidadesPsicoespirituais')
        .doc('espiritualidade')
        .snapshots();
  }

  Future<void> salvarEspiritualidade(String idosoId, EspiritualidadeModelo espiritualidade) {
    return _firestore
        .collection('usuarios')
        .doc(userId)
        .collection('idosos')
        .doc(idosoId)
        .collection('necessidadesPsicoespirituais')
        .doc('espiritualidade')
        .set(espiritualidade.toMap());
  }

  // Medicações
  Stream<QuerySnapshot<Map<String, dynamic>>> getMedicacoes(String idosoId) {
    return _firestore
        .collection('usuarios')
        .doc(userId)
        .collection('idosos')
        .doc(idosoId)
        .collection('medicacoes').orderBy('nome', descending: false)
        .snapshots();
  }

  Future<void> salvarMedicacao(String idosoId, MedicacaoModelo medicacao) {
    return _firestore
        .collection('usuarios')
        .doc(userId)
        .collection('idosos')
        .doc(idosoId)
        .collection('medicacoes')
        .doc(medicacao.id)
        .set(medicacao.toMap());
  }

  Future<void> deletarMedicacao(String idosoId, String medicacaoId) {
    return _firestore
        .collection('usuarios')
        .doc(userId)
        .collection('idosos')
        .doc(idosoId)
        .collection('medicacoes')
        .doc(medicacaoId)
        .delete();
  }

  Future<void> atualizarChecagemMedicacao(
      String idosoId, String medicacaoId, bool checagem, String observacao) {
    return _firestore
        .collection('usuarios')
        .doc(userId)
        .collection('idosos')
        .doc(idosoId)
        .collection('medicacoes')
        .doc(medicacaoId)
        .update({
      'checagem': checagem,
      'observacao': observacao,
    });
  }

  // Sinais Vitais
  Stream<QuerySnapshot<Map<String, dynamic>>> getSinaisVitais(String idosoId) {
    return _firestore
        .collection('usuarios')
        .doc(userId)
        .collection('idosos')
        .doc(idosoId)
        .collection('sinaisVitais')
        .orderBy('dataRegistro', descending: true)
        .snapshots();
  }

  Future<void> salvarSinaisVitais(String idosoId, SinaisVitaisModelo sinaisVitais) {
    return _firestore
        .collection('usuarios')
        .doc(userId)
        .collection('idosos')
        .doc(idosoId)
        .collection('sinaisVitais')
        .doc(sinaisVitais.id)
        .set(sinaisVitais.toMap());
  }

  Future<void> deletarSinaisVitais(String idosoId, String sinaisVitaisId) {
    return _firestore
        .collection('usuarios')
        .doc(userId)
        .collection('idosos')
        .doc(idosoId)
        .collection('sinaisVitais')
        .doc(sinaisVitaisId)
        .delete();
  }
}
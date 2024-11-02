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

class IdosoService {
  String userId;
  IdosoService() : userId = FirebaseAuth.instance.currentUser!.uid;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> createIdoso(IdosoModelo idosoModelo) async {
    await _firestore.collection(userId).doc(idosoModelo.id).set(idosoModelo.toMap());
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> conectarStreamIdosos(bool descending){
    return _firestore.collection(userId).orderBy("nome", descending: descending).snapshots();
  }

  Future<void> deleteIdoso({required String idosoId}) async {
    await _firestore.collection(userId).doc(idosoId).delete();
  }

  //Antecedentes Pessoais

  Future<void> addAntecedentesPessoais(String idosoId, AntecedentesPessoaisModelo antecedentesPessoaisModelo) async { 
    await _firestore.collection(userId).doc(idosoId).collection('antecedentesPessoais').doc(antecedentesPessoaisModelo.id).set(antecedentesPessoaisModelo.toMap());
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> conectarStreamAntecedentesPessoais(String idosoId){
    return _firestore.collection(userId).doc(idosoId).collection('antecedentesPessoais').snapshots();
  }

  // Regulação Neurológica
  Stream<DocumentSnapshot<Map<String, dynamic>>> getRegulacaoNeurologica(String idosoId) {
    return _firestore
        .collection(userId)
        .doc(idosoId)
        .collection('necessidadesPsicobiologicas')
        .doc('regulacaoNeurologica')
        .snapshots();
  }

  Future<void> salvarRegulacaoNeurologica(String idosoId, RegulacaoNeurologicaModelo regulacaoNeurologica) {
    return _firestore
        .collection(userId)
        .doc(idosoId)
        .collection('necessidadesPsicobiologicas')
        .doc('regulacaoNeurologica')
        .set(regulacaoNeurologica.toMap());
  }

  // Nutrição
  Stream<DocumentSnapshot<Map<String, dynamic>>> getNutricao(String idosoId) {
    return _firestore
        .collection(userId)
        .doc(idosoId)
        .collection('necessidadesPsicobiologicas')
        .doc('nutricao')
        .snapshots();
  }

  Future<void> salvarNutricao(String idosoId, NutricaoModelo nutricao) {
    return _firestore
        .collection(userId)
        .doc(idosoId)
        .collection('necessidadesPsicobiologicas')
        .doc('nutricao')
        .set(nutricao.toMap());
  }

  // Hidratação
  Stream<DocumentSnapshot<Map<String, dynamic>>> getHidratacao(String idosoId) {
    return _firestore
        .collection(userId)
        .doc(idosoId)
        .collection('necessidadesPsicobiologicas')
        .doc('hidratacao')
        .snapshots();
  }

  Future<void> salvarHidratacao(String idosoId, HidratacaoModelo hidratacao) {
    return _firestore
        .collection(userId)
        .doc(idosoId)
        .collection('necessidadesPsicobiologicas')
        .doc('hidratacao')
        .set(hidratacao.toMap());
  }

  // Eliminação
  Stream<DocumentSnapshot<Map<String, dynamic>>> getEliminacao(String idosoId) {
    return _firestore
        .collection(userId)
        .doc(idosoId)
        .collection('necessidadesPsicobiologicas')
        .doc('eliminacao')
        .snapshots();
  }

  Future<void> salvarEliminacao(String idosoId, EliminacaoModelo eliminacao) {
    return _firestore
        .collection(userId)
        .doc(idosoId)
        .collection('necessidadesPsicobiologicas')
        .doc('eliminacao')
        .set(eliminacao.toMap());
  }

  // Sensopercepção
  Stream<DocumentSnapshot<Map<String, dynamic>>> getSensopercepcao(String idosoId) {
    return _firestore
        .collection(userId)
        .doc(idosoId)
        .collection('necessidadesPsicobiologicas')
        .doc('sensopercepcao')
        .snapshots();
  }

  Future<void> salvarSensopercepcao(String idosoId, SensopercepcaoModelo sensopercepcao) {
    return _firestore
        .collection(userId)
        .doc(idosoId)
        .collection('necessidadesPsicobiologicas')
        .doc('sensopercepcao')
        .set(sensopercepcao.toMap());
  }

  // Integridade da Pele
  Stream<DocumentSnapshot<Map<String, dynamic>>> getIntegridadePele(String idosoId) {
    return _firestore
        .collection(userId)
        .doc(idosoId)
        .collection('necessidadesPsicobiologicas')
        .doc('integridadePele')
        .snapshots();
  }

  Future<void> salvarIntegridadePele(String idosoId, IntegridadePeleModelo integridadePele) {
    return _firestore
        .collection(userId)
        .doc(idosoId)
        .collection('necessidadesPsicobiologicas')
        .doc('integridadePele')
        .set(integridadePele.toMap());
  }

  // Sono e Repouso
  Stream<DocumentSnapshot<Map<String, dynamic>>> getSonoRepouso(String idosoId) {
    return _firestore
        .collection(userId)
        .doc(idosoId)
        .collection('necessidadesPsicobiologicas')
        .doc('sonoRepouso')
        .snapshots();
  }

  Future<void> salvarSonoRepouso(String idosoId, SonoRepousoModelo sonoRepouso) {
    return _firestore
        .collection(userId)
        .doc(idosoId)
        .collection('necessidadesPsicobiologicas')
        .doc('sonoRepouso')
        .set(sonoRepouso.toMap());
  }

  // Cuidado Corporal
  Stream<DocumentSnapshot<Map<String, dynamic>>> getCuidadoCorporal(String idosoId) {
    return _firestore
        .collection(userId)
        .doc(idosoId)
        .collection('necessidadesPsicobiologicas')
        .doc('cuidadoCorporal')
        .snapshots();
  }

  Future<void> salvarCuidadoCorporal(String idosoId, CuidadoCorporalModelo cuidadoCorporal) {
    return _firestore
        .collection(userId)
        .doc(idosoId)
        .collection('necessidadesPsicobiologicas')
        .doc('cuidadoCorporal')
        .set(cuidadoCorporal.toMap());
  }

  // Locomoção e Atividade Física
  Stream<DocumentSnapshot<Map<String, dynamic>>> getLocomocao(String idosoId) {
    return _firestore
        .collection(userId)
        .doc(idosoId)
        .collection('necessidadesPsicobiologicas')
        .doc('locomocao')
        .snapshots();
  }

  Future<void> salvarLocomocao(String idosoId, LocomocaoModelo locomocao) {
    return _firestore
        .collection(userId)
        .doc(idosoId)
        .collection('necessidadesPsicobiologicas')
        .doc('locomocao')
        .set(locomocao.toMap());
  }

  // Sexualidade
  Stream<DocumentSnapshot<Map<String, dynamic>>> getSexualidade(String idosoId) {
    return _firestore
        .collection(userId)
        .doc(idosoId)
        .collection('necessidadesPsicobiologicas')
        .doc('sexualidade')
        .snapshots();
  }

  Future<void> salvarSexualidade(String idosoId, SexualidadeModelo sexualidade) {
    return _firestore
        .collection(userId)
        .doc(idosoId)
        .collection('necessidadesPsicobiologicas')
        .doc('sexualidade')
        .set(sexualidade.toMap());
  }

  // Segurança Física e Meio Ambiente
  Stream<DocumentSnapshot<Map<String, dynamic>>> getSegurancaFisica(String idosoId) {
    return _firestore
        .collection(userId)
        .doc(idosoId)
        .collection('necessidadesPsicobiologicas')
        .doc('segurancaFisica')
        .snapshots();
  }

  Future<void> salvarSegurancaFisica(String idosoId, SegurancaFisicaModelo segurancaFisica) {
    return _firestore
        .collection(userId)
        .doc(idosoId)
        .collection('necessidadesPsicobiologicas')
        .doc('segurancaFisica')
        .set(segurancaFisica.toMap());
  }
}
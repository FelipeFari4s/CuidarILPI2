import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cuidar_ilpi/models/idoso_modelo.dart';
import 'package:cuidar_ilpi/models/antecedentes_pessoais_modelo.dart';
import 'package:cuidar_ilpi/models/necessidadesPsicobiologicas/regulacao_neurologica_modelo.dart';

class IdosoService {
  String userId;
  IdosoService() : userId = FirebaseAuth.instance.currentUser!.uid;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> createIdoso(IdosoModelo idosoModelo) async {
    await _firestore.collection(userId).doc(idosoModelo.id).set(idosoModelo.toMap());
  }

  //Future<void> addAntecedentesPessoais(String idosoId, AntecedentesPessoaisModelo antecedentesPessoaisModelo) async {
  //  await _firestore.collection(userId).doc(idosoId).collection('antecedentesPessoais').doc(antecedentesPessoaisModelo.id).set(antecedentesPessoaisModelo.toMap());
  //}

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
}
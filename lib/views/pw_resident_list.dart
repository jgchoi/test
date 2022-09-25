import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:dio/dio.dart';

import '../common/models/get_patient_response.dart';

var host = 'http://192.168.1.9:8090';

class ResidentListView extends StatelessWidget {
  const ResidentListView({Key? key}) : super(key: key);

  Future<List<Data>> _getPatient() async {
    try {
      final Response<String> response = await Dio()
          .get('${host}/api/patient?page=1&pageSize=30&statusFilter=Current');
      if (response.statusCode == 200) {
        final responseJson = jsonDecode(response.data!);
        final getPatientResponse = GetPatientResponse.fromJson(responseJson);
        return getPatientResponse.data ?? [];
      } else {
        print(response.extra);
      }
    } catch (error) {
      print(error.toString());
    }
    return [];
  }

  not_tested_method() {
    print('ddd');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resident List'),
        automaticallyImplyLeading: false,
      ),
      body: FutureBuilder<List<Data>>(
          future: _getPatient(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: Text('An error has occurred!'),
              );
            } else if (snapshot.hasData) {
              return PatientList(patients: snapshot.data!);
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}

class PatientList extends StatelessWidget {
  const PatientList({Key? key, required this.patients}) : super(key: key);
  final List<Data> patients;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: patients.length,
      itemBuilder: (context, index) {
        return Container(
            padding: const EdgeInsets.all(8),
            child: ListTile(
                leading: ClipOval(
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: FadeInImage(
                        fit: BoxFit.cover,
                        placeholder:
                            const AssetImage('assets/default_patient_icon.png'),
                        imageErrorBuilder: (context, _, __) {
                          return Image.asset('assets/default_patient_icon.png');
                        },
                        image: NetworkImage(
                            '${host}/api/patient/photo?patientId=${patients[index].patientId}')),
                  ),
                ),
                title: Text(patients[index].fullName ?? ''),
                subtitle: Text(patients[index].unitDesc ?? '')));
      },
    );
  }
}

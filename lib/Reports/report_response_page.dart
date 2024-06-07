import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../Models/report_model.dart';


class ReportResponse extends StatefulWidget {
  @override
  _ReportResponseState createState() => _ReportResponseState();
}

class _ReportResponseState extends State<ReportResponse> {
  bool isLoading = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String _email = '';

  List<FaultModel> reports = [
    FaultModel(
      id: 1,
      details: 'Report 1',
      status: 'received',
    ),
    FaultModel(
      id: 2,
      details: 'Report 2',
      status: 'pending',
    ),
    FaultModel(
      id: 3,
      details: 'Report 3',
      status: 'resolved',
    ),
  ];

  FaultModel? selectedReport;

  Future<void> updateReportStatus(String newStatus) async {
    if (selectedReport != null) {
      final url = Uri.parse('http://192.168.43.32:8085/faults/update/${selectedReport!.id}');
      final response = await http.put(
        url,
        body: jsonEncode({'updatedStatus': newStatus}),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        setState(() {
          selectedReport!.updatedStatus = newStatus;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Report status updated successfully')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to update report status')),
        );
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _getEmail();
    fetchReports();
  }
  Future<void> _getEmail() async {
    final User? user = _auth.currentUser;
    if (user != null) {
      setState(() {
        _email = user.email ?? '';
      });
    }
  }

  // CHANGE THE Uri TO THE IP ADDRESS OF YOUR COMPUTER
  Future<void> fetchReports() async {
    setState(() {
      isLoading = true;
    });

    try {
      // 'http://10.160.1.201:8085/file/create'
      final response = await http.get(Uri.parse( _email == 'zetdczw@gmail.com'  ?'http://192.168.43.32:8085/faults/getAllZesa' : 'http://192.168.43.32:8085/faults/getAllMuni' ));

      if (response.statusCode == 200) {
        final List<dynamic> reportData = jsonDecode(response.body);
        print(response.statusCode);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Reports Fetched successfully'),
            backgroundColor: Colors.green,
            duration: Duration(seconds: 3),
          ),
        );
        setState(() {
          reports = reportData.map((json) => FaultModel.fromJson(json)).toList();
        });
      } else {
        print(response.statusCode);
        print(response.reasonPhrase);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to Fetch report'),
            backgroundColor: Colors.red,
            duration: Duration(seconds: 3),
          ),
        );
      }
    } catch (e) {
      print('Error fetching reports: $e');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  // void _updateReportStatus(FaultModel report) async {
  //
  //   final newStatus = await showDialog<String>(
  //     context: context,
  //     builder: (context) => AlertDialog(
  //       title: Text('Update Report Status'),
  //       content: TextField(
  //         controller: TextEditingController(text: report.updatedStatus ?? report.status),
  //         decoration: InputDecoration(
  //           hintText: 'Enter new status',
  //         ),
  //       ),
  //       actions: [
  //         TextButton(
  //           onPressed: () => Navigator.of(context).pop(),
  //           child: Text('Cancel'),
  //         ),
  //         TextButton(
  //           onPressed: () => updateReportStatus,
  //           child: Text('Update'),
  //         ),
  //       ],
  //     ),
  //   );
  //
  //   if (newStatus != null) {
  //
  //     setState(() {
  //       report.updatedStatus = newStatus;
  //     });
  //     await updateReportStatus(report as String);
  //   }
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: () => Navigator.of(context).pop(),
            icon: Icon(Icons.arrow_back, color: Colors.black,)),
        centerTitle: true,
        title:  Text("All Reports",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 22,letterSpacing: 1,wordSpacing: 2),),

      ),
      body: isLoading
          ? Center(
        child: CircularProgressIndicator(),
      )
          : ListView.builder(
        itemCount: reports.length,
        itemBuilder: (context, index) {
          final report = reports[index];
          return ListTile(
            title: Text(report.details!),
            subtitle: Text(report.updatedStatus ?? report.status!),
            onLongPress: () {
              setState(() {
                selectedReport = report;
              });
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        title: Text('Set to Received'),
                        onTap: () {
                          updateReportStatus('received');
                          Navigator.of(context).pop();
                        },
                      ),
                      ListTile(
                        title: Text('Set to Pending'),
                        onTap: () {
                          updateReportStatus('pending');
                          Navigator.of(context).pop();
                        },
                      ),
                      ListTile(
                        title: Text('Set to Resolved'),
                        onTap: () {
                          updateReportStatus('resolved');
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
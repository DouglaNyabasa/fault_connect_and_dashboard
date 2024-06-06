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
  List<FaultModel> reports = [];
  bool isLoading = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String _email = '';

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
      final response = await http.get(Uri.parse( _email == 'zetdczw@gmail.com'  ?'http://10.160.1.201:8085/faults/getAllZesa' : 'http://10.160.1.201:8085/faults/getAllMuni' ));

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

  void _updateReportStatus(FaultModel report) async {
    // Show a dialog or bottom sheet to get the new status from the user
    final newStatus = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Update Report Status'),
        content: TextField(
          controller: TextEditingController(text: report.updatedStatus ?? report.status),
          decoration: InputDecoration(
            hintText: 'Enter new status',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () => updateReportStatus,
            child: Text('Update'),
          ),
        ],
      ),
    );

    if (newStatus != null) {
      // Update the report status in the list and on the server
      setState(() {
        report.updatedStatus = newStatus;
      });
      await updateReportStatus(report);
    }
  }

  Future<void> updateReportStatus(FaultModel report) async {
    try {
      final response = await http.put(
        Uri.parse('http://10.160.1.201:8085/faults/update/${report.id}'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(report.toJson()),
      );

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Report status updated successfully'),
            backgroundColor: Colors.green,
            duration: Duration(seconds: 3),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to update report status'),
            backgroundColor: Colors.red,
            duration: Duration(seconds: 3),
          ),
        );
      }
    } catch (e) {
      print('Error updating report status: $e');
    }
  }

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
          return GestureDetector(
            onLongPress: () => _updateReportStatus(report),
            child: Card(
              elevation: 4.0,
              margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          report.faultCategories ?? '',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Text('Details: ${report.details ?? ''}'),
                        SizedBox(height: 8.0),
                        Text('Date: ${report.dateTime ?? ''}'),
                        SizedBox(height: 8.0),
                        Text('Status: ${report.updatedStatus ?? report.status}'), // Use the updated status if available
                        SizedBox(height: 8.0),
                        Text('Longitude: ${report.longitude ?? ''}'),
                        SizedBox(height: 8.0),
                        Text('Latitude: ${report.latitude ?? ''}'),
                        SizedBox(height: 8.0),
                        Text('Recipient: ${report.recipient ?? ''}'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
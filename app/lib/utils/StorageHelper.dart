import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class StorageHelper {
  final String fileName;
  
  StorageHelper(this.fileName);
  
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/$fileName');
  }

  Future<Map<String, dynamic>> readData() async {
    try {
      final file = await _localFile;
      if (await file.exists()) {
        print("File Exists at: ${file.path}");
        final content = await file.readAsString();
        return json.decode(content);
      } else {
        print("File Does not Exist, creating new at: ${file.path}");
        // Initialize with default data
        final defaultData = {
    "users": [
      {
        "id": 1,
        "umi": "UMI1234567890",
        "name": "John Doe",
        "email": "a@a.a",
        "password": "a",
        "phone": "1234567890",
        "address": "123 Street, City, Country",
        "age": 30,
        "gender": "male",
        "user_type": "current_patient",
        "medical_history": [
          {
            "appointment_id": 101,
            "doctor_id": 1,
            "therapist_id": 2,
            "date": "2024-12-01",
            "diagnosis": "Substance Use Disorder",
            "treatment_plan": "12-step program and therapy",
            "prescriptions": [
              {
                "medicine_name": "Naloxone",
                "dosage": "50mg",
                "frequency": "Once a day"
              }
            ],
            "notes": "Patient showing improvement."
          }
        ]
      },
      {
        "id": 2,
        "umi": "UMI9876543210",
        "name": "Emily White",
        "email": "emily.white@example.com",
        "password": "hashed_password",
        "phone": "0987654321",
        "address": "456 Lane, Town, Country",
        "age": 27,
        "gender": "female",
        "user_type": "rehabilitated",
        "medical_history": [
          {
            "appointment_id": 102,
            "doctor_id": 3,
            "therapist_id": 4,
            "date": "2024-08-15",
            "diagnosis": "Alcohol Use Disorder",
            "treatment_plan": "Behavioral Therapy and Counseling",
            "prescriptions": [],
            "notes": "Successfully completed the rehabilitation program."
          }
        ]
      },
      {
        "id": 3,
        "umi": "UMI4567891230",
        "name": "Mark Lee",
        "email": "mark.lee@example.com",
        "password": "hashed_password",
        "phone": "1122334455",
        "address": "789 Road, City, Country",
        "age": 35,
        "gender": "male",
        "user_type": "rehabilitated",
        "medical_history": [
          {
            "appointment_id": 103,
            "doctor_id": 1,
            "therapist_id": 2,
            "date": "2024-06-10",
            "diagnosis": "Opioid Use Disorder",
            "treatment_plan": "Medication-Assisted Treatment (MAT) and Therapy",
            "prescriptions": [
              {
                "medicine_name": "Buprenorphine",
                "dosage": "8mg",
                "frequency": "Once daily"
              }
            ],
            "notes": "Patient has successfully reintegrated into the community."
          }
        ]
      }
    ],
    "medical_professionals": [
      {
        "id": 1,
        "name": "Dr. Alice Smith",
        "email": "alice.smith@hospital.com",
        "phone": "9876543210",
        "specialization": "Psychiatrist",
        "license_number": "DOC123456",
        "user_type": "doctor",
        "patients": ["UMI1234567890", "UMI4567891230"]
      },
      {
        "id": 2,
        "name": "Therapist Bob Jones",
        "email": "bob.jones@clinic.com",
        "phone": "1234509876",
        "specialization": "Cognitive Behavioral Therapy",
        "license_number": "THER567890",
        "user_type": "therapist",
        "patients": ["UMI1234567890", "UMI4567891230"]
      },
      {
        "id": 3,
        "name": "Dr. Rachel Green",
        "email": "rachel.green@hospital.com",
        "phone": "5566778899",
        "specialization": "Addiction Specialist",
        "license_number": "DOC654321",
        "user_type": "doctor",
        "patients": ["UMI9876543210"]
      },
      {
        "id": 4,
        "name": "Therapist Susan Brown",
        "email": "susan.brown@clinic.com",
        "phone": "6677889900",
        "specialization": "Motivational Interviewing",
        "license_number": "THER098765",
        "user_type": "therapist",
        "patients": ["UMI9876543210"]
      }
    ],
    "appointments": [
      {
        "id": 101,
        "umi": "UMI1234567890",
        "doctor_id": 1,
        "therapist_id": 2,
        "date": "2024-12-01",
        "time": "10:00 AM",
        "status": "completed"
      },
      {
        "id": 102,
        "umi": "UMI9876543210",
        "doctor_id": 3,
        "therapist_id": 4,
        "date": "2024-08-15",
        "time": "2:00 PM",
        "status": "completed"
      },
      {
        "id": 103,
        "umi": "UMI4567891230",
        "doctor_id": 1,
        "therapist_id": 2,
        "date": "2024-06-10",
        "time": "11:30 AM",
        "status": "completed"
      }
    ],
    "medical_records": [
      {
        "umi": "UMI1234567890",
        "scans": [
          {
            "scan_id": 201,
            "scan_type": "MRI",
            "date": "2024-11-15",
            "file_url": "https://example.com/scans/mri123.jpg"
          }
        ],
        "test_results": [
          {
            "test_id": 301,
            "test_type": "Blood Test",
            "date": "2024-11-10",
            "results": {
              "hemoglobin": "13.5 g/dL",
              "white_blood_cells": "6.0 K/uL"
            }
          }
        ]
      },
      {
        "umi": "UMI9876543210",
        "scans": [],
        "test_results": []
      },
      {
        "umi": "UMI4567891230",
        "scans": [],
        "test_results": [
          {
            "test_id": 302,
            "test_type": "Urine Test",
            "date": "2024-05-20",
            "results": {
              "tox_screen": "Negative",
              "creatinine": "1.0 mg/dL"
            }
          }
        ]
      }
    ]
  };
        // Write the default data
        await writeData(defaultData);
        return defaultData;
      }
    } catch (e) {
      print("Error reading file: $e");
      return {"users": [], "loggedInUser": null};
    }
  }

  Future<void> writeData(Map<String, dynamic> data) async {
    try {
      final file = await _localFile;
      await file.writeAsString(json.encode(data));
    } catch (e) {
      throw Exception("Error writing file: $e");
    }
  }
}


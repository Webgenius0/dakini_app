
// import 'package:demo_architecture_flutter/features/demo_ground/model/pagination_model.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';

// class JobProvider with ChangeNotifier {
//   List<Job> _jobs = [];
//   bool _isLoading = false;
//   int _currentPage = 1;
//   int _lastPage = 1;

//   List<Job> get jobs => _jobs;
//   bool get isLoading => _isLoading;

//   Future<void> fetchJobs() async {
//     if (_isLoading || _currentPage > _lastPage) return;

//     _isLoading = true;
//     notifyListeners();

//     try {
//       final response = await Dio().get(
//         'https://ayosph.com/api/jobs',
//         queryParameters: {'per_page': 3, 'page': _currentPage},
//       );

//       if (response.statusCode == 200) {
//         final data = response.data;
//         _lastPage = data['pagination']['last_page'];
//         List<Job> fetchedJobs = (data['data'] as List)
//             .map((jobJson) => Job.fromJson(jobJson))
//             .toList();
//         _jobs.addAll(fetchedJobs);
//         _currentPage++;
//       }
//     } catch (e) {
//       print('Error fetching jobs: $e');
//     } finally {
//       _isLoading = false;
//       notifyListeners();
//     }
//   }
// }

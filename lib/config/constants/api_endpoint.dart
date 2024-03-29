class ApiEndpoints {
  ApiEndpoints._();

  static const Duration connectionTimeout = Duration(seconds: 1000);
  static const Duration receiveTimeout = Duration(seconds: 1000);
  // For Windows
  // static const String baseUrl = "http://10.0.2.2:3000/api/v1/";
    static const String baseUrl = "http://172.26.0.12:3000/api/v1/";


  // static const String baseUrl = "http://172.26.0.139:3000/api/v1/";
  static String token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1YTAxODA3YWE5YTg2NWJkMWE5NTBhNSIsImlhdCI6MTcwNTIwNjUyNSwiZXhwIjoxNzA3Nzk4NTI1fQ.Wss9d1A-qCog5ggQK1WywaLvopFECK7HJytJG1ho6z8";
  // For MAC
  // static const String baseUrl = "http://localhost:3000/api/v1/";
  //static const String baseUrl = "http://192.168.4.4:3000/api/v1/";

  // ====================== Auth Routes ======================
  static const String login = "auth/login";
  static const String register = "auth/register";
  static const String getAllStudent = "auth/getAllStudents";
  static const String getStudentsByBatch = "auth/getStudentsByBatch/";
  static const String getStudentsByCourse = "auth/getStudentsByCourse/";
  static const String updateStudent = "auth/updateStudent/";
  static const String deleteStudent = "auth/deleteStudent/";
  static const String imageUrl = "http://10.0.2.2:3000/uploads/";
  static const String uploadImage = "auth/uploadImage";

  // ====================== Batch Routes ======================
  static const String createBatch = "batch/createBatch";
  static const String deleteBatch = "batch/";
  static const String getAllBatch = "batch/getAllBatches";
  static const limitPage = 10;

  // ====================== Course Routes ======================
  static const String createCourse = "course/createCourse";
  static const String deleteCourse = "course/";
  static const String getAllCourse = "course/getAllCourse";
}

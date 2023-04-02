class ApiConfig {
  static const baseUrl =
      "http://ec2-13-53-199-161.eu-north-1.compute.amazonaws.com";

  static String login = "/api/v1/auth/login";
  static String register = "/api/v1/auth/register";
  static String otpVerify = "/api/v1/auth/verify";
  static String userRecruiter = "/api/v1/user/recruiter";
  static String createVacancy = "/api/v1/jobs";
  static String applyVacancy = "/api/v1/jobs/";
  static String seekerLogin = "/api/v1/user/profile";
}

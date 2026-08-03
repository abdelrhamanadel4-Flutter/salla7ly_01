class AppValidators {
  AppValidators._();

  static String? validateEmail(String? val) {
    RegExp emailRegex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    );
    if (val == null || val.trim().isEmpty) {
      return 'this field is required';
    } else if (emailRegex.hasMatch(val) == false) {
      return 'enter valid email';
    } else {
      return null;
    }
  }

  static String? validatePassword(String? val) {
    RegExp passwordRegex = RegExp(r'^(?=.*[a-zA-Z])(?=.*[0-9])');
    if (val == null || val.isEmpty) {
      return 'this field is required';
    } else if (val.length < 8 || !passwordRegex.hasMatch(val)) {
      return 'strong password please';
    } else {
      return null;
    }
  }

  static String? validateConfirmPassword(String? val, String? password) {
    if (val == null || val.isEmpty) {
      return 'this field is required';
    } else if (val != password) {
      return 'Passwords not matching';
    } else {
      return null;
    }
  }

  static String? validateUsername(String? val) {
    RegExp usernameRegex = RegExp(r'^[a-zA-Z0-9,.-]+$');
    if (val == null || val.isEmpty) {
      return 'this field is required';
    } else if (!usernameRegex.hasMatch(val)) {
      return 'enter valid username';
    } else {
      return null;
    }
  }

  static String? validateFullName(String? val) {
    if (val == null || val.isEmpty) {
      return 'this field is required';
    } else {
      return null;
    }
  }

  static String? validatePhoneNumber(String? val) {
    if (val == null) {
      return 'this field is required';
    } else if (int.tryParse(val.trim()) == null) {
      return 'enter numbers only';
    } else if (val.trim().length != 11) {
      return 'enter value must equal 11 digit';
    } else {
      return null;
    }
  }

  static String? validateNationalId(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "National ID is required";
    }

    value = value.trim();

    if (!RegExp(r'^\d{14}$').hasMatch(value)) {
      return "National ID must be 14 digits";
    }

    // Century
    final century = value[0];
    if (century != '2' && century != '3') {
      return "Invalid National ID";
    }

    // Year
    final year = int.parse(value.substring(1, 3));

    // Month
    final month = int.parse(value.substring(3, 5));

    // Day
    final day = int.parse(value.substring(5, 7));

    final fullYear = century == '2' ? 1900 + year : 2000 + year;

    try {
      final birthDate = DateTime(fullYear, month, day);

      if (birthDate.year != fullYear ||
          birthDate.month != month ||
          birthDate.day != day) {
        return "Invalid birth date";
      }
    } catch (_) {
      return "Invalid birth date";
    }

    return null;
  }


  static String? validateCity(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please select your city';
    }
    return null;
  }

  static String? validateAddress(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please select your address';
    }
    return null;
  }
  static bool validateLocation(double? latitude, double? longitude) {
  if (latitude == null || longitude == null) {
    return false;
  }
  return true;
}
}


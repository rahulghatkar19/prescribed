String check(value) {
  if (value.isEmpty) {
    return 'Required Field*';
  } else {
    return null;
  }
}

String passwordcheck(value) {
  if (value.length < 6) {
    return "Your Password should be at least 8 characters long.";
  } else {
    return null;
  }
}

String phonecheck(value) {
  if (value.length < 10) {
    return "Enter a 10 digit valid phone number.";
  } else {
    return null;
  }
}

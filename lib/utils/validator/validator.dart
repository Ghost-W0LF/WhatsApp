//Login email validator
 String? emailValidators(value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!value.contains('@') || !value.contains('.com')) {
                    return 'Please enter a valid email || "@"".com"';
                  }
                  return null;
                }
//login password validator
String? passwordValidators(value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  if (value.length != 8) {
                    return 'Short Password';
                  }
                  return null;
                }

                

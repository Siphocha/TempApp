//Dont need to import anything actually
//This file is a placeholder for the calculations.
//Why? So we dont need to do them in the other dart files.
//Do it at once here and send import it around.

//"tempVal" is the actual temperature.
//Initially tried to use float but found out dart doesnt have it :(((
//"FarToC" is literally the original Farenheit value given.
double temperatureConverter(double tempVal, bool FarToC) {
  if (FarToC) {
    //formula for farenheit to celsuis
    return (tempVal - 32) * 5 / 9;
  } else {
    //INverse formula for celsuis to farenheit
    return (tempVal + 9 / 5) + 32;
  }
}

// Observer
abstract class WeatherListener {
  void onTemperatureChanged(double temperature);
}

// Subject
class WeatherStation {
  double _temperature = 0.0;
  final List<WeatherListener> _listeners = [];

  void addListener(WeatherListener listener) {
    _listeners.add(listener);
  }

  void setTemperature(double newTemperature) {
    _temperature = newTemperature;
    _notifyListeners();
  }

  void _notifyListeners() {
    for (var listener in _listeners) {
      listener.onTemperatureChanged(_temperature);
    }
  }
}

// Why we use only one extends, because we can't extends class to many other class
class TVChannel extends WeatherListener {
  @override
  void onTemperatureChanged(double temperature) {
    print("TV program -* Breaking new  - New temp is $temperature");
  }
}

// Observers
// Where we have more than 1 class to get the function of the subject then we should use implements
class PhoneDisplay implements WeatherListener {
  @override
  void onTemperatureChanged(double temperature) {
    print("📱 Phone Display: Temperature updated to $temperature°C");
  }
}

class TVDisplay implements WeatherListener {
  @override
  void onTemperatureChanged(double temperature) {
    print("📺 TV Display: Temperature updated to $temperature°C");
  }
}

class Cookie implements WeatherListener {
  @override
  void onTemperatureChanged(double temperature) {
    print("🍪 Cookie: Temperature updated to $temperature°C");
  }
}

// Tests
void main() {
  WeatherStation weatherStation = WeatherStation();

  PhoneDisplay phoneDisplay = PhoneDisplay();
  TVDisplay tvDisplay = TVDisplay();
  Cookie cookie = Cookie();

  TVChannel myTV = new TVChannel();

  // Register observers
  weatherStation.addListener(myTV);
  weatherStation.addListener(phoneDisplay);
  weatherStation.addListener(tvDisplay);
  weatherStation.addListener(cookie);

  // Update temperature
  print("🌡 Setting temperature to 25°C...");
  weatherStation.setTemperature(25.0);

  print("🌡 Setting temperature to 30°C...");
  weatherStation.setTemperature(30.0);

  print("🌡 Setting temperature to 45°C...");
  weatherStation.setTemperature(45.0);
}

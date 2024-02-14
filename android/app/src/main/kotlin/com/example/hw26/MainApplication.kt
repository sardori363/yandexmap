import android.app.Application

import com.yandex.mapkit.MapKitFactory

class MainApplication: Application() {
  override fun onCreate() {
    super.onCreate()
    MapKitFactory.setLocale("en") // Your preferred language. Not required, defaults to system language
    MapKitFactory.setApiKey("10174d2a-8dbb-4fbc-ad03-d5985c385a2e") // Your generated API key
  }
}
package com.example.kmm_punk_api_app
import punk_api.apis.BeersApi
import io.ktor.client.HttpClient
import kotlinx.serialization.json.Json

class PunkAPI {
    private val httpClient = HttpClient {
//        install(LanguageFeature) {
//            languageHeaderName = "X-Language"
//            languageCodeProvider = LanguageProvider()
//        }
//        install(Logging) {
//            level = LogLevel.INFO
//            logger = object : Logger {
//                override fun log(message: String) {
//                    println(message)
//                }
//            }
//        }
    }
    val client = BeersApi(
        basePath = "https://api.punkapi.com/v2/",
        httpClient = httpClient,
        json = Json {
            ignoreUnknownKeys = true
        }
    )
}
package org.rykov.hw9

import io.ktor.client.*
import io.ktor.client.call.*
import io.ktor.client.plugins.contentnegotiation.*
import io.ktor.client.request.*
import io.ktor.serialization.kotlinx.json.*
import kotlinx.serialization.json.Json

class NewsService {

    companion object {
        val API_KEY = "5b86b7593caa4f009fea285cc74129e2"
    }

    val httpClient = HttpClient {
        install(ContentNegotiation) {
            json(Json {
                ignoreUnknownKeys = true
            })
        }
    }

    suspend fun loadNews(sources: String) = httpClient
        .get("https://newsapi.org/v2/top-headlines?sources=$sources&apiKey=$API_KEY")
        .body<NewsList>()
        .articles
}

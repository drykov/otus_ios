package org.rykov.hw9

import kotlinx.serialization.Serializable

@Serializable
data class NewsList(
    val articles: List<NewsItem>?
)

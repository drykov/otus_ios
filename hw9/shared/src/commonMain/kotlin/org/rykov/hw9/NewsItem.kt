package org.rykov.hw9

import kotlinx.serialization.Serializable

@Serializable
data class NewsItem(
    val url: String?,
    val title: String?,
    val author: String?
)
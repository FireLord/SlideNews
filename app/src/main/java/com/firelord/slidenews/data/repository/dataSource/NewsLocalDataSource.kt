package com.firelord.slidenews.data.repository.dataSource

import com.firelord.slidenews.data.model.Article

interface NewsLocalDataSource {
    suspend fun saveArticleToDB(article: Article)
}
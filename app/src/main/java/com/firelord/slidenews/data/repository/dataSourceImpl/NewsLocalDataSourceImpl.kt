package com.firelord.slidenews.data.repository.dataSourceImpl

import com.firelord.slidenews.data.db.ArticleDAO
import com.firelord.slidenews.data.model.Article
import com.firelord.slidenews.data.repository.dataSource.NewsLocalDataSource

class NewsLocalDataSourceImpl(
    private val articleDAO: ArticleDAO
) : NewsLocalDataSource {
    override suspend fun saveArticleToDB(article: Article) {
        articleDAO.insert(article)
    }

}
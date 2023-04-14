package com.firelord.slidenews.domain.usecase

import com.firelord.slidenews.data.model.Article
import com.firelord.slidenews.domain.repository.NewsRepository

class DeleteSavedNewsUseCase(private val newsRepository: NewsRepository) {
    suspend fun execute(article: Article) = newsRepository.deleteNews(article)
}
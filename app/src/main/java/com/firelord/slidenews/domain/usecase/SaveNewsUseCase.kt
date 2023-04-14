package com.firelord.slidenews.domain.usecase

import com.firelord.slidenews.data.model.Article
import com.firelord.slidenews.domain.repository.NewsRepository

class SaveNewsUseCase(private val newsRepository: NewsRepository) {
    suspend fun execute(article: Article) = newsRepository.saveNews(article)
}
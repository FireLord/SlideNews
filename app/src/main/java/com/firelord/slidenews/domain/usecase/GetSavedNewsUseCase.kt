package com.firelord.slidenews.domain.usecase

import com.firelord.slidenews.data.model.Article
import com.firelord.slidenews.domain.repository.NewsRepository
import kotlinx.coroutines.flow.Flow

class GetSavedNewsUseCase(private val newsRepository: NewsRepository) {
    fun execute():Flow<List<Article>>{
        return newsRepository.getSavedNews()
    }
}
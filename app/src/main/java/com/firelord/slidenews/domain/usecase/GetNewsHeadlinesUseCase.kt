package com.firelord.slidenews.domain.usecase

import com.firelord.slidenews.data.model.APIResponse
import com.firelord.slidenews.data.util.Resource
import com.firelord.slidenews.domain.repository.NewsRepository

class GetNewsHeadlinesUseCase(private val newsRepository: NewsRepository) {
    suspend fun execute(country: String, page : Int) : Resource<APIResponse>{
        return newsRepository.getNewsHeadlines(country, page)
    }
}
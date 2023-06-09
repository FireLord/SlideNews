package com.firelord.slidenews.domain.usecase

import com.firelord.slidenews.data.model.APIResponse
import com.firelord.slidenews.data.util.Resource
import com.firelord.slidenews.domain.repository.NewsRepository

class GetSearchedNewsUseCase(private val newsRepository: NewsRepository) {
    suspend fun execute(country:String, searchQuery:String, page:Int) : Resource<APIResponse> {
        return newsRepository.getSearchedNews(country, searchQuery, page)
    }
}
package com.firelord.slidenews.data.repository.dataSource

import com.firelord.slidenews.data.model.APIResponse
import retrofit2.Response
import retrofit2.http.Query

interface NewsRemoteDataSource {
    suspend fun getTopHeadlines(country: String, page : Int):Response<APIResponse>
    suspend fun getSearchedNews(country: String, page : Int, searchQuery: String):Response<APIResponse>
}
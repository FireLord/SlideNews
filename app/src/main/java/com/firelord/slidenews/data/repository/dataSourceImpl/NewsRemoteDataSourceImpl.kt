package com.firelord.slidenews.data.repository.dataSourceImpl

import com.firelord.slidenews.data.api.NewsAPIService
import com.firelord.slidenews.data.model.APIResponse
import com.firelord.slidenews.data.repository.dataSource.NewsRemoteDataSource
import retrofit2.Response

class NewsRemoteDataSourceImpl(
    private val newsAPIService: NewsAPIService,
    private val country:String,
    private val page:Int
) : NewsRemoteDataSource {
    override suspend fun getTopHeadlines(): Response<APIResponse> {
        return newsAPIService.getTopHeadlines(country,page)
    }
}
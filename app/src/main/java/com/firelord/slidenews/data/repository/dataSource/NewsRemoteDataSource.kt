package com.firelord.slidenews.data.repository.dataSource

import com.firelord.slidenews.data.model.APIResponse
import retrofit2.Response

interface NewsRemoteDataSource {
    suspend fun getTopHeadlines(country: String, page : Int):Response<APIResponse>
}
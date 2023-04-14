package com.firelord.slidenews.presentation.di

import com.firelord.slidenews.data.api.NewsAPIService
import com.firelord.slidenews.data.repository.dataSource.NewsRemoteDataSource
import com.firelord.slidenews.data.repository.dataSourceImpl.NewsRemoteDataSourceImpl
import dagger.Module
import dagger.Provides
import dagger.hilt.InstallIn
import dagger.hilt.components.SingletonComponent
import javax.inject.Singleton

@Module
@InstallIn(SingletonComponent::class)
class RemoteDataModule {

    @Singleton
    @Provides
    fun provideNewsRemoteDataSource(
        newsAPIService: NewsAPIService
    ):NewsRemoteDataSource{
        return NewsRemoteDataSourceImpl(newsAPIService)
    }
}
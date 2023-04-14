package com.firelord.slidenews.presentation.di

import com.firelord.slidenews.data.repository.dataSource.NewsRemoteDataSource
import com.firelord.slidenews.data.repository.dataSourceImpl.NewsRemoteDataSourceImpl
import com.firelord.slidenews.data.repository.dataSourceImpl.NewsRepositoryImpl
import com.firelord.slidenews.domain.repository.NewsRepository
import dagger.Module
import dagger.Provides
import dagger.hilt.InstallIn
import dagger.hilt.components.SingletonComponent
import javax.inject.Singleton

@Module
@InstallIn(SingletonComponent::class)
class RepositoryModule {

    @Singleton
    @Provides
    fun provideNewsRepository(
        newsRemoteDataSource: NewsRemoteDataSource
    ):NewsRepository{
        return NewsRepositoryImpl(newsRemoteDataSource)
    }
}
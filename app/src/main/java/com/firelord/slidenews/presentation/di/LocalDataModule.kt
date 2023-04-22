package com.firelord.slidenews.presentation.di

import com.firelord.slidenews.data.db.ArticleDAO
import com.firelord.slidenews.data.repository.dataSource.NewsLocalDataSource
import com.firelord.slidenews.data.repository.dataSourceImpl.NewsLocalDataSourceImpl
import dagger.Module
import dagger.Provides
import dagger.hilt.InstallIn
import dagger.hilt.components.SingletonComponent
import javax.inject.Singleton

@Module
@InstallIn(SingletonComponent::class)
class LocalDataModule {

    @Singleton
    @Provides
    fun provideLocalDataSource(articleDAO: ArticleDAO):NewsLocalDataSource{
        return NewsLocalDataSourceImpl(articleDAO)
    }
}
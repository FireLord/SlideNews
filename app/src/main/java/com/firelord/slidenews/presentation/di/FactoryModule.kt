package com.firelord.slidenews.presentation.di

import android.app.Application
import com.firelord.slidenews.domain.usecase.GetNewsHeadlinesUseCase
import com.firelord.slidenews.domain.usecase.GetSavedNewsUseCase
import com.firelord.slidenews.domain.usecase.GetSearchedNewsUseCase
import com.firelord.slidenews.domain.usecase.SaveNewsUseCase
import com.firelord.slidenews.presentation.viewModel.NewsViewModelFactory
import dagger.Module
import dagger.Provides
import dagger.hilt.InstallIn
import dagger.hilt.components.SingletonComponent
import javax.inject.Singleton

@Module
@InstallIn(SingletonComponent::class)
class FactoryModule {

    @Singleton
    @Provides
    fun provideNewsViewModelFactory(
        application: Application,
        getNewsHeadlinesUseCase: GetNewsHeadlinesUseCase,
        getSearchedNewsUseCase: GetSearchedNewsUseCase,
        saveNewsUseCase: SaveNewsUseCase,
        getSavedNewsUseCase: GetSavedNewsUseCase
    ):NewsViewModelFactory{
        return NewsViewModelFactory(
            application,
            getNewsHeadlinesUseCase,
            getSearchedNewsUseCase,
            saveNewsUseCase,
            getSavedNewsUseCase
        )
    }
}
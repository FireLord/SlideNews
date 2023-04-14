package com.firelord.slidenews.presentation.di

import android.app.Application
import com.firelord.slidenews.domain.usecase.GetNewsHeadlinesUseCase
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
        getNewsHeadlinesUseCase: GetNewsHeadlinesUseCase
    ):NewsViewModelFactory{
        return NewsViewModelFactory(
            application,
            getNewsHeadlinesUseCase
        )
    }
}
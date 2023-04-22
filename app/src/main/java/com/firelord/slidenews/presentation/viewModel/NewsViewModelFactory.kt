package com.firelord.slidenews.presentation.viewModel

import android.app.Application
import androidx.lifecycle.ViewModel
import androidx.lifecycle.ViewModelProvider
import com.firelord.slidenews.domain.usecase.DeleteSavedNewsUseCase
import com.firelord.slidenews.domain.usecase.GetNewsHeadlinesUseCase
import com.firelord.slidenews.domain.usecase.GetSavedNewsUseCase
import com.firelord.slidenews.domain.usecase.GetSearchedNewsUseCase
import com.firelord.slidenews.domain.usecase.SaveNewsUseCase

class NewsViewModelFactory(
    private val app: Application,
    private val getNewsHeadlinesUseCase: GetNewsHeadlinesUseCase,
    private val getSearchedNewsUseCase: GetSearchedNewsUseCase,
    private val saveNewsUseCase: SaveNewsUseCase,
    private val getSavedNewsUseCase: GetSavedNewsUseCase,
    private val deleteSavedNewsUseCase: DeleteSavedNewsUseCase
):ViewModelProvider.Factory {
    override fun <T : ViewModel> create(modelClass: Class<T>): T {
        return NewsViewModel(app, getNewsHeadlinesUseCase, getSearchedNewsUseCase, saveNewsUseCase, getSavedNewsUseCase, deleteSavedNewsUseCase) as T
    }
}
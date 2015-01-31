" Vim syntax file
" Language: CUDA (NVIDIA Compute Unified Device Architecture)
" Maintainer:   Timothy B. Terriberry <tterribe@users.sourceforge.net>
" Last Change:  2007 Oct 13


" CUDA extentions for cuda type
syn keyword cudaType        cufftComplex cufftDoubleComplex
syn keyword cudaType        cufftHandle cudaEvent_t 

syn keyword cudaFFTConstant CUFFT_FORWARD CUFFT_INVERSE CUFFT_C2C 
syn keyword cudaConstant    cudaHostAllocDefault

hi def link cudaType                Type
hi def link cudaFFTConstant         Constant
hi def link cudaConstant            Constant

" vim: ts=8

" Vim syntax file
" Language: CUDA (NVIDIA Compute Unified Device Architecture)
" Maintainer:   Timothy B. Terriberry <tterribe@users.sourceforge.net>
" Last Change:  2007 Oct 13


" CUDA extentions for function

syn keyword cudaGeneral     cudaMalloc cudaMemcpy cudaFree cudaThreadSynchronize __syncthreads cudaMemcpyToSymbol cudaUnbindTexture cudaBindTexture tex1Dfetch tex2D cudaCreateChannelDesc cudaBindTexture2D cudaMemset cudaGetDeviceProperties cudaHostAlloc cudaFreeHost cudaMallocPitch cudaMemcpy2D cudaGetLastError cudaGetErrorString

syn keyword cudaEvent       cudaEventCreate cudaEventRecord cudaEventSynchronize cudaEventElapsedTime cudaEventDestroy
syn keyword cudaHelper      checkCudaErrors getLastCudaError

syn keyword cudaFFT         cufftDestroy cufftExecC2C cufftPlan1d cufftPlan2d


hi def link cudaGeneral     Identifier
hi def link cudaFFT         Identifier
hi def link cudaHelper      Identifier
hi def link cudaEvent       Identifier


" vim: ts=8

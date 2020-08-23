#include <cuda_runtime.h>
#include <iostream>

__global__ void add(int a,int b,int*c)
{
    *c=a+b;
}

int main()
{
    int*dc,*hc;
    hc=new int;
    cudaMalloc(&dc,sizeof(int));
    add<<<1,1>>>(2,3,dc);
    cudaMemcpy(hc,dc,sizeof(int),cudaMemcpyDeviceToHost);
    std::cout<<*hc<<std::endl;
    cudaFree(dc);
}
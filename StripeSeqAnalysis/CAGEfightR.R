#!/usr/bin/env /Data6/wanjie/micromamba/envs/jupyter-R/bin/Rscript
#这只是默认写法，用于识别Rscript的执行路径，和Shell或者Python脚本的写法类似

# Author: Wanjie Feng
# Date:   2024.02.27

## 2.library packages
suppressMessages(library(CAGEfightR))
suppressMessages(library(optparse))
options(warn = -1)  #是一个R中的设置，用于禁止警告信息的显示。将该设置放在你的脚本开头可以将警告信息的输出关闭，这样在加载和安装包时就不会显示警告。
# 清理工作环境 clean enviroment object
rm(list=ls()) 

# -----------------------------------------------------------------------

# 解析命令行
if (TRUE){
    option_list <- list(
        make_option(c("-i", "--input"), 
                    type="character",
                    default="input.txt",
                    help="Input table file to read [default %default]"),
        
        make_option(c("-o", "--output"), 
                    type="character", 
                    default="output",
                    help="output prefix [default %default]")
    )
    
    opts <- parse_args(OptionParser(option_list=option_list))
    
    # 显示输入输出确认是否正确
    print(paste("The input file is ", opts$input,  sep = ""))
    print(paste("The output file prefix is ", opts$output, sep = ""))
}

convertBAM2BigWig(opts$input,
                 outputPlus = paste("mysample",opts$output,"plus.bw",sep="."), 
                 outputMinus=paste("mysample",opts$output,"minus.bw",sep="."))


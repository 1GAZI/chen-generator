package com.chen.maker.generator.main;

/**
 * 生成代码生成器
 */
public class MainGenerator extends GenerateTemplate {
        //模板方法模式不想要哪個功能直接重写即可
    @Override
    protected void buildDist(String outputPath, String sourceCopyDestPath, String jarPath, String shellOutputFilePath) {
        System.out.println("不要给我输出 dist 啦！");
    }
}
package com.chen.generator;
import com.chen.model.MainTemplateConfig;
import freemarker.template.TemplateException;

import java.io.File;
import java.io.IOException;

/**
 * 核心生成器(整合静态和动态生成文件)
 */
public class MainGenerator {

    public static void main(String[] args) throws TemplateException, IOException {
        MainTemplateConfig mainTemplateConfig = new MainTemplateConfig();
        mainTemplateConfig.setAuthor("chen");
        mainTemplateConfig.setLoop(false);
        mainTemplateConfig.setOutputText("求和结果：");
        doGenerate(mainTemplateConfig);
    }

    /**
     * 生成
     *
     * @param model 数据模型
     * @throws TemplateException
     * @throws IOException
     */
    public static void doGenerate(Object model) throws TemplateException, IOException {
        String projectPath = System.getProperty("user.dir");


        // 生成静态文件
        String inputStatusPath = new File(projectPath, "demoProjects/acmTemplate").getAbsolutePath();
        String outputStatusPath = projectPath;
        StaticGenerator.copyFilesByRecursive(inputStatusPath, outputStatusPath);


        // 生成动态文件（只需要将静态生成的文件覆盖即可）
        String inputDynamicFilePath = projectPath + File.separator +"chen-generator-basic"+File.separator+ "src/main/resources/templates/MainTemplate.java.ftl";
        String outputDynamicFilePath = outputStatusPath + File.separator + "acmTemplate/src/com/chen/acm/MainTemplate.java";
        DynamicGenerator.doGenerate(inputDynamicFilePath, outputDynamicFilePath, model);
    }


}

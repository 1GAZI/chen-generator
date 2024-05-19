package com.chen.maker;


import com.chen.maker.generator.main.GenerateTemplate;
import com.chen.maker.generator.main.ZipGenerator;
import freemarker.template.TemplateException;

import java.io.IOException;

public class Main {

    public static void main(String[] args) throws TemplateException, IOException, InterruptedException {
        GenerateTemplate generateTemplate = new ZipGenerator();
        generateTemplate.doGenerate();
    }
}

package com.chen.cli.command;

import cn.hutool.core.util.ReflectUtil;

import com.chen.model.MainTemplateConfig;
import picocli.CommandLine.Command;

import java.lang.reflect.Field;
import java.util.Map;

@Command(name = "config", description = "查看参数信息", mixinStandardHelpOptions = true)
public class ConfigCommand implements Runnable {

    public void run() {
        // 实现 config 命令的逻辑
        System.out.println("查看参数信息");

//     原生JDK的反射
//       Class<?> myClass = MainTemplateConfig.class;
//       Field[] fields = myClass.getDeclaredFields();

        Field[] fields = ReflectUtil.getFields(MainTemplateConfig.class);

        // 遍历并打印每个字段的信息
        for (Field field : fields) {
            System.out.println("字段名称：" + field.getName());
            System.out.println("字段类型：" + field.getType());
            System.out.println("---");
        }
    }
}

package com.chen.maker.template.model;

import com.chen.maker.meta.Meta;
import lombok.Data;

/**
 * 模板制作配置
 */
@Data
public class TemplateMakerConfig {


     private  long id;

     private String originProjectPath;

     private TemplateMakerFileConfig fileConfig =new TemplateMakerFileConfig();

     private TemplateMakerModelConfig modelConfig =new TemplateMakerModelConfig();

     private Meta meta =new Meta();

     private  TemplateMakerOutputConfig templateMakerOutputConfig=new TemplateMakerOutputConfig();
}

package com.bcyportfolio.shopping.configs;

import com.bcyportfolio.shopping.interceptors.AttributeInterceptor;
import com.bcyportfolio.shopping.interceptors.AutoSignInterceptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {
    private final AutoSignInterceptor autoSignInterceptor;
    private final AttributeInterceptor attributeInterceptor;

    @Autowired
    public WebMvcConfig(AutoSignInterceptor autoSignInterceptor, AttributeInterceptor attributeInterceptor) {
        this.autoSignInterceptor = autoSignInterceptor;
        this.attributeInterceptor = attributeInterceptor;
    }

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/**")
                .addResourceLocations("/WEB-INF/statics/");
    }

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(this.autoSignInterceptor)
                .addPathPatterns("/**")
                .excludePathPatterns("/**.css", "/**.png", "/**.jpg", "/**.js");
        registry.addInterceptor(this.attributeInterceptor)
                .addPathPatterns("/**")
                .excludePathPatterns("/**.css", "/**.png", "/**.jpg", "/**.js");
    }
}
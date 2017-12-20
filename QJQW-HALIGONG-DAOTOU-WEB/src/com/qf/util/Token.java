package com.qf.util;

import java.lang.annotation.Retention;
import java.lang.annotation.Target;
import java.lang.annotation.*;
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
public @interface Token {
    boolean save() default false;
    boolean remove() default false;
}

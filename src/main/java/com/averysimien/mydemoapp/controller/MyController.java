package com.averysimien.mydemoapp.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController("/")
public class MyController {

    @RequestMapping
    public String sayRoot() {
        return "I am root!";
    }

    @RequestMapping("api/health")
    public String sayHello() {
        return "API Health is good!";
    }

    @RequestMapping("api/ping")
    public String sayPing() {
        return "API ping!";
    }

    @RequestMapping("api/user")
    public String sayUser() {
        return "I am User!";
    }

    @RequestMapping("api/groot")
    public String sayGroot() {
        return "I am Groot!";
    }


}

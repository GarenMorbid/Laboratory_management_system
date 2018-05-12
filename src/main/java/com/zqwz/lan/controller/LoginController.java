package com.zqwz.lan.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController {
    @RequestMapping(value = "/start.action")
    public String  start(){
        return "login";
    }
}

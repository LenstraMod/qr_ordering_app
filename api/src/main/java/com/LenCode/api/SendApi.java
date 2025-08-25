package com.LenCode.api;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@CrossOrigin(origins = "http://localhost:5173/")
public class SendApi {
    
    @GetMapping("/api/send")
    public String sending(){
        return "Recieved by QR based APP for food ordering🚨🔥";
    }
}

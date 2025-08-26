package com.LenCode.api;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Map;

@RestController
public class DbPingController {

    private final DataSource ds;

    // Spring will inject the DataSource here automatically
    public DbPingController(DataSource ds) {
        this.ds = ds;
    }

    @GetMapping("/api/db-ping")
    public Map<String, Object> ping() throws Exception {
        try (Connection c = ds.getConnection();
             Statement st = c.createStatement();
             ResultSet rs = st.executeQuery("select 1")) {

            rs.next();
            return Map.of("db", "ok", "val", rs.getInt(1));
        }
    }
}


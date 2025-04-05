
1) ./config are genrated by config modules
    default.json is default config gile
    If NODE_ENV=production then production.json will override the default.json

2) set $env:DEBUG='app:*' or 'app:scope1,app:scope1,-app:scope_minus,' to read debug
    set $env:DEBUG=  To Reset and hide log
    Debug package in use


 3) Use nodemon index.js to start the project 
 4) If this is not working then use npm install dotenv and then start the project.

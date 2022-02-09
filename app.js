const dotenv = require("dotenv");
const express = require("express");
const bodyParser = require("body-parser");
const exphbs = require("express-handlebars");
const path = require("path");
const hbsHelpers = require("./helpers/hbsHelper");
const session = require("express-session");
const MemoryStore = require("memorystore")(session);
const nocache = require("nocache");
const fse = require("fs-extra");
const db = require("./models/db");
const http = require("http");
const https = require("https");

const app = express();
const routes = require("./routes/routes.js");

const hbs = exphbs.create({
    defaultLayout: "main",
    extname: ".hbs",
    layoutsDir: path.join(__dirname, "views/layouts"),
    partialsDir: path.join(__dirname, "views/partials"),
    helpers: hbsHelpers,
});

dotenv.config({ path: path.join(__dirname, ".env") });

const port = process.env.PORT || 3000;
let logPath = "logs";

if (process.env.PORTABLE_EXECUTABLE_DIR !== undefined) {
    logPath = path.join(process.env.PORTABLE_EXECUTABLE_DIR, logPath);
}

if (!fse.existsSync(logPath)) {
    fse.mkdirSync(logPath);
}

// Initialize Database
db.initDB();

app.engine("hbs", hbs.engine);
app.set("view engine", ".hbs");
app.use(bodyParser.urlencoded({ extended: false }));
app.use(express.static(path.join(__dirname, "/public")));
app.use(
    session({
        cookie: { maxAge: 86400000 }, // 1 day
        store: new MemoryStore({
            checkPeriod: 86400000,
        }),
        saveUninitialized: true,
        resave: false,
        secret: process.env.COOKIE_SECRET || "christian-church",
    })
);
app.use(nocache());

app.use("/", routes);

// if route is not defined in the server, render an error message
app.use(function (req, res) {
    res.render("error", {
        css: ["global", "error"],
        status: {
            code: "404",
            message: "Not Found",
        },
        Level: parseInt(req.session.level),
    });
});

if (process.env.NODE_ENV === "production") {
    // Run via HTTPS
    const httpPort = parseInt(process.env.HTTP_PORT) || 80;
    const httpsPort = parseInt(process.env.HTTPS_PORT) || 443;
    https
        .createServer(
            {
                key: fse.readFileSync(path.join(__dirname, "ssl/privkey.pem")),
                cert: fse.readFileSync(path.join(__dirname, "ssl/cert.pem")),
            },
            app
        )
        .listen(httpsPort, () => {
            console.log("Disciples Christian Church Digital Archives");
            console.log(`Webserver is listening on port ${httpsPort}`);
            console.log(`Current Node Environment: ${process.env.NODE_ENV || "unconfigured"}`);
            console.log(`SSL: YES`);
        });
    // Start http redirect server
    const redirectApp = express();
    redirectApp.use((req, res) => {
        res.redirect(`https://${req.headers.host}${req.url}`);
    });
    http.createServer(redirectApp).listen(httpPort, () => {
        console.log(`HTTP Redirector Started on port ${httpPort}`);
    });
} else {
    // Run via HTTP only
    http.createServer(app).listen(port, () => {
        console.log("Disciples Christian Church Digital Archives");
        console.log(`Webserver is listening on port ${port}`);
        console.log(`Current Node Environment: ${process.env.NODE_ENV || "unconfigured"}`);
        console.log(`SSL: NO`);
    });
}

module.exports = app;

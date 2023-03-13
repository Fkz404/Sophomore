// Import library
const express = require('express');
const cookieParser = require('cookie-parser');
const sessions = require('express-session');

// Initial express app
const app = express();


/* SESSION SETUP */
var session = require('express-session');

app.use(session({
    secret: 'MyKey',
    resave: false,
    saveUninitialized: false,
    cookie: {secure:true}
}));


/* ROUTES SETUP */
const port = process.env.PORRT || 3000;
app.listen(port, () => console.log('App listening on port' + port));

app.get('/', (req, res) => res.sendFile('/Index.html', {root : __dirname}));
app.get('/success', (req, res) => res.send('You have successfully logged in'));
app.get('/error', (req, res) => res.send('error logging in'));



// Parsing the incoming data
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// Serving public file
app.use(express.static(__dirname));

// Cookie parser middleware
app.use(cookieParser());

// Setup authorization credentials
const myusername = 'admin'
const mypassword = '1234'

/* PASSPORT SETUP */
const passport = require('passport');
app.use(passport.initialize());
app.use(passport.session());

passport.serializeUser(function(user, cb){
    cb(null, user);
});

passport.deserializeUser(function(obj, cb){
    cb(null, obj);
});


// page => User
app.post('/user', (req, res) => {
    if(req.body.username == myusername && req.body.password == mypassword){
        session = req.session;
        session.userid = req.body.username;
        console.log(req.session)
        res.sendFile("/homepage.html", {root: __dirname});
    }
    else {
        // Login failed, display an error message
        res.send('error: Login failed')
      }
})



// page => Error
app.get('*', (req, res) => {
    res.send('Page not found (Error 404)')
})


const express = require('express');
const router = express.Router();
const LocalStrategy = require('passport-local').Strategy;

const passport = require('passport');
const { isLoggedIn, isNotLoggedIn } = require('../lib/auth');

// SIGNUP
router.get('/signup', isNotLoggedIn, (req, res) => {
    res.render('auth/signup');
});

router.post('/signup', isNotLoggedIn, passport.authenticate('localsignup', {
    successRedirect: '/profile',
    failureRedirect: '/signup',
    failureFlash: true
}));

// SINGIN
router.get('/signin', isNotLoggedIn, (req, res) => {
    res.render('auth/signin');
});

router.post('/signin', isNotLoggedIn, (req, res, next) => {
    passport.authenticate('localsignin', {
        successRedirect: '/profile',
        failureRedirect: '/signin',
        failureFlash: true
    })(req, res, next);
});

router.get('/logout', isLoggedIn, (req, res) => {
    req.logOut();
    res.redirect('/');
});

router.get('/profile', isLoggedIn, (req, res) => {
    res.render('profile');
});

module.exports = router;
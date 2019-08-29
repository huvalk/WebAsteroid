"use strict";


$(document).on("turbolinks:load", function () {
    function elem(s) {
        s = s.toString();
        return document.getElementById(s);
    }

    function hideAllBoxes() {
        let arr = document.getElementsByClassName("myBox");
        for (let i = 0; i < arr.length; i++) {
            const box = arr[i];
            box.hidden = true;
        }
    }

    function addListenersToButtons() {
        elem("b4").addEventListener("click", function () {
            hideAllBoxes();
            elem("aboutCreator").hidden = false;
        });

        elem("b3").addEventListener("click", function () {
            hideAllBoxes();
            elem("aboutGame").hidden = false;
        });

        elem("b5").addEventListener("click", function () {
            hideAllBoxes();
            elem("mainMenu").hidden = false;
        });

        elem("b6").addEventListener("click", function () {
            hideAllBoxes();
            elem("mainMenu").hidden = false;
        });

        elem("b7").addEventListener("click", function () {
            hideAllBoxes();
            elem("mainMenu").hidden = false;
        });

        elem("b2").addEventListener("click", function () {
            hideAllBoxes();
            elem("recordBox").hidden = false;
        });

        elem("b1").addEventListener("click", function () {
            hideAllBoxes();
            elem("mainMenu").hidden = false;
            elem("centerBox").hidden = true;
            elem("gameBox").hidden = false;
            elem("canva").hidden = false;
            let pause = false;
        });
    }

    elem("centerBox").hidden = false;
    addListenersToButtons();
});

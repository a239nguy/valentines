<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>To my favorite person</title>
    <script src="https://cdn.jsdelivr.net/npm/canvas-confetti@1.4.0/dist/confetti.browser.min.js"></script>
    <style>
        body {
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #9dd0e1;
            color: white;
            font-family: "Comic Sans MS", cursive, sans-serif;
            text-align: center;
            overflow: hidden;
            position: relative;
        }

        h1, h2 {
            margin: 0;
            padding: 10px;
        }

        img {
            width: 350px;
            height: 350px;
            object-fit: scale-down;
            /*max-width: 80%;
            height: auto;*/
            border-radius: 70%;
            margin: 20px 0;
        }

        button {
            background-color: white;
            color: #63b4cf;
            border: none;
            padding: 10px 20px;
            font-size: 16px;
            font-weight: 800;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

            button:hover {
                background-color: #f0f8ff; /* Slightly lighter blue */
            }


        #heart {
            position: absolute;
            width: 800px;
            height: 1080px;
            margin-top: 10px;
            z-index: -1;
            top: 50%;
            left: 50%;
            transform: translate(-69%, -40%);
        }

            #heart::before, #heart::after {
                content: "";
                position: absolute;
                top: 0;
                width: 554px;
                height: 864px;
                border-radius: 400px 400px 0 0;
                background: #ff8080;
            }

            #heart::before {
                left: 554px;
                transform: rotate(-45deg);
                transform-origin: 0 100%;
            }

            #heart::after {
                left: 0px;
                transform: rotate(45deg);
                transform-origin: 100% 100%;
            }
    </style>
    <script type="text/javascript">
        let currentScreen = 0;
        const screens = ["intro", "photos", "hesitation", "question", "celebrate"]

        let photoIndex = 1;
        const headers = ["You're amazing!", "You're the best!", "You make me smile!", "You're my sunshine!"];

        let hesiIndex = 0;
        let noCount = 0;
        let noPhrase = ["please?", "pretty please?", "hey...", "haha...", "very funny...", "okay jokes over",
            "quit playing around", "i put a lot into this", "liann...", "i'm serious.", "enough is enough",
            "PRESS THE FKN BUTTON", "'which button' haha.. very funny. now click it.", "you're understood."]

        function updateContentNo() {
            //increase yes size, decrease no size, update text

            //Adjust button sizes
            let yesButtonSize = parseFloat(window.getComputedStyle(document.getElementById("updateButton")).fontSize);
            document.getElementById("updateButton").style.fontSize = yesButtonSize + 5 + "px";

            let noButtonSize = parseFloat(window.getComputedStyle(document.getElementById("noButton")).fontSize);
            document.getElementById("noButton").style.fontSize = noButtonSize - 3 + "px";

            document.getElementById("headerText").innerText = noPhrase[noCount];
            noCount++;

            if (noCount === noPhrase.length) {
                document.getElementById("heart").style.display = "none";
                document.getElementById("displayedImage").src = "images/giveup.gif";
                document.body.style.backgroundColor = "#ff3333";
            }


        }

        function updateContent() {
            if (screens[currentScreen] === "intro") {
                // Load the photos & update button text
                document.getElementById("updateButton").innerText = "more memories";
                document.getElementById("headerText").innerText = headers[photoIndex];
                document.getElementById("displayedImage").src = "images/image1.jpg";
                document.getElementById("titleText").innerText = "do you remember";
                currentScreen = 1;
                console.log("photoindex: " + photoIndex + " currentscreen: " + currentScreen);
            }
            else if (screens[currentScreen] === "photos") {
                photoIndex = (photoIndex + 1); //% headers.length;
                if (photoIndex === 9) {
                    // Display the wait image and can i ask you something text
                    document.getElementById("titleText").innerText = "last photo!";
                    document.getElementById("updateButton").innerText = "continue";
                    console.log("End of images");
                    currentScreen = 2;
                }


                imageString = "images/image" + photoIndex + ".jpg";
                document.getElementById("headerText").innerText = headers[photoIndex];
                document.getElementById("displayedImage").src = imageString;
                console.log("hit");
            }
            else if (screens[currentScreen] === "hesitation") {
                switch (hesiIndex) {
                    case 0:
                        document.getElementById("titleText").innerText = "BUT WAIT!";
                        document.getElementById("headerText").innerText = "i have a question for you..";
                        document.getElementById("displayedImage").src = "images/catwait.jpg";
                        hesiIndex++;
                        break;
                    case 1:
                        document.getElementById("titleText").innerText = "wait im getting nervous";
                        document.getElementById("headerText").innerText = "this is awkward";
                        document.getElementById("displayedImage").src = "images/nervous.gif";
                        hesiIndex++;
                        break;
                    case 2:
                        document.getElementById("titleText").innerText = "will you be my valentine?";
                        document.getElementById("headerText").innerText = "";
                        document.getElementById("displayedImage").src = "images/rose.gif";
                        document.getElementById("noButton").style.display = "inline";
                        document.getElementById("updateButton").innerText = "yes!";
                        currentScreen++;
                        break;
                }
            }
            else if (screens[currentScreen] === "question") {
                document.getElementById("heart").style.display = "inline";
                document.getElementById("displayedImage").style.width = "400px";
                document.getElementById("displayedImage").style.height = "350px";
                document.getElementById("displayedImage").src = "images/minionyay.gif";
                document.body.style.backgroundColor = "#9dd0e1";

                //hide buttons, update text, confetti, and sound
                document.getElementById("titleText").innerText = "LET'S GO!!";
                document.getElementById("headerText").innerText = "i knew you'd say yes";
                document.getElementById("updateButton").style.display = "none";
                document.getElementById("noButton").style.display = "none";

                confetti({
                    particleCount: 200,
                    spread: 90,
                    origin: { x: 0.5, y: 0.5 } // Center of the screen
                });

            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div id="heart"></div>
        <h1 id="titleText" style="padding-bottom: 10px; font-size: 50px">to my favorite person</h1>

        <h2 id="headerText">ARE YOU READY?!!</h2>
        <img id="displayedImage" src="images/kirbygo.gif" alt="Image" />
        <br />
        <span>
            <button id="updateButton" type="button" onclick="updateContent()">LET'S GO!</button>
            <button id="noButton" type="button" onclick="updateContentNo()" style="display: none">hell no.</button>
        </span>

    </form>
</body>
</html>

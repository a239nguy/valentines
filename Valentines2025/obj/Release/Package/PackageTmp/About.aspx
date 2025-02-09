<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>To my favorite person</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body, html {
            height: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: #f0f0f0;
        }

#heart {
  position: relative;
  width: 100px;
  height: 90px;
  margin-top: 10px;
}

#heart::before, #heart::after {
  content: "";
  position:absolute;
  top: 0;
  width: 52px;
  height: 80px;
  border-radius: 50px 50px 0 0;
  background: red;
}

#heart::before {
  left: 50px;
  transform: rotate(-45deg);
  transform-origin: 0 100%;
}

#heart::after {
  left: 0;
  transform: rotate(45deg);
  transform-origin: 100% 100%;
}
    </style>
    <script type="text/javascript">
        let index = 0;
        const headers = ["You're amazing!", "You're the best!", "You make me smile!", "You're my sunshine!"];
        const images = ["~/Content/image1.png", "image1.png", "images/image3.jpg", "images/image4.jpg"];

        function updateContent() {
            Response.Redirect("Default.aspx");
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
<%--        <div>
            <h1>ARE YOU READY?!!?!</h1>
            <img id="displayedImage" src="images/kirbygo.gif" alt="Image" />
            <br />
            <button type="button" onclick="updateContent()">LET'S GO</button>
        </div>--%>
        <div id="heart"/>
    </form>
</body>
</html>

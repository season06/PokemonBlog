<html>

<head>
    <title>Success</title>
    <style>
        @import url("https://fonts.googleapis.com/css?family=Caveat");

        body {
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            background-image: url("./frontend_pict/success.jpg");
            background-size: 100% 100%;
            background-repeat: no-repeat;
        }

        .container{
            position: absolute;
            top: 30%;
            left: 35%;
        }
        p {
            font-family: "Caveat";
            font-size: 80px;
            color: white;
            line-height: 60px;
            font-weight: bold;
            text-shadow: 0 0 10px grey;
        }

        .success {
            text-align: center;
        }

        a {
            font-family: Arial, Helvetica, sans-serif;
            text-decoration: none;
            color: white;
        }

        a:hover {
            transition: .5s;
            text-shadow: 0 0 10px white,
                0 0 20px white,
                0 0 40px white;
        }
    </style>
</head>

<div class="success">
    <canvas id="canvas"></canvas>
    <div class="container">
        <p>Welcome <span>${param.username}</span></p> <p>you regist success</p>
        <a href="homepage.jsp">back to login</a>
    </div>

</div>

<script>
    //resource: https://www.bracketsacademy.com/2018/11/14/html-canvas-snow-effect-with-javascript/
    var canvas = document.getElementById("canvas");
    var ctx = canvas.getContext("2d");
    var particlesOnScreen = 245;
    var particlesArray = [];
    var w, h;
    w = canvas.width = window.innerWidth;
    h = canvas.height = window.innerHeight;

    function random(min, max) {
        return min + Math.random() * (max - min + 1);
    };

    function clientResize(ev) {
        w = canvas.width = window.innerWidth;
        h = canvas.height = window.innerHeight;
    };
    window.addEventListener("resize", clientResize);

    function createSnowFlakes() {
        for (var i = 0; i < particlesOnScreen; i++) {
            particlesArray.push({
                x: Math.random() * w,
                y: Math.random() * h,
                opacity: Math.random(),
                speedX: random(-11, 11),
                speedY: random(7, 15),
                radius: random(0.5, 4.2),
            })
        }
    };

    function drawSnowFlakes() {
        for (var i = 0; i < particlesArray.length; i++) {
            var gradient = ctx.createRadialGradient(
                particlesArray[i].x,
                particlesArray[i].y,
                0,
                particlesArray[i].x,
                particlesArray[i].y,
                particlesArray[i].radius
            );

            gradient.addColorStop(0, "rgba(255, 255, 255," + particlesArray[i].opacity + ")"); // white
            gradient.addColorStop(.8, "rgba(210, 236, 242," + particlesArray[i].opacity + ")"); // bluish
            gradient.addColorStop(1, "rgba(237, 247, 249," + particlesArray[i].opacity + ")"); // lighter bluish

            ctx.beginPath();
            ctx.arc(
                particlesArray[i].x,
                particlesArray[i].y,
                particlesArray[i].radius,
                0,
                Math.PI * 2,
                false
            );

            ctx.fillStyle = gradient;
            ctx.fill();
        }
    };

    function moveSnowFlakes() {
        for (var i = 0; i < particlesArray.length; i++) {
            particlesArray[i].x += particlesArray[i].speedX;
            particlesArray[i].y += particlesArray[i].speedY;

            if (particlesArray[i].y > h) {
                particlesArray[i].x = Math.random() * w * 1.5;
                particlesArray[i].y = -50;
            }
        }
    };

    function updateSnowFall() {
        ctx.clearRect(0, 0, w, h);
        drawSnowFlakes();
        moveSnowFlakes();
    };

    setInterval(updateSnowFall, 50);
    createSnowFlakes();
</script>

</html>
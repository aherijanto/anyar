<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="viewport"
		content="width=device-width, initial-scale=1.0" />
	<title>Web Cam</title>
	<script>
	document.addEventListener("DOMContentLoaded", () => {
		var but = document.getElementById("but");
		var video = document.getElementById("vid");
        var canvas = document.getElementById('myCanvas');
        var context = canvas.getContext('2d');
		var mediaDevices = navigator.mediaDevices;
		vid.muted = true;
		but.addEventListener("click", () => {

		// Accessing the user camera and video.
		mediaDevices
			.getUserMedia({
			video: true,
			audio: true,
			})
			.then((stream) => {

			// Changing the source of video to current stream.
			video.srcObject = stream;
			video.addEventListener("loadedmetadata", () => {
				video.play();
			});
			})
			.catch(alert);
		});
        document.getElementById('snap').addEventListener('click', function() {
				context.drawImage(video, 0, 0, 640, 480);
			});
	});
	</script>
</head>

<style>
	div {
	width: 500px;
	height: 400px;
	border: 2px solid black;
	position: relative;
	}
	video{
	width: 640px;
	height: 480px;
	object-fit: cover;
	}
	
</style>

<body>
	<center>
	    <table>
		    <tr>
			    <td>
				    <video id="vid"></video>
			    </td>
		
	    		<td>
		    		<canvas id="myCanvas" width="640px" height="480px"></canvas>
			    </td>
		    </tr>
		    <tr>
			    <td>
				    <button id="but" autoplay>
					    Open WebCam
				    </button>
				    <button id="snap">
					    Take Photo
				    </button>
			    </td>
                <td>
                    <input type="text" id="filenamemf">
                    <input type="button" onclick="uploadEx()" value="Upload" />
                </td>
		    </tr>
	    </table>
        <form method="post" accept-charset="utf-8" name="form1">
            <input name="hidden_data" id='hidden_data' type="hidden"/>
        </form>
	</center>
</body>
</html>

 
        <script>
            
                // let downloadLink = document.createElement('a');
                // downloadLink.setAttribute('download', 'CanvasAsImage.png');
                // let canvas = document.getElementById('myCanvas');
                // let dataURL = canvas.toDataURL('image/png');
                // let url = dataURL.replace(/^data:image\/png/,'data:application/octet-stream');
                // downloadLink.setAttribute('href', url);
                // downloadLink.click();
                // window.open('copyfile.php?namefile=CanvasAsImage.png','_blank');
              
            function uploadEx() {
                var canvas = document.getElementById("myCanvas");
                var dataURL = canvas.toDataURL("image/png");
                document.getElementById('hidden_data').value = dataURL;
                var fd = new FormData(document.forms["form1"]);
                
                var xhr = new XMLHttpRequest();
                xhr.open('POST', 'testSave.php', true);
                
                xhr.upload.onprogress = function(e) {
                    if (e.lengthComputable) {
                        var percentComplete = (e.loaded / e.total) * 100;
                        console.log(percentComplete + '% uploaded');
                        alert('Succesfully uploaded');
                    }
                };
 
                xhr.onload = function() {
 
                };
                xhr.send(fd);
            };
        </script>
         
        
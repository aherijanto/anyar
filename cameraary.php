

<html>
<style>
		video { border: 1px solid #ccc; display: block; margin: 0 0 20px 0; }
		#canvas { margin-top: 20px; border: 1px solid #ccc; display: block; }
</style>

<body>
	<video id="video" width="200" height="150" autoplay></video>
	<button id="snap" class="sexyButton">Snap Photo</button>
	<canvas id="canvas" width="640" height="480"></canvas>
	<script>
		// Put event listeners into place
		window.addEventListener("DOMContentLoaded", function() {
			// Grab elements, create settings, etc.
            var canvas = document.getElementById('canvas');
            var context = canvas.getContext('2d');
            var video = document.getElementById('video');
            var mediaConfig =  { video: true };
            var errBack = function(e) {
            	console.log('An error has occurred!', e)
            };

			// Put video listeners into place
            if(navigator.mediaDevices && navigator.mediaDevices.getUserMedia) {
                navigator.mediaDevices.getUserMedia(mediaConfig).then(function(stream) {
                    video.src = window.URL.createObjectURL(stream);
                    video.play();
                });
            }

            /* LegmediaDevices.acy code below! */
            else if(navigator.mediaDevices.getUserMedia) { // Standard
				navigator.mediaDevices.getUserMedia(mediaConfig, function(stream) {
					video.src = stream;
					video.play();
				}, errBack);
			} else if(navigator.mediaDevices.webkitGetUserMedia) { // WebKit-prefixed
				navigator.mediaDevices.webkitGetUserMedia(mediaConfig, function(stream){
					video.src = window.webkitURL.createObjectURL(stream);
					video.play();
				}, errBack);
			} else if(navigator.mediaDevices.mozGetUserMedia) { // Mozilla-prefixed
				navigator.mozGetUserMedia(mediaConfig, function(stream){
					video.src = window.URL.createObjectURL(stream);
					video.play();
				}, errBack);
			}

			// Trigger photo take
			document.getElementById('snap').addEventListener('click', function() {
				context.drawImage(video, 0, 0, 640, 480);
			});
		}, false);
	</script>

	<div>
            
            <input type="button" onclick="uploadEx()" value="Upload" />
            <a href="http://localhost/purchase.php">Back</a>
        </div>
 
        <form method="post" accept-charset="utf-8" name="form1">
            <input name="hidden_data" id='hidden_data' type="hidden"/>
        </form>
 
        <script>
            function uploadEx() {
                var canvas = document.getElementById("canvas");
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

</div>
</body>
</html>


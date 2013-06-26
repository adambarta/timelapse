var canvas;
//var context;

var today = (new Date()).toISOString().split("T");

var site = "http://kat-dbes.karoo.kat.ac.za/cmplx/"+today[0]+"/day";

var images = {};
var num_image = 0;
var load_count = 0;

var cur_img = 0;

function image_forward(){
  
  if (images[cur_img]){
    //context.drawImage(images[cur_img], 0, 0, dw, dh);
    canvas.style.backgroundImage = "url("+images[cur_img].src+")";
    cur_img = cur_img + 1;
  }
  if (cur_img == num_images)
    cur_img = 0;
}

/*
function image_backward(){
  if (images[cur_img]){
    context.drawImage(images[cur_img], 0, 0, ww, wh);
    cur_img = cur_img - 1;
  }
  if (cur_img == 0)
    cur_img = num_images-1;
}
*/

window.requestAnimFrame = (function(callback) {
    return window.requestAnimationFrame || window.webkitRequestAnimationFrame || window.mozRequestAnimationFrame || window.oRequestAnimationFrame || window.msRequestAnimationFrame ||
    function(callback) {
      window.setTimeout(callback, 1000);
    };
})();


function animate(){
  image_forward();
  requestAnimFrame(animate);
}

function loadImgs(img_list)
{
  var count = 0;
	
  num_images = img_list.length-1;

  console.log(num_images);

  for(var i=0; i< num_images; i++){
    images[i] = new Image();
    images[i].src = site+"/"+img_list[i+1].text;
    images[i].onload = function(img){
      load_count++;
      if (load_count == num_images){
        console.log("all images loaded");
        //console.log(images[0].width+" "+images[0].height);
        animate();
      }
    }
  }
  
}

function loadDoc(url)
{
  var xmlhttp;

  if (window.XMLHttpRequest)
  {// code for IE7+, Firefox, Chrome, Opera, Safari
    xmlhttp=new XMLHttpRequest();
  }
  else
  {// code for IE6, IE5
    xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
  xmlhttp.onreadystatechange=function()
  {
    
    if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
    {
      var data = xmlhttp.responseText;

      elemt = document.createElement("html");
      elemt.innerHTML = data;
      
      var imgs = elemt.getElementsByTagName("a");
      
      if (imgs.length < 2){
        console.log("no imgs");
        return;
      }

      loadImgs(imgs);
    }
  }

  xmlhttp.open("GET", url, true);
  xmlhttp.setRequestHeader("Access-Control-Allow-Origin", "*");
  xmlhttp.send();
}

function set_up()
{
  //canvas = document.getElementById('can_image');
  canvas = document.getElementsByTagName('body')[0];
  //context = canvas.getContext('2d');

  console.log(canvas.style);

  loadDoc(site);
}



var canvas;
var context;

var today = (new Date()).toISOString().split("T");

var site = "http://kat-dbes.karoo.kat.ac.za/cmplx/"+today[0]+"/day";

var images = {};

var cur_img = 0;

//console.log(today[0]);
//var sources = {
//  darthVader: 'http://www.html5canvastutorials.com/demos/assets/darth-vader.jpg',
//  yoda: 'http://www.html5canvastutorials.com/demos/assets/yoda.jpg'  
//};
/*
function loadImages(sources, callback) {
  var images = {};
  var loadedImages = 0;
  var numImages = 0;
  // get num of sources
  for(var src in sources) {
    numImages++;
  }
  for(var src in sources) {
    images[src] = new Image();
    images[src].onload = function() {
      if(++loadedImages >= numImages) {
        callback(images);
      }
    };
    images[src].src = sources[src];
  }
}
*/


function loadImgs(img_list)
{
  var count = 0;

  for(var i=1; i< img_list.length; i++){
    images[i] = new Image();
    images[i].src = site+"/"+img_list[i].text;
  }

  //console.log(images);
  var canvas = document.getElementById('can_image');
  var context = canvas.getContext('2d');

  var btn = document.getElementById("btn");

  btn.onclick = function(){
    context.drawImage(images[cur_img], 100, 30, 200, 137);
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
    //console.log(xmlhttp.readyState);
    
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
    
  loadDoc(site);
  
  //console.log(site);
/*
  loadImages(sources, function(images) {
      context.drawImage(images.darthVader, 100, 30, 200, 137);
      context.drawImage(images.yoda, 350, 55, 93, 104);
      });
  */
}



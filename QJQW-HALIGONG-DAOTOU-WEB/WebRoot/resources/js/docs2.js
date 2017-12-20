$(function() {

  var console = window.console || {log: function () {}},
      $alert = $(".docs-alert"),
      $message = $alert.find(".message"),
      showMessage = function (message, type) {
        $message.text(message);
        type && $message.addClass(type);
        $alert.fadeIn();

        setTimeout(function () {
          $alert.fadeOut();
        }, 3000);
      };

  // Overview
  // -------------------------------------------------------------------------

  (function() {
    var $image = $(".img-container img"),
        $dataX = 0,
        $dataY = 0,
        $dataHeight = 150,
        $dataWidth = 150,
        $dataRotate = 0,
        options = {
          aspectRatio: 1,
          data: {
            x: 480,
            y: 60,
            width: 200,
            height: 200
          },
          preview: ".img-preview",
          done: function(data) {
				console.log(data)
            /*$dataX.val(Math.round(data.x));
            $dataY.val(Math.round(data.y));
            $dataHeight.val(Math.round(data.height));
            $dataWidth.val(Math.round(data.width));
            $dataRotate.val(data.rotate);*/
          }
        };

    $image.cropper(options).on({
      "build.cropper": function(e) {
        console.log(e.type);
      },
      "built.cropper": function(e) {
        console.log(e.type);
      }
    });
    var ppt = '';
    var cemetery_type =  $("#cemetery_type").val();
    if(cemetery_type=='1'){
    	ppt+=7/5;
    }else{
    	ppt+=4/5;
    }
    $image.cropper("setAspectRatio", ppt);
    $(document).on("click", "[data-method]", function () {
      var data = $(this).data();

      if (data.method) {
        $image.cropper(data.method, data.option);
      }
    });

    var $inputImage = $("#inputImage");
    
    
    if (window.FileReader) {
      $inputImage.change(function() {
        var fileReader = new FileReader(),
            files = this.files,
            file;

        if (!files.length) {
          return;
        }

        file = files[0];

        if (/^image\/\w+$/.test(file.type)) {
          fileReader.readAsDataURL(file);
          fileReader.onload = function () {
            $image.cropper("reset", true).cropper("replace", this.result);
            $inputImage.val("");
          };
        } else {
          showMessage("Please choose an image file.");
        }
      });
    } else {
     // $inputImage.parent().remove();
    }
    
   
    $("#download").click(function() {
      window.open($image.cropper("getDataURL"));
    });

    var $zoomWith = $("#zoomWith");

    $("#zoom").click(function() {
      $image.cropper("zoom", $zoomWith.val());
    });


    var $rotateWith = $("#rotateWith");

    $("#rotate").click(function() {
      $image.cropper("rotate", $rotateWith.val());
    });


    var $getDataInto = $("#getDataInto");

    $("#getData").click(function() {
      var data = $image.cropper("getData"),
          val = "";

      try {
        val = JSON.stringify(data);
      } catch (e) {
        console.log(data);
      }

      $getDataInto.val(val);
    });


    var $setDataX = $("#setDataX"),
        $setDataY = $("#setDataY"),
        $setDataWidth = $("#setDataWidth"),
        $setDataHeight = $("#setDataHeight");

    $("#setData").click(function() {
      var data = {
            x: $setDataX.val(),
            y: $setDataY.val(),
            width: $setDataWidth.val(),
            height: $setDataHeight.val()
          };

      $image.cropper("setData", data);
    });


    var $setAspectRatioWith = $("#setAspectRatioWith");

    $("#setAspectRatio").click(function() {
      $image.cropper("setAspectRatio", $setAspectRatioWith.val());
    });


    var $replaceWith = $("#replaceWith");

    $("#replace").click(function() {
      $image.cropper("replace", $replaceWith.val());
    });


    var $getImageDataInto = $("#getImageDataInto");

    $("#getImageData").click(function() {
      var data = $image.cropper("getImageData"),
          val = "";

      try {
        val = JSON.stringify(data);
      } catch (e) {
        console.log(data);
      }

      $getImageDataInto.val(val);
    });


    var $dataURLInto = $("#dataURLInto"),
        $dataURLView = $("#dataURLView");

    $("#getDataURL").click(function() {
      var dataURL = $image.cropper("getDataURL");

      $dataURLInto.text(dataURL);
      $dataURLView.html('<img src="' + dataURL + '">');
    });

    $("#getDataURL2").click(function() {
		console.log($(".img-container img").attr("src"));
		if($(".img-container img").attr("src").trim()==""){
		  return ;
		}
      var dataURL = $image.cropper("getDataURL", "image/jpeg");
	  $("#imgStr").val(dataURL);
	  test();
    });

    $("#getDataURL3").click(function() {
      var dataURL = $image.cropper("getDataURL", {
            width: 160,
            height: 90
          });

      $dataURLInto.text(dataURL);
      $dataURLView.html('<img src="' + dataURL + '">');
    });

    $("#getDataURL4").click(function() {
      var dataURL = $image.cropper("getDataURL", {
            width: 320,
            height: 180
          }, "image/jpeg", 0.8);

      $dataURLInto.text(dataURL);
      $dataURLView.html('<img src="' + dataURL + '">');
    });
    
    $("#getDataURL5").click(function() {
		console.log($(".img-container img").attr("src"));
		if($(".img-container img").attr("src").trim()==""){
		  alert("请选择图片!");
		  return ;
		}
      var dataURL = $image.cropper("getDataURL", "image/jpeg");
	  $("#imgStr").val(dataURL);
	  test();
	  $(".change_img_bg,.ggtx_window_content").css({display:"none"});
    });

    $(".docs-options :radio").on("change", function (e) {
      var $this = $(this);

      if ($this.is(":checked")) {
        options[$this.attr("name")] = $this.val() === "true" ? true : false;
        $image.cropper("destroy").cropper(options);
      }
    });

    
  }());

  // Sidebar
  // -------------------------------------------------------------------------

  /*(function() {
    var $sidebar = $(".docs-sidebar"),
        offset = $sidebar.offset();
        offsetTop = offset.top;
        mainHeight = $sidebar.parents(".row").height() - $sidebar.height();

    $(window).bind("scroll", function() {
      var st = $(this).scrollTop();

      if (st > offsetTop && (st - offsetTop) < mainHeight) {
        $sidebar.addClass("fixed");
      } else {
        $sidebar.removeClass("fixed");
      }
    });
  }());
*/
  // Examples
  // -------------------------------------------------------------------------

  // Example 1
 /* $(".fixed-dragger-cropper > img").cropper({
    aspectRatio: 640 / 320, // 2 / 1
    autoCropArea: 0.6, // Center 60%
    multiple: false,
    dragCrop: false,
    dashed: false,
    movable: false,
    resizable: false,
    built: function () {
      $(this).cropper("zoom", 0.5);
    }
  });


  // Example 2
  var $image = $(".bootstrap-modal-cropper > img"),
      originalData = {};

  $("#bootstrap-modal").on("shown.bs.modal", function() {
    $image.cropper({
      multiple: true,
      data: originalData,
      done: function(data) {
        console.log(data);
      }
    });
  }).on("hidden.bs.modal", function() {
    originalData = $image.cropper("getData"); // Saves the data on hide
    $image.cropper("destroy");
  });*/
});

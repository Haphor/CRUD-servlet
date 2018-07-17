<style>
/* The Modal (background) */
.modals {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    padding-top: 70px; /* Location of the box */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-contents {
    position: relative;
    background-color: white;
    margin: auto;
    padding: 0;
    border: 1px solid #888;
    width: 30%;
    box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
    -webkit-animation-name: animatetop;
    -webkit-animation-duration: 0.4s;
    animation-name: animatetop;
    animation-duration: 0.4s
}

/* Add Animation */
@-webkit-keyframes animatetop {
    from {top:-300px; opacity:0} 
    to {top:0; opacity:1}
}

@keyframes animatetop {
    from {top:-300px; opacity:0}
    to {top:0; opacity:1}
}

/* The Close Button */
.closes {
    color: white;
    float: right;
    font-size: 28px;
    font-weight: bold;
}

.closes:hover,
.closes:focus {
    color: #000;
    text-decoration: none;
    cursor: pointer;
}

.modal-headers {
    padding: 2px 16px;
    background-color: #3b4451;
    color: white;
}

.modal-bodys {

	padding: 2px 16px;
	font-size: 20px;
	color: red;
}

.modal-footers {
    padding: 2px 16px;
    background-color: #3b4451;
    color: white;
}
</style>
</head>
<body>
<div id="myModals" class="modals">

  <!-- Modal content -->
  <div class="modal-contents">
    <div class="modal-headers">
      <span class="closes">&times;</span>
      <h2>Notice</h2>
    </div>
    <div class="modal-bodys">
      <p>${errormessage}</p>
    </div>
    <div class="modal-footers">
      <h3></h3>
    </div>
  </div>

</div>

<script>
// Get the modal
var modal = document.getElementById('myModals');

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("closes")[0];

// When the user clicks the button, open the modal 
window.onload = function(event) {
	<%
		if(request.getSession().getAttribute("errormessage")!=null)
		{
			out.print("modal.style.display = 'block';");
			request.getSession().removeAttribute("errormessage");
		}
	%>
}

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
	
    modal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
</script>
				------------------------Registrion.jsp---------------------------
				<div class="outerdiv">
					<div class="divleft">
						<div class="div">Email Id :</div>
						&nbsp;<span id="Emailerror" class="spanvaliadate"></span>
						<div>
							<input class="inputclass" type="text" id="Email" name="Email"
								placeholder="eg.hrishikesh.gaikwad@naaptol.com"
								onkeyup="validate.validateemail()"
								onblur="validate.ajaxRegistrationEmailcheck()">
						</div>
					</div>



				-------------------------------------------Javscript file-------------------
this.ajaxEmailcheck=ajaxEmailcheck;
	function ajaxEmailcheck()
	{
		var contextpath=$("#contextpath").val();
		var email=$("#loginEmail").val();
		
		$.post(contextpath+"/ajax/ajaxController.jsp",
				{
					action : "checkEmail",
					email : email
				},
				function(tempdata)
				{
					console.log(tempdata);
					var parsedata=JSON.parse(tempdata);
					if(parsedata.status)
					{
						$("#Emailerror").text(parsedata.data+" "+parsedata.message);
					}
					else
					{
						$("#Emailerror").text(parsedata.message);
					}
						
				}
		);
	}
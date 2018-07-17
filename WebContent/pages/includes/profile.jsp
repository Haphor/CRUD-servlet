
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page trimDirectiveWhitespaces="true" %>
<div style="margin-top:100px;" align="center" id="profile-container">
	<div id="pic">
	
	</div>
	<div  id="info">
		
<%

	com.haphor.userDB.UserDAO ud = new com.haphor.userDB.UserDAOImpl();
	int id = Integer.parseInt(request.getSession().getAttribute("LogId")+"");
	com.haphor.userDB.User u = ud.viewUser(id, "select * from USER where userid=?");
%>
		
			
	</div>
</div>

<style>
.user-row {
    margin-bottom: 14px;
}

.user-row:last-child {
    margin-bottom: 0;
}

.dropdown-user {
    margin: 13px 0;
    padding: 5px;
    height: 100%;
}

.dropdown-user:hover {
    cursor: pointer;
}

.table-user-information > tbody > tr {
    border-top: 1px solid rgb(221, 221, 221);
}

.table-user-information > tbody > tr:first-child {
    border-top: 0;
}


.table-user-information > tbody > tr > td {
    border-top: 0;
}
.toppad{

margin-top:20px;
}



</style>

<script>

	$(document).ready(function(){
		
		$('#editbtn').click(function(){
			$('#cont1').hide();
			$('#cont2').show();
			
		})
		
		$('#editpassbtn').click(function(){
			$('#cont2').hide();
			$('#editpass').show();
		})
		$('#editpassbackbtn').click(function(){
			$('#cont2').show();
			$('#editpass').hide();
		})
		
		$('#editprobackbtn').click(function(){
			$('#cont2').hide();
			$('#cont1').show();
		})
		
	});
	
 $('#cont2').hide();
 $('#editpass').hide();



</script>


<div style="background-color:#eee; width:700px;"class="container">
      <div class="row" id="cont1">
      
        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 col-xs-offset-0 col-sm-offset-0 col-md-offset-3 col-lg-offset-3 toppad" >
          <div class="panel panel-info">
            <div class="panel-heading">
              <h2 class="panel-title"><%out.print(u.getFirstname()+" "+u.getLastname()); %></h2>
            </div>
            <div class="panel-body">
              <div class="row">
                <div class=" col-md-9 col-lg-9 "> 
                  <table class="table table-user-information">
                    <tbody>
                      <tr>
                        <td>User Name:</td>
                        <td><%out.print(u.getUsername()); %></td>
                      </tr>
                      <tr>
                        <td>Email Address: </td>
                        <td><a href="mailto:info@support.com"><%out.print(u.getEmailaddress()); %></a></td>
                      </tr>
                      <tr>
                        <td>Country: </td>
                        <td><%out.print(u.getCountry()); %></td>
                      </tr>
                       <tr>
                        <td>Gender</td>
                        <td><%out.print(u.getGender()); %></td>
                      </tr>
                       <tr>
                        <td>Age</td>
                        <td><%out.print(u.getAge()); %></td>
                      </tr>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-md-5  toppad  pull-right col-md-offset-3 ">
           <A class="pointer" id="editbtn">Edit Profile</A>
           <A href="../LogoutServ" >Sign Out</A>
       	<br>
		<p class=" text-info">May 05,2014,03:00 pm </p>
		  <div style="max-width:300px; max-height: 300px;"class="col-md-3 col-lg-3 " align="center"> <img alt="User Pic" style="width:180px;" src="${pageContext.request.contextPath}/displayImage" class="img-circle img-responsive"> 
          </div>
      </div>
      </div>
      <!-- 	EDIT HERE  -->
      <div class="row" id="cont2">
      <form action="../EditProfile" method="post">
        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 col-xs-offset-0 col-sm-offset-0 col-md-offset-3 col-lg-offset-3 toppad" >
          <div class="panel panel-info">
            <div class="panel-heading">
             
            </div>
            <div class="panel-body">
              <div class="row">
                <div class=" col-md-9 col-lg-9 "> 
                  <table class="table table-user-information">
                    <tbody>
                    <tr>
                    <td>Full name:</td>
                    <td> <input class="panel-title" type="text" value="<%out.print(u.getFirstname());%>" name="fname"><input style="float:left;"class="panel-title" type="text" value="<%out.print(u.getLastname());%>" name="lname"></td>
             		
                      </tr>
                      <tr>
                        <td>User Name:</td>
                        <td><input class="panel-title" type="text" value="<%out.print(u.getUsername()); %>" name="uname"></td>
                      </tr>
                      <tr>
                        <td>Email Address: </td>
                        <td><input class="panel-title" type="email" value="<%out.print(u.getEmailaddress()); %>" name="email"></td>
                      </tr>
                      <tr>
                        <td>Country: </td>
                        <td>
							<select class="panel-title" name="country" id="countries">
											<option value="United States" selected="selected">United States</option> 
											<option value="United Kingdom">United Kingdom</option> 
											<option value="Afghanistan">Afghanistan</option> 
											<option value="Albania">Albania</option> 
											<option value="Algeria">Algeria</option> 
											<option value="American Samoa">American Samoa</option> 
											<option value="Andorra">Andorra</option> 
											<option value="Angola">Angola</option> 
											<option value="Anguilla">Anguilla</option> 
											<option value="Antarctica">Antarctica</option> 
											<option value="Antigua and Barbuda">Antigua and Barbuda</option> 
											<option value="Argentina">Argentina</option> 
											<option value="Armenia">Armenia</option> 
											<option value="Aruba">Aruba</option> 
											<option value="Australia">Australia</option> 
											<option value="Austria">Austria</option> 
											<option value="Azerbaijan">Azerbaijan</option> 
											<option value="Bahamas">Bahamas</option> 
											<option value="Bahrain">Bahrain</option> 
											<option value="Bangladesh">Bangladesh</option> 
											<option value="Barbados">Barbados</option> 
											<option value="Belarus">Belarus</option> 
											<option value="Belgium">Belgium</option> 
											<option value="Belize">Belize</option> 
											<option value="Benin">Benin</option> 
											<option value="Bermuda">Bermuda</option> 
											<option value="Bhutan">Bhutan</option> 
											<option value="Bolivia">Bolivia</option> 
											<option value="Bosnia and Herzegovina">Bosnia and Herzegovina</option> 
											<option value="Botswana">Botswana</option> 
											<option value="Bouvet Island">Bouvet Island</option> 
											<option value="Brazil">Brazil</option> 
											<option value="British Indian Ocean Territory">British Indian Ocean Territory</option> 
											<option value="Brunei Darussalam">Brunei Darussalam</option> 
											<option value="Bulgaria">Bulgaria</option> 
											<option value="Burkina Faso">Burkina Faso</option> 
											<option value="Burundi">Burundi</option> 
											<option value="Cambodia">Cambodia</option> 
											<option value="Cameroon">Cameroon</option> 
											<option value="Canada">Canada</option> 
											<option value="Cape Verde">Cape Verde</option> 
											<option value="Cayman Islands">Cayman Islands</option> 
											<option value="Central African Republic">Central African Republic</option> 
											<option value="Chad">Chad</option> 
											<option value="Chile">Chile</option> 
											<option value="China">China</option> 
											<option value="Christmas Island">Christmas Island</option> 
											<option value="Cocos (Keeling) Islands">Cocos (Keeling) Islands</option> 
											<option value="Colombia">Colombia</option> 
											<option value="Comoros">Comoros</option> 
											<option value="Congo">Congo</option> 
											<option value="Congo, The Democratic Republic of The">Congo, The Democratic Republic of The</option> 
											<option value="Cook Islands">Cook Islands</option> 
											<option value="Costa Rica">Costa Rica</option> 
											<option value="Cote D'ivoire">Cote D'ivoire</option> 
											<option value="Croatia">Croatia</option> 
											<option value="Cuba">Cuba</option> 
											<option value="Cyprus">Cyprus</option> 
											<option value="Czech Republic">Czech Republic</option> 
											<option value="Denmark">Denmark</option> 
											<option value="Djibouti">Djibouti</option> 
											<option value="Dominica">Dominica</option> 
											<option value="Dominican Republic">Dominican Republic</option> 
											<option value="Ecuador">Ecuador</option> 
											<option value="Egypt">Egypt</option> 
											<option value="El Salvador">El Salvador</option> 
											<option value="Equatorial Guinea">Equatorial Guinea</option> 
											<option value="Eritrea">Eritrea</option> 
											<option value="Estonia">Estonia</option> 
											<option value="Ethiopia">Ethiopia</option> 
											<option value="Falkland Islands (Malvinas)">Falkland Islands (Malvinas)</option> 
											<option value="Faroe Islands">Faroe Islands</option> 
											<option value="Fiji">Fiji</option> 
											<option value="Finland">Finland</option> 
											<option value="France">France</option> 
											<option value="French Guiana">French Guiana</option> 
											<option value="French Polynesia">French Polynesia</option> 
											<option value="French Southern Territories">French Southern Territories</option> 
											<option value="Gabon">Gabon</option> 
											<option value="Gambia">Gambia</option> 
											<option value="Georgia">Georgia</option> 
											<option value="Germany">Germany</option> 
											<option value="Ghana">Ghana</option> 
											<option value="Gibraltar">Gibraltar</option> 
											<option value="Greece">Greece</option> 
											<option value="Greenland">Greenland</option> 
											<option value="Grenada">Grenada</option> 
											<option value="Guadeloupe">Guadeloupe</option> 
											<option value="Guam">Guam</option> 
											<option value="Guatemala">Guatemala</option> 
											<option value="Guinea">Guinea</option> 
											<option value="Guinea-bissau">Guinea-bissau</option> 
											<option value="Guyana">Guyana</option> 
											<option value="Haiti">Haiti</option> 
											<option value="Heard Island and Mcdonald Islands">Heard Island and Mcdonald Islands</option> 
											<option value="Holy See (Vatican City State)">Holy See (Vatican City State)</option> 
											<option value="Honduras">Honduras</option> 
											<option value="Hong Kong">Hong Kong</option> 
											<option value="Hungary">Hungary</option> 
											<option value="Iceland">Iceland</option> 
											<option value="India">India</option> 
											<option value="Indonesia">Indonesia</option> 
											<option value="Iran, Islamic Republic of">Iran, Islamic Republic of</option> 
											<option value="Iraq">Iraq</option> 
											<option value="Ireland">Ireland</option> 
											<option value="Israel">Israel</option> 
											<option value="Italy">Italy</option> 
											<option value="Jamaica">Jamaica</option> 
											<option value="Japan">Japan</option> 
											<option value="Jordan">Jordan</option> 
											<option value="Kazakhstan">Kazakhstan</option> 
											<option value="Kenya">Kenya</option> 
											<option value="Kiribati">Kiribati</option> 
											<option value="Korea, Democratic People's Republic of">Korea, Democratic People's Republic of</option> 
											<option value="Korea, Republic of">Korea, Republic of</option> 
											<option value="Kuwait">Kuwait</option> 
											<option value="Kyrgyzstan">Kyrgyzstan</option> 
											<option value="Lao People's Democratic Republic">Lao People's Democratic Republic</option> 
											<option value="Latvia">Latvia</option> 
											<option value="Lebanon">Lebanon</option> 
											<option value="Lesotho">Lesotho</option> 
											<option value="Liberia">Liberia</option> 
											<option value="Libyan Arab Jamahiriya">Libyan Arab Jamahiriya</option> 
											<option value="Liechtenstein">Liechtenstein</option> 
											<option value="Lithuania">Lithuania</option> 
											<option value="Luxembourg">Luxembourg</option> 
											<option value="Macao">Macao</option> 
											<option value="Macedonia, The Former Yugoslav Republic of">Macedonia, The Former Yugoslav Republic of</option> 
											<option value="Madagascar">Madagascar</option> 
											<option value="Malawi">Malawi</option> 
											<option value="Malaysia">Malaysia</option> 
											<option value="Maldives">Maldives</option> 
											<option value="Mali">Mali</option> 
											<option value="Malta">Malta</option> 
											<option value="Marshall Islands">Marshall Islands</option> 
											<option value="Martinique">Martinique</option> 
											<option value="Mauritania">Mauritania</option> 
											<option value="Mauritius">Mauritius</option> 
											<option value="Mayotte">Mayotte</option> 
											<option value="Mexico">Mexico</option> 
											<option value="Micronesia, Federated States of">Micronesia, Federated States of</option> 
											<option value="Moldova, Republic of">Moldova, Republic of</option> 
											<option value="Monaco">Monaco</option> 
											<option value="Mongolia">Mongolia</option> 
											<option value="Montserrat">Montserrat</option> 
											<option value="Morocco">Morocco</option> 
											<option value="Mozambique">Mozambique</option> 
											<option value="Myanmar">Myanmar</option> 
											<option value="Namibia">Namibia</option> 
											<option value="Nauru">Nauru</option> 
											<option value="Nepal">Nepal</option> 
											<option value="Netherlands">Netherlands</option> 
											<option value="Netherlands Antilles">Netherlands Antilles</option> 
											<option value="New Caledonia">New Caledonia</option> 
											<option value="New Zealand">New Zealand</option> 
											<option value="Nicaragua">Nicaragua</option> 
											<option value="Niger">Niger</option> 
											<option value="Nigeria">Nigeria</option> 
											<option value="Niue">Niue</option> 
											<option value="Norfolk Island">Norfolk Island</option> 
											<option value="Northern Mariana Islands">Northern Mariana Islands</option> 
											<option value="Norway">Norway</option> 
											<option value="Oman">Oman</option> 
											<option value="Pakistan">Pakistan</option> 
											<option value="Palau">Palau</option> 
											<option value="Palestinian Territory, Occupied">Palestinian Territory, Occupied</option> 
											<option value="Panama">Panama</option> 
											<option value="Papua New Guinea">Papua New Guinea</option> 
											<option value="Paraguay">Paraguay</option> 
											<option value="Peru">Peru</option> 
											<option value="Philippines">Philippines</option> 
											<option value="Pitcairn">Pitcairn</option> 
											<option value="Poland">Poland</option> 
											<option value="Portugal">Portugal</option> 
											<option value="Puerto Rico">Puerto Rico</option> 
											<option value="Qatar">Qatar</option> 
											<option value="Reunion">Reunion</option> 
											<option value="Romania">Romania</option> 
											<option value="Russian Federation">Russian Federation</option> 
											<option value="Rwanda">Rwanda</option> 
											<option value="Saint Helena">Saint Helena</option> 
											<option value="Saint Kitts and Nevis">Saint Kitts and Nevis</option> 
											<option value="Saint Lucia">Saint Lucia</option> 
											<option value="Saint Pierre and Miquelon">Saint Pierre and Miquelon</option> 
											<option value="Saint Vincent and The Grenadines">Saint Vincent and The Grenadines</option> 
											<option value="Samoa">Samoa</option> 
											<option value="San Marino">San Marino</option> 
											<option value="Sao Tome and Principe">Sao Tome and Principe</option> 
											<option value="Saudi Arabia">Saudi Arabia</option> 
											<option value="Senegal">Senegal</option> 
											<option value="Serbia and Montenegro">Serbia and Montenegro</option> 
											<option value="Seychelles">Seychelles</option> 
											<option value="Sierra Leone">Sierra Leone</option> 
											<option value="Singapore">Singapore</option> 
											<option value="Slovakia">Slovakia</option> 
											<option value="Slovenia">Slovenia</option> 
											<option value="Solomon Islands">Solomon Islands</option> 
											<option value="Somalia">Somalia</option> 
											<option value="South Africa">South Africa</option> 
											<option value="South Georgia and The South Sandwich Islands">South Georgia and The South Sandwich Islands</option> 
											<option value="Spain">Spain</option> 
											<option value="Sri Lanka">Sri Lanka</option> 
											<option value="Sudan">Sudan</option> 
											<option value="Suriname">Suriname</option> 
											<option value="Svalbard and Jan Mayen">Svalbard and Jan Mayen</option> 
											<option value="Swaziland">Swaziland</option> 
											<option value="Sweden">Sweden</option> 
											<option value="Switzerland">Switzerland</option> 
											<option value="Syrian Arab Republic">Syrian Arab Republic</option> 
											<option value="Taiwan, Province of China">Taiwan, Province of China</option> 
											<option value="Tajikistan">Tajikistan</option> 
											<option value="Tanzania, United Republic of">Tanzania, United Republic of</option> 
											<option value="Thailand">Thailand</option> 
											<option value="Timor-leste">Timor-leste</option> 
											<option value="Togo">Togo</option> 
											<option value="Tokelau">Tokelau</option> 
											<option value="Tonga">Tonga</option> 
											<option value="Trinidad and Tobago">Trinidad and Tobago</option> 
											<option value="Tunisia">Tunisia</option> 
											<option value="Turkey">Turkey</option> 
											<option value="Turkmenistan">Turkmenistan</option> 
											<option value="Turks and Caicos Islands">Turks and Caicos Islands</option> 
											<option value="Tuvalu">Tuvalu</option> 
											<option value="Uganda">Uganda</option> 
											<option value="Ukraine">Ukraine</option> 
											<option value="United Arab Emirates">United Arab Emirates</option> 
											<option value="United Kingdom">United Kingdom</option> 
											<option value="United States">United States</option> 
											<option value="United States Minor Outlying Islands">United States Minor Outlying Islands</option> 
											<option value="Uruguay">Uruguay</option> 
											<option value="Uzbekistan">Uzbekistan</option> 
											<option value="Vanuatu">Vanuatu</option> 
											<option value="Venezuela">Venezuela</option> 
											<option value="Viet Nam">Viet Nam</option> 
											<option value="Virgin Islands, British">Virgin Islands, British</option> 
											<option value="Virgin Islands, U.S.">Virgin Islands, U.S.</option> 
											<option value="Wallis and Futuna">Wallis and Futuna</option> 
											<option value="Western Sahara">Western Sahara</option> 
											<option value="Yemen">Yemen</option> 
											<option value="Zambia">Zambia</option> 
											<option value="Zimbabwe">Zimbabwe</option>  
                                        </select>
                        </td>
                      </tr>
                       <tr>
                        <td>Gender</td>
                        <td><select class="panel-title" name="gender" id="gender">
											<option value="Male" selected="selected">Male</option> 
											<option value="Female">Female</option> 
                                        </select></td>
                      </tr>
                       <tr>
                        <td>Age</td>
                        <td><input class="panel-title" type="text" value="<%out.print(u.getAge()); %>" name="age"></td>
                      </tr>
                    </tbody>
                  </table>
                  <input class="pointer" type="submit" name="submit" value="Edit Profile">
                  <input class="pointer" type="button" id="editprobackbtn" Value="back">
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-md-5  toppad  pull-right col-md-offset-3 ">
         <input class="pointer" type="button" id="editpassbtn" value="Edit Password">
           
       	<br>
		<p class=" text-info">May 05,2014,03:00 pm </p>
		  <div style=" float:left; max-width:200px; max-height: 200px;"class="col-md-3 col-lg-3 " align="center"> <img alt="User Pic" src="../images/FromDb.jpg" class="img-circle img-responsive"> 
          </div>
      </div>
      </form>
      </div>
      <div id="editpass">
     <form action="../EditProfile" method="post">
     	<table>
     	<tr>
     		<td>Enter Old Password</td>
     		<td><input type="password" name="oldpass"></td>
     	</tr>
     	<tr>
     		<td>Enter New Password</td>
     		<td><input type="password" name="editpass1"></td>
     	</tr>
     	<tr>
     		<td>Re-Type Password</td>
     		<td><input type="password" name="editpass2"></td>
     	</tr>
     	<tr>
     		<td><input class="pointer" type="submit" name="submit" value="Edit Password"></td>
     		<td><input class="pointer" type="button" id="editpassbackbtn" Value="back"></td>
     	</tr>
     	</table>
      </form>
      </div>
      
</div>
    
    
    
    
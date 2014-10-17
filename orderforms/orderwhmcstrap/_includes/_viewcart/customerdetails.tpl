<div class="panel panel-primary">

	<div class="panel-heading">
		<h3 class="panel-title">Your Webforward Account Login</h3>
	</div>

	<div class="panel-body">
		
		<div class="well well-sm">
			<p style="margin-top:10px;">Once you complete your order, we'll create a login account in our customer area for you to manage all your services with us. Please let us know your email address, and pick a password for your account. <strong>Are you a customer already?</strong> <a href="#" data-toggle="modal" data-target="#loginbox">Sign in here</a> to use your existing account billing details.</p>
		</div>
	
		<div class="row">
		
			<div class="col-md-12">
			
				<div class="form-group">
					<label>{$LANG.clientareaemail}</label>
					<input class="form-control" type="text" name="email"  value="{$clientsdetails.email}" />
				</div>
				
			</div>			

			<div class="col-md-6">
			
				<div class="form-group">
					<label>{$LANG.clientareapassword}</label>
					<input class="form-control" type="text" id="newpw" name="password" value="{$password}" />
				</div>
				
			</div>
			
			<div class="col-md-6">
			
				<div class="form-group">
					<label>{$LANG.clientareaconfirmpassword}</label>
					<input class="form-control" type="text" name="password2" value="{$password2}" />
				</div>
				
			</div>
			
		</div>
		
	</div>
	
</div>
	
<div class="panel panel-primary">

	<div class="panel-heading">
		<h3 class="panel-title">{$LANG.yourdetails}</h3>
	</div>

	<div class="panel-body">
		
		<div class="row">
		
			<div class="col-md-12">
			
				<div class="row">
				
					<div class="col-md-6">
			
						<div class="form-group">
							<label>{$LANG.clientareafirstname}</label>
							<input class="form-control" {if $loggedin} disabled {/if} type="text" name="firstname"  value="{$clientsdetails.firstname}" />
						</div>
					
					</div>
					
					<div class="col-md-6">
				
						<div class="form-group">
							<label>{$LANG.clientarealastname}</label>
							<input class="form-control" {if $loggedin} disabled {/if} type="text" name="lastname"  value="{$clientsdetails.lastname}" />
						</div>
					
					</div>
					
					<div class="col-md-12">
					
						<div class="form-group">
							<label>{$LANG.clientareacompanyname} <em>(Optional)</em></label>
							<input class="form-control" {if $loggedin} disabled {/if} type="text" name="companyname"  value="{$clientsdetails.companyname}" />
						</div>
						
						<hr>
						
					</div>
					
				</div>

			</div>
			
			
			
			<div class="col-md-6">
			
				<div class="form-group">
					<label>{$LANG.clientareaaddress1}</label>
					<input class="form-control" {if $loggedin} disabled {/if} type="text" name="address1"  value="{$clientsdetails.address1}" />
				</div>
				
				<div class="form-group">
					<label>{$LANG.clientareacity}</label>
					<input class="form-control" {if $loggedin} disabled {/if} type="text" name="city"  value="{$clientsdetails.city}" />
				</div>
				
				<div class="form-group">
					<label>{$LANG.clientareacountry}</label>
					<input class="form-control" {if $loggedin} disabled {/if} type="text" name="country" value="{$clientsdetails.country}" />
				</div>
				
				<div class="form-group">
					{if $loggedin} 
						{$clientcountrydropdown|replace:'name="country"':'name="country" class="form-control" disabled'|replace:'United States Outlying Islands':'US Outlying Islands'}
					{else}
						{$clientcountrydropdown|replace:'name="country"':'name="country" class="form-control"'|replace:'United States Outlying Islands':'US Outlying Islands'}
					{/if}
				</div>
				
			</div>
			
			<div class="col-md-6">
				
				<div class="form-group">
					<label>{$LANG.clientareaaddress2}</label>
					<input class="form-control" {if $loggedin} disabled {/if} type="text" name="address2"  value="{$clientsdetails.address2}" />
				</div>
				
				<div class="form-group">
					<label>{$LANG.clientareastate}</label>
					<input class="form-control" {if $loggedin} disabled {/if} type="text" name="state"  value="{$clientsdetails.state}" />
				</div>
				
				<div class="form-group">
					<label>{$LANG.clientareapostcode}</label>
					<input class="form-control" {if $loggedin} disabled {/if} type="text" name="postcode" value="{$clientsdetails.postcode}" />
				</div>
				
				<div class="form-group">
					<label>{$LANG.clientareaphonenumber}</label>
					<input class="form-control" {if $loggedin} disabled {/if} type="text" name="phonenumber" value="{$clientsdetails.phonenumber}" />
				</div>
				
			</div>
			
		</div>
		
	</div>

</div>
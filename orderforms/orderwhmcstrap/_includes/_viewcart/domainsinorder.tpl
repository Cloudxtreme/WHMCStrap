<div class="panel panel-primary">

	<div class="panel-heading">
		<h3 class="panel-title">{$LANG.domainregistrantinfo}</h3>
	</div>

	<div class="panel-body">
	
		<div class="well well-sm">
			<p style="margin-top:10px;">Since you're registering a domain name with your order, we need to know what contact details you'd like to associate with it. If you'd like your these details to differ from the ones you entered below, you can add separate registrant details here.</p>
		</div>
		
		<div class="row">
			
			<div class="col-md-6">
				
				<p><strong>{$clientsdetails.firstname} {$clientsdetails.lastname}</strong><br>
				{if $clientsdetails.clientareacompanyname} {$clientsdetails.clientareacompanyname} <br> {/if}
				
				{if $clientsdetails.address1} {$clientsdetails.address1} <br> {/if}
				
				{if $clientsdetails.address2} {$clientsdetails.address2} <br> {/if}
				
				{if $clientsdetails.city} {$clientsdetails.city} <br> {/if}
				
				{if $clientsdetails.state} {$clientsdetails.state} <br> {/if}
				
				{if $clientsdetails.country} {$clientsdetails.country} <br> {/if}
				
				{if $clientsdetails.postcode} {$clientsdetails.postcode} <br> {/if}
				
				{if $clientsdetails.phonenumber} {$clientsdetails.phonenumber} <br> {/if}
				
				</p>
				
			</div>
		
		</div>
	
		<div class="form-group">
			<label>{$LANG.domainregistrantchoose}</label>
			<select name="contact" id="domaincontact" onchange="domaincontactchange()" class="form-control">
				<option value="">{$LANG.usedefaultcontact}</option>
				{foreach from=$domaincontacts item=domcontact}
						<option value="{$domcontact.id}"{if $contact==$domcontact.id} selected{/if}>{$domcontact.name}</option>
				{/foreach}
				<option value="addingnew"{if $contact eq "addingnew"} selected{/if}>{$LANG.clientareanavaddcontact}...</option>
			</select>
		</div>
		
		
		<div id="domaincontactfields"{if $contact neq "addingnew"} style="display:none;"{/if}>
		
			<div class="row">
			
				<div class="col-md-6">
					<div class="form-group">
						<label>{$LANG.clientareafirstname}</label>
						<input class="form-control" type="text" name="domaincontactfirstname" value="{$domaincontact.firstname}" />
					</div>
				</div>
				
				<div class="col-md-6">
					<div class="form-group">
						<label>{$LANG.clientarealastname}</label>
						<input class="form-control" type="text" name="domaincontactlastname" value="{$domaincontact.lastname}" />
					</div>
				</div>
				
				<div class="col-md-12">
					<div class="form-group">
						<label>{$LANG.clientareacompanyname}</label>
						<input class="form-control" type="text" name="domaincontactcompanyname" value="{$domaincontact.companyname}" />
					</div>
					
					<hr>
				</div>
				
				<div class="col-md-6">
				
					<div class="form-group">
						<label>{$LANG.clientareaaddress1}</label>
						<input class="form-control" type="text" name="domaincontactaddress1" value="{$domaincontact.address1}" />
					</div>
					
					<div class="form-group">
						<label>{$LANG.clientareacity}</label>
						{$domaincontactcountrydropdown|replace:'name="domaincontactcountry"':'name="domaincontactcountry" class="form-control"'|replace:'United States Outlying Islands':'US Outlying Islands'}
					</div>
					
					<div class="form-group">
						<label>{$LANG.clientareacountry}</label>
						<input class="form-control" type="text" name="domaincontactcity" value="{$domaincontact.city}" />
					</div>
				
					<div class="form-group">
						<label>{$LANG.clientareaemail}</label>
						<input class="form-control" type="text" name="domaincontactemail" value="{$domaincontact.email}" />
					</div>
					
				</div>
				
				<div class="col-md-6">
				
					<div class="form-group">
						<label>{$LANG.clientareaaddress2}</label>
						<input class="form-control" type="text" name="domaincontactaddress2" value="{$domaincontact.address2}" />
					</div>
					
					<div class="form-group">
						<label>{$LANG.clientareastate}</label>
						<input class="form-control" type="text" name="domaincontactstate" value="{$domaincontact.state}" />
					</div>
					
					<div class="form-group">
						<label>{$LANG.clientareapostcode}</label>
						<input class="form-control" type="text" name="domaincontactpostcode" size="15" value="{$domaincontact.postcode}" />
					</div>
					
					<div class="form-group">
						<label>{$LANG.clientareaphonenumber}</label>
						<input class="form-control" type="text" name="domaincontactphonenumber" size="20" value="{$domaincontact.phonenumber}" />
					</div>
					
				</div>
				
			</div>
		
		</div>
		
	</div>
	
</div>
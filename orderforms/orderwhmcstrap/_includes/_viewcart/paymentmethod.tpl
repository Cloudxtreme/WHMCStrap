<div class="panel panel-primary">

	<div class="panel-heading">
		<h3 class="panel-title">{$LANG.orderpaymentmethod}</h3>
	</div>

	<div class="panel-body">
	
		<!-- PAYMENT OPTIONS -->
		{foreach key=num item=gateway from=$gateways}
		<label for="pgbtn{$num}" class="checkbox-inline">
			<input type="radio" name="paymentmethod" value="{$gateway.sysname}" id="pgbtn{$num}" onclick="{if $gateway.type eq "CC"}showCCForm(){else}hideCCForm(){/if}"{if $selectedgateway eq $gateway.sysname} checked{/if} /> {$gateway.name}
		</label>
		{/foreach}
		
		
		
		<!-- EXISTING CARD ON THE ACCOUNT -->
		{if $clientsdetails.cclastfour}
			<input type="radio" name="ccinfo" value="useexisting" id="useexisting" onclick="useExistingCC()"{if $clientsdetails.cclastfour} checked{else} disabled{/if} /> 
			<label for="useexisting">{$LANG.creditcarduseexisting}{if $clientsdetails.cclastfour} ({$clientsdetails.cclastfour}){/if}</label>
			
			<input type="radio" name="ccinfo" value="new" id="new" onclick="enterNewCC()"{if !$clientsdetails.cclastfour || $ccinfo eq "new"} checked{/if} /> 
			<label for="new">{$LANG.creditcardenternewcard}</label>
		{else}
			<input type="hidden" name="ccinfo" value="new" />
		{/if}
		
		<!-- INPUT FIELDS FOR CREDIT CARDS -->
		
		<div id="ccinputform"{if $selectedgatewaytype neq "CC"} style="display:none;"{/if}>
		
			<div class="newccinfo"{if $clientsdetails.cclastfour && $ccinfo neq "new"} style="display:none;"{/if}>
			
				<hr>
					
				<div class="row">
				
				
					<div class="col-md-12">
						<div class="form-group">
							<label>{$LANG.creditcardcardtype}</label>
							<select name="cctype" class="form-control">
								{foreach key=num item=cardtype from=$acceptedcctypes}
								<option{if $cctype eq $cardtype} selected{/if}>{$cardtype}</option>
								{/foreach}
							</select>
						</div>
					</div>
					
					<div class="col-md-6">
						<div class="form-group">
							<label>{$LANG.creditcardcardnumber}</label>
							<input class="form-control" type="text" name="ccnumber" size="30" value="{$ccnumber}" autocomplete="off" />
						</div>
						
						<div class="row">
						
							<div class="col-md-3">
								<span style="font-size:52px; color:#026eae;" class="icon icon-visa"></span>
							</div>
							
							<div class="col-md-3">
								<span style="font-size:52px; color:#0080c8;" class="icon icon-mastercard"></span>
							</div>
							
							<div class="col-md-3">
								<span style="font-size:52px; color:#b3cbd4;" class="icon icon-discover"></span>
							</div>
							
							<div class="col-md-3">
								<span style="font-size:52px; color:#e0b263;" class="icon icon-amex"></span>
							</div>
														
						</div>
					</div>
					
					<div class="col-md-6">
					
						<div class="row">
						
							<div class="col-md-6">
								<div class="form-group">
									<label>{$LANG.creditcardcardexpires}</label>
									<select name="ccexpirymonth" id="ccexpirymonth" class="newccinfo form-control">
										{foreach from=$months item=month}
										<option{if $ccexpirymonth eq $month} selected{/if}>{$month}</option>
										{/foreach}
									</select>
								</div>
								
							</div>
							
							<div class="col-md-6">
								<div class="form-group">
									<label>&nbsp;</label>
									<select name="ccexpiryyear" class="newccinfo form-control">
										{foreach from=$years item=year}
										<option{if $ccexpiryyear eq $year} selected{/if}>{$year}</option>
										{/foreach}
									</select>	
								</div>
								
							</div>
							
							<div class="col-md-12">
								<div class="form-group">
									<label>{$LANG.creditcardcvvnumber}</label>
									<input class="form-control" type="text" name="cccvv" value="{$cccvv}" size="5" autocomplete="off" /> 
									<a href="#" onclick="window.open('images/ccv.gif','','width=280,height=200,scrollbars=no,top=100,left=100');return false">{$LANG.creditcardcvvwhere}</a>
									{if $shownostore}<label><input type="checkbox" name="nostore" /> {$LANG.creditcardnostore}</label>{/if}
								</div>
							</div>
						
						</div>
						
						<!-- NEEDS SORTING -->
						{if $showccissuestart}
						<tr class="newccinfo"{if $clientsdetails.cclastfour && $ccinfo neq "new"} style="display:none;"{/if}><td>{$LANG.creditcardcardstart}</td><td><select name="ccstartmonth" id="ccstartmonth" class="newccinfo">{foreach from=$months item=month}<option>{$month}</option>{/foreach}</select> / <select name="ccstartyear" class="newccinfo">{foreach from=$years item=year}<option>{$year}</option>{/foreach}</select></td></tr>
						<tr class="newccinfo"{if $clientsdetails.cclastfour && $ccinfo neq "new"} style="display:none;"{/if}><td>{$LANG.creditcardcardissuenum}</td><td><input type="text" name="ccissuenum" value="{$ccissuenum}" size="5" maxlength="3" /></td></tr>
						{/if}
					
					</div>
					
					
				</div>
			
			</div>
		
		</div>
	
	</div>
	
</div>
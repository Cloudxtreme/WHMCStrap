{assign var="pageinfo" value="You're nearly there - this is the final step! We just need your payment and personal details, then we'll take care of the rest."}
{include file="orderforms/$carttpl/_includes/header.tpl" step=4 title=$LANG.checkout pageinfo=$pageinfo}

{assign var="showcart" value=true}

<!-- JAVASCRIPT -->
{include file="orderforms/$carttpl/_includes/_viewcart/js.tpl"}

<!-- WARNINGS ABOUT BUNDLES... YER I DONT KNOW WTF THIS IS -->
{if $bundlewarnings}
	<div class="errorbox" style="display:block;">
		<strong>{$LANG.bundlereqsnotmet}</strong><br />
		{foreach from=$bundlewarnings item=warning}
			{$warning}<br />
		{/foreach}
	</div>
{/if}

<!-- ERROR -->
{if $errormessage}
	<div class="alert alert-danger" role="alert">
		<button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
		<strong>Oh snap!</strong> {$errormessage|replace:'<li>':' &nbsp;#&nbsp; '} &nbsp;#&nbsp; 
	</div>
{elseif $promotioncode && $rawdiscount eq "0.00"}
	<div class="alert alert-info" role="alert">
		<button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
		<strong>Heads up!</strong> {$LANG.promoappliedbutnodiscount}
	</div>
{/if}


<div class="modal fade" id="loginbox">
  <div class="modal-dialog">
    <div class="modal-content">
		
			<form action="dologin.php" method="post">
			
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
					<h4 class="modal-title">Login</h4>
				</div>
				
				<div class="modal-body">

					<div class="form-group">
						<label>{$LANG.loginemail}</label>
						<input class="form-control" type="text" name="username" size="40" value="{$username}" />
					</div>
						
					<div class="form-group">
						<label>{$LANG.loginpassword}</label>
						<input class="form-control" type="password" name="password" size="25">
					</div>
					
				</div>
				
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="submit" class="btn btn-primary">{$LANG.loginbutton}</button>
				</div>
			
			</form>
			
    </div>
  </div>
</div>



<form method="post" action="{$smarty.server.PHP_SELF}?a=checkout" id="mainfrm">
	<input type="hidden" name="submit" value="true" />

	<!-- CUSTOMER DETAILS -->
	{if !$loggedin}
		{include file="orderforms/$carttpl/_includes/_viewcart/customerdetails.tpl"}
	{/if}

    <!-- CUSTOM FIELDS -->
    {if !$loggedin && ($customfields || $securityquestions)}
        {include file="orderforms/$carttpl/_includes/_viewcart/customfields.tpl"}
    {/if}
	
	<!-- ARE THERE DOMAINS NAME IN THE ORDER? -->
	{if $domainsinorder}
		{include file="orderforms/$carttpl/_includes/_viewcart/domainsinorder.tpl"}
	{/if}
	
	<!-- PAYMENT METHOD -->
	{include file="orderforms/$carttpl/_includes/_viewcart/paymentmethod.tpl"}
	
	{if $accepttos}
		<input type="checkbox" name="accepttos" id="accepttos" /> 
		<label for="accepttos">{$LANG.ordertosagreement} <a href="{$tosurl}" target="_blank">{$LANG.ordertos}</a></label>
	{/if}
	
	<p align="center">
		<button class="btn btn-primary" type="submit"{if $cartitems==0} disabled{/if} onclick="this.value='{$LANG.pleasewait}'">
			{$LANG.completeorder} &raquo;
		</button>
	</p>

</form>

{include file="orderforms/$carttpl/_includes/footer.tpl"}
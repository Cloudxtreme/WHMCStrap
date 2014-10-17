{if !$cartitems}

<table class="table table-striped table-bordered">

	<thead>
		<tr>
			<th>Description</th>
			<th>Price</th>
		</tr>
	</thead>
	
	<tbody>
		<tr>
			<td colspan="2">
				{$LANG.ordersummarybegin}
			</td>
		</tr>
	</tbody>
	
</table>

{else}

<table class="table table-striped table-bordered">

	<thead>
		<tr>
			<th>Description</th>
			<th>Price</th>
		</tr>
	</thead>
	
	<tbody>
	{foreach key=num item=product from=$products}
		<tr>
		
			<td>
				{$product.productinfo.groupname} - {$product.productinfo.name}
				{if $product.domain}<small>{$product.domain}</small><br />{/if}
				
				{if $product.configoptions}
				<small>{foreach key=confnum item=configoption from=$product.configoptions}- {$configoption.name}: {if $configoption.type eq 1 || $configoption.type eq 2}{$configoption.option}{elseif $configoption.type eq 3}{if $configoption.qty}{$LANG.yes}{else}{$LANG.no}{/if}{elseif $configoption.type eq 4}{$configoption.qty} x {$configoption.option}{/if}<br />{/foreach}</small>
				{/if}
				
				<small>
					<a href="{$smarty.server.PHP_SELF}?a=confproduct&i={$num}" class="cartedit">[{$LANG.carteditproductconfig}]</a> 
					<a href="#" onclick="removeItem('p','{$num}');return false">[Remove]</a>
				</small>
			</td>
			
			<td>{$product.pricingtext}{if $product.proratadate}<br />({$LANG.orderprorata} {$product.proratadate}){/if}</td>
		</tr>
		
		
		
		{foreach key=addonnum item=addon from=$product.addons}
		<tr>
			<td>
				{$LANG.orderaddon}
				{$addon.name}
			</td>
		
			<td>{$addon.pricingtext}</td>
		</tr>
		{/foreach}
		
	{/foreach}
	
	{foreach key=num item=addon from=$addons}
	<tr>
		<td>
			{$LANG.orderaddon}
			<em>{$addon.productname}{if $addon.domainname} - {$addon.domainname}{/if}</em>
			{$addon.name}
			
			<small>	
				<a href="{$smarty.server.PHP_SELF}?a=confdomains" class="cartedit">[{$LANG.cartconfigdomainextras}]</a>
				<a href="#" onclick="removeItem('a','{$num}');return false">[Remove]</a>
			</small>
		</td>
		
		<td>{$addon.pricingtext}</td>
	</tr>
	{/foreach}
	
	{foreach key=num item=domain from=$domains}
	<tr>
		<td>
			{if $domain.type eq "register"}
				{$LANG.orderdomainregistration}
			{else}
				{$LANG.orderdomaintransfer}
			{/if}<br />
			<small>{$domain.domain}<br />
			{$domain.regperiod} {$LANG.orderyears}<br />
			{if $domain.dnsmanagement}&nbsp;+ {$LANG.domaindnsmanagement}<br />{/if}
			{if $domain.emailforwarding}&nbsp;+ {$LANG.domainemailforwarding}<br />{/if}
			{if $domain.idprotection}&nbsp;+ {$LANG.domainidprotection}<br />{/if}
			</small>
			
			<small>
				<a href="{$smarty.server.PHP_SELF}?a=confdomains">[{$LANG.cartconfigdomainextras}]</a>
				<a href="#" onclick="removeItem('d','{$num}');return false">[Remove]</a>
			</small>
		</td>
		
		<td>{$domain.price}</td>
		
	</tr>	
	{/foreach}
	
	
	{foreach key=num item=domain from=$renewals}
	<tr>
		
		<td>
		{$LANG.domainrenewal}<br />
		<small>{$domain.domain}<br />
		{$domain.regperiod} {$LANG.orderyears}<br />
		{if $domain.dnsmanagement}&nbsp;+ {$LANG.domaindnsmanagement}<br />{/if}
		{if $domain.emailforwarding}&nbsp;+ {$LANG.domainemailforwarding}<br />{/if}
		{if $domain.idprotection}&nbsp;+ {$LANG.domainidprotection}<br />{/if}</small>
		
		<small>
			<a href="#" onclick="removeItem('r','{$num}');return false">[Remove]</a>
		</small>
		</td>
		
		<td>{$domain.price}	</td>
	
	</tr>
	{/foreach}
	
	
	<tr>
		<td>{$LANG.ordersubtotal}</td>
		<td><b>{$subtotal}</b></td>
	</tr>
	
	{if $taxrate}
	<tr>
		<td>{$taxname} @ {$taxrate}%</td>
		<td><b>{$taxtotal}</b></td>
	</tr>
	{/if}
	
	{if $taxrate2}
	<tr>
		<td>{$taxname2} @ {$taxrate2}%</td>
		<td><b>{$taxtotal2}</b></td>
	</tr>
	{/if}
	
	<tr>
		<td>{$LANG.ordertotalduetoday}</td>
		<td><b>{$total}</b></td>
	</tr>
	
	{if $promotype}
	<tr>
		<td>
			{$LANG.cartpromo} 
			<br>
			<small>
				<a href="#" onclick="removepromo();return false">[Remove]</a>
			</small>
		</td>
		<td><b>{$promovalue}{if $promotype eq "Percentage"}%{elseif $promotype eq "Fixed Amount"}{/if} {$promorecurring}</b></td>
	</tr>
	{else}
	<tr id="promocodeholder">
		<td colspan="3">
		<div class="input-group">
			<input type="text" class="form-control" id="promocode" placeholder="{$LANG.cartenterpromo}" name="promocode" />
			<span class="input-group-btn">
				<input class="btn btn-primary" type="submit" value="{$LANG.go}" />
			</span>
		</div><!-- /input-group -->
		</td>
	</tr>
	{/if}
	
	{if $totalrecurringmonthly || $totalrecurringquarterly || $totalrecurringsemiannually || $totalrecurringannually || $totalrecurringbiennially || $totalrecurringtriennially}
	<tr>
		<td>{$LANG.cartrecurringcharges}</td>
		<td>
		<strong>
		{if $totalrecurringmonthly}{$totalrecurringmonthly} <small>{$LANG.orderpaymenttermmonthly}</small><br />{/if}
		{if $totalrecurringquarterly}{$totalrecurringquarterly} <small>{$LANG.orderpaymenttermquarterly}</small><br />{/if}
		{if $totalrecurringsemiannually}{$totalrecurringsemiannually} <small>{$LANG.orderpaymenttermsemiannually}</small><br />{/if}
		{if $totalrecurringannually}{$totalrecurringannually} <small>{$LANG.orderpaymenttermannually}</small><br />{/if}
		{if $totalrecurringbiennially}{$totalrecurringbiennially} <small>{$LANG.orderpaymenttermbiennially}</small><br />{/if}
		{if $totalrecurringtriennially}{$totalrecurringtriennially} <small>{$LANG.orderpaymenttermtriennially}</small><br />{/if}
		</strong>
		</td>
	</tr>
	{/if}
	
	</tbody>

</table>
{/if}